class CreateJoinTableChatRoomUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :chat_rooms do |t|
      # t.index [:user_id, :char_room_id]
      # t.index [:char_room_id, :user_id]
    end
  end
end
