class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    route = Route.create(route_id: Digest::SHA2.new.to_s)
    redirect_to '/routes/' + route.route_id
  end

  def test
  end
end
