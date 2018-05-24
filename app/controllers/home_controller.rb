# Required for LTI
require 'ims/lti'
# Used to validate oauth signatures
require 'oauth/request_proxy/action_controller_request'

class HomeController < ApplicationController
  before_action :authenticate_admin!, :except => [:main]

  def launch
    authenticator = IMS::LTI::Services::MessageAuthenticator.new(request.url, request.request_parameters, 'secret')

    # Check if the signature is valid
    if !authenticator.valid_signature?
      render :launch_error, status: 401
      return
    end

    # Check if the request timestamp was 5 minutes ago
    if DateTime.strptime(request.request_parameters['oauth_timestamp'],'%s') < 5.minutes.ago
      render :launch_error, status: 401
      return
    end

    # The providre request is valid
    # store the values you need from the LTI
    # here we're just tossing them into the session
    session[:user_id] = params.require :user_id
    session[:lis_person_name_full] = params.require :lis_person_name_full

    # set variables for use by the template
    @lis_person_name_full = session[:lis_person_name_full]
  end

  def main

  end

  def dashboard

  end

  def test_oauth

  end

end