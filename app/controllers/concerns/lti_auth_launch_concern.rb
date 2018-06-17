# Required for LTI
require 'ims/lti'
# Used to validate oauth signatures
require 'oauth/request_proxy/action_controller_request'

module LtiAuthLaunchConcern
  extend ActiveSupport::Concern

  def is_oauth_valid?
    # Search for a ToolConsumer with the param 'key' equal to :
    # the result of getting the 'parameters' array from inside the 'request' object.
    # The 'request' object is provided by Ruby on Rails and has many data about the request received from the user browser
    tc = ToolConsumer.find_by key:request.parameters['oauth_consumer_key']

    if tc.present?
      authenticator = IMS::LTI::Services::MessageAuthenticator.new(request.url, request.request_parameters, tc.secret)
    else
      return false
    end

    # Check if the signature is valid
    if !authenticator.valid_signature?
      return false
    end

    # Check if the request timestamp was 5 minutes ago
    if DateTime.strptime(request.request_parameters['oauth_timestamp'],'%s') < 5.minutes.ago
      return false
    end

    # The provider request is valid
    # store the values you need from the LTI
    @lti_user = LtiUser.find_by lti_id:params.require(:user_id)

    @lti_context = LtiContext.find_or_create_by lti_id:params.require(:context_id)

    if params['roles'].include? 'Instructor'
      @lti_role = LtiRole.find_or_create_by name:'Instructor'
    elsif params['roles'].include? 'Learner'
      @lti_role = LtiRole.find_or_create_by name:'Learner'
    end

    if @lti_user.nil?
      @lti_user = LtiUser.create lti_id: params.require(:user_id),
      full_name: params.require(:lis_person_name_full),
      given: params['lis_person_name_given'],
      family: params['lis_person_name_family'],
      username: params['ext_user_username'],
      email: params['lis_person_contact_email_primary'],
      lti_context:@lti_context,
      lti_role:@lti_role
    end

  # @lti_user = @lti_user.first if @lti_user.class == Array

  # @lti_user.update lti_role:@lti_role

  if @lti_context
    @lti_context = LtiContext.update label:params['context_label'],
                                     title:params['context_title']
  end

  @tool_consumer = tc

    return true
    
  end

end