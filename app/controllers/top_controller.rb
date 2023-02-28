class TopController < ApplicationController
  
  def index
    @lists = List.where(user: current_user).order(:position)
    @cards = Card.all.order(:position)
  end

  def move_higher
    Card.find(params[:id]).move_higher
    redirect_to action: :index
  end
  
  def move_lower
    Card.find(params[:id]).move_lower
    redirect_to action: :index
  end

  def move_left
    List.find(params[:id]).move_higher
    redirect_to action: :index
  end

  def move_right
    List.find(params[:id]).move_lower
    redirect_to action: :index
  end

end
