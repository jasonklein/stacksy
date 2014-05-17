class AddSenderReadabilityAndRecipientReadabilityToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :sender_readability, :boolean, default: true
    add_column :messages, :recipient_readability, :boolean, default: true
  end
end
