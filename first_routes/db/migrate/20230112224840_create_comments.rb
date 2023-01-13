class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false
      t.references :artwork, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
