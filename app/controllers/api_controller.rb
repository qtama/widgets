class ApiController < ApplicationController
  before_action :authenticate
  before_action :require_json

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      ApiKey.find_by(key: token, deactivated_at: nil).present?
    end
  end

  def require_json
    return if request.format.json?

    head 406
  end
end
