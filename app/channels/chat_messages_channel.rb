class ChatMessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_messages"
    Rails.logger.info "✅ Subscribed to chat_messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
