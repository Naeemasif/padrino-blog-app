class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.integer :post_id
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
