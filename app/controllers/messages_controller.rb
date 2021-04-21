class MessagesController < ApplicationController
  # before_action :message_params, only: [:index,:create]
  before_action :message_trans, only: [:create]


  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end

  def create
    if @message.save
      redirect_to room_messages_path(@room)
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end



  def move_to_index
    unless user_signed_in
      redirect_to action: :index
    end 
  end

  private
  def message_params
    params.require(:message).permit(:content,:image).merge(user_id: current_user.id)
  end

  def message_trans
    client = Aws::Translate::Client.new(region: 'us-west-2')
    @room = Room.find(params[:room_id])
    @message = @room.messages.create(message_params)
    result = client.translate_text(text: @message.content, source_language_code: "ja", target_language_code: "en")

    @message.comment = result.translated_text
  end
end