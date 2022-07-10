class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_default_format
  before_action :authenticate_user!

  private

  def set_default_format
    request.format = :json
  end
end
