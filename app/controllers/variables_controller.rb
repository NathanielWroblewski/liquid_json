class VariablesController < ApplicationController
  def create
    variable = Variable.new(variable_params)
    if variable.save
      response = { success: true, variable: {
        name: variable.name,
        path: variable.path
      }}
    else
      response = { success: false }
    end
    render json: response
  end

  private

  def variable_params
    params.require(:variable).permit(:path, :name, :route_id)
  end
end
