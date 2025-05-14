class AddtableMessage < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :chat, null: false
      t.references :user, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
