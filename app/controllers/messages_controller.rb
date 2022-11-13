class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def new
    @messages = Message.new
  end

  def show
    @message = Message.all
  end

  def create
    @message = Message.new(message_params)

    @message.account = current_account

    if !@message.save
      flash[:notice] = @message.errors.full_messages.to_sentence
    else
      redirect_to request.referrer
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end