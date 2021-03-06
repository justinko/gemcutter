class Api::V1::DependenciesController < ApplicationController
  def index
    gem_list = params[:gems].split(',')

    if gem_list.size <= Dependency::LIMIT
      render :text => Marshal.dump(Dependency.for(gem_list))
    else
      render :text   => "Too many gems to resolve, please request less than #{Dependency::LIMIT} gems",
             :status => :request_entity_too_large
    end
  end
end
