class PermissionController < ApplicationController
  def index
    # TODO, entity_list should be moved to config file
    @entity_list=[:book, :movie, :song]
  end
end
