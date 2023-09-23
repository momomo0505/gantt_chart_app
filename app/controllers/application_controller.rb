class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :set_beginning_of_week

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "2222"
    end
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end