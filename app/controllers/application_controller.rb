class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :basic

  private
  def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == ENV['BASIC_USER'] && pass == ENV['BASIC_PASS']
    end
  end
end
