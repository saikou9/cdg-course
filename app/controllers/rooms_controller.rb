class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def new
    @rooms = Room.new
  end

  def show
    @rooms = Room.all
    render 'index'
  end

  def create
    @room = Room.new(room_params)

    if !@room.save
      flash[:notice] = @room.errors.full_messages.to_sentence
    else
      redirect_to @room
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end