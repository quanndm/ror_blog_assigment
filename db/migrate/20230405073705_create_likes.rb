class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :user_name
      t.references  :likeable, polymorphic: true
      t.timestamps
    end
  end
end
