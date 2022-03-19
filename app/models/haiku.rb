class Haiku < ApplicationRecord
  validates:content, length: {in: 1..100, message: 'は1文字以上100文字内で入力してください。' }

  def author_name=(val)
    self['author_name'] = val.blank? ? "詠み人知らず" : val
  end
end