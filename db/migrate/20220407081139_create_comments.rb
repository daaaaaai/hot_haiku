class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :haiku
      t.text :content
      t.string :name
      t.timestamps
    end
  end
end
