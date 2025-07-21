class ChatMessage < ApplicationRecord
  belongs_to :user

  broadcasts_to ->(_) { "chat_messages" }, inserts_by: :append

  validates :content, presence: true
end
