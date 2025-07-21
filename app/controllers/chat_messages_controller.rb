class ChatMessagesController < ApplicationController
  before_action :set_user

  def index
    @chat_messages = ChatMessage.includes(:user).order(created_at: :asc)
    @chat_message = ChatMessage.new
  end

  def create
    @chat_message = @user.chat_messages.new(message_params)

    if @chat_message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to chat_messages_path }
      end
    end
  end

  private

  def set_user
    @user = User.first
  end

  def message_params
    params.require(:chat_message).permit(:content)
  end
end
