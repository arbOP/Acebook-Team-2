class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.integer :user_id
      t.string :content
      t.datetime :created_at
    end
  end
end
