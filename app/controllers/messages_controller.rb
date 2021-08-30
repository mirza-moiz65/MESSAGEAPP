class MessagesController < ApplicationController
    before_action :set_chat_room, only: %i[ create ]
    before_action :set_message, only: %i[ show ]
    
  def index
    @messages = Message.all
  end


  def create
    @message = @chat_room.messages.build(message_params)

    respond_to do |format|
      if current_user.messages << @message
        format.html { redirect_to chat_room_path(id: @chat_room.id), notice: "Message sent." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end
  def show
  end
  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:body)
  end
  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end
  def set_chat_room
    @message = ChatRoom.find(params[:id])
  end
end
