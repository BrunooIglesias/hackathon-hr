class SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :verify_authenticity_token

  protected

  def json_request?
    request.format.json?
  end
end
