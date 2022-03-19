class CreateHaikus < ActiveRecord::Migration[7.0]
  def change
    create_table :haikus do |t|
      t.string :content, nil: false, limit: 100, comment: "本文"
      t.string :author_name, nil: false, limit: 20, comment: "詠み人"

      t.timestamps
    end
  end
end
