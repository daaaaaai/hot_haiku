class Comment < ApplicationRecord
  validates :content, length: {in: 1..1000, message: 'は1文字以上1000文字内で入力してください。' }

  belongs_to :haiku
end
