class AddLikeOnHaiku < ActiveRecord::Migration[7.0]
  def change
    add_column :haikus, :like_count, :integer, nil: false, default: 0, after: :author_name, comment: "お気に入り"
  end
end
