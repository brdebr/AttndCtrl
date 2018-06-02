class LtiController < ApplicationController
  include LtiAuthLaunchConcern
  skip_before_action :verify_authenticity_token

  def launch

    render :launch_error, status: 401 unless is_oauth_valid?

  end

end