class DogsController < ApplicationController
  def index
    @dogs = Dog.all
    render :json => @dogs
  end
  
  def nearby
    @dates = Dog.near([params[:latitude],params[:longitude]],500000)
    render :json => @dates
  end
end
