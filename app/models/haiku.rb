class Haiku < ApplicationRecord
  validates:content, length: {in: 1..100, message: 'は1文字以上100文字内で入力してください。' }
  validates:author_name, length: {in: 1..20, message: 'は1文字以上100文字内で入力してください。' }
end
