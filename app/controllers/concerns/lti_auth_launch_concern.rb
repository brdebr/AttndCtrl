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
    # here we're just tossing them into the session
    session[:user_id] = params.require :user_id
    session[:lis_person_name_full] = params.require :lis_person_name_full

    # set variables for use by the template
    @lis_person_name_full = session[:lis_person_name_full]
    @tool_consumer = tc;

    return true;
  end

end