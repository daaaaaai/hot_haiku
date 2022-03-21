class Haiku < ApplicationRecord
  validates :content, length: {in: 1..100, message: 'は1文字以上100文字内で入力してください。' }
  validates :author_name, length: {maximum: 50, message: 'は50文字以内で入力してください。' }

  DEFAULT_NAME = "詠み人知らず".freeze

  def author_name=(val)
    self['author_name'] = val.blank? ? DEFAULT_NAME : val
  end

  # ほんとはlikeはだれがいつlikeしたかというイベントを記録しておきたいが、
  # herokuで1万レコードまでなのでlike_countカラムをインクリメント。同時実行は気にしない。
  def like!
    update(like_count: like_count + 1)
  end
end
