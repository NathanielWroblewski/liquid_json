class RoutesController < ApplicationController

  def show
    @route = Route.find_by(route_id: params[:id])
  end

  def update
    route = Route.find_by(route_id: params[:id])
    if route.update(route_params)
      response = { success: true, route: {
        markdown: route.markdown,
        liquid: route.liquid,
        json_url: route.json_url
      }}
    else
      response = { success: false }
    end
    render json: response
  end

  def embed
    headers['Content-Type'] = 'application/javascript'
    @route = Route.find_by(route_id: params[:id])
    render :embed, layout: false
  end

  private

  def route_params
    params.require(:route).permit(:markdown, :json_url)
  end
end
