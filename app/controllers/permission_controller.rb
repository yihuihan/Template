class PermissionController < ApplicationController
  def index
    # TODO, entity_list should be moved to config file
    @entity_list=[:book, :movie, :song]
    @permission_list=[:read, :create, :update, :delete]
  end

  def update
    byebug
    redirect_to permission_path
  end
end
