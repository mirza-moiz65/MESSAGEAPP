class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room
  belongs_to :message, optional: true
end
