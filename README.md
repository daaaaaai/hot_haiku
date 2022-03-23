# これはなに？

Ruby on Rails7 の目玉機能であり、フロントエンド開発に一石を投じる Hotwire で遊んでみるプロジェクトです。

自由に俳句を投稿できるアプリケーションです。

Heroku(Hobby plan) にデプロイしているのでまず使い勝手を試してみてください。

https://hothaiku.herokuapp.com/

なんとなく Bootstrap5 を使っています。

適当利用規約で適当運用です。ご容赦を。予告なくクローズすることがあります。

# Hotwireについて

さまざまな方の記事を参考にしました。多謝。

あるコードの記述を参考にした際はその記事のURLを貼ったりしています。

- 俳句投稿時に追加するのは Turbo Stream を用いています。
- 俳句投稿後やバリデーションエラー発生時に、 flash を利用しています。この flash イベントを受け取った際に Toast を表示しています
- ハートマーククリックでの数字更新は Turbo Stream ですが、アニメーションは Stimulus で class を追加しています。

PRやコメント・ご提案など歓迎です。

# これからやりたいこと

- haiku 個別ページをつくって SNS で共有できるようにする（ モーダルでつくるといまっぽい？）
- Stimulus をもっといい事例でつかう（ リアルタイムバリデーションとか？ ）
- クライアントで 詠み人情報を保持するようにする
- ランキングつくる
- 返句を詠めるようにする（自己相関テーブルがいいだろうか）

# 動作条件
Ruby 3.0.3
Ruby on Rails 7.0.2.3

node そこそこ新しいもの
yarn (なぜかRailsでデフォルトとして指定)
Postgresql 9.3以上が必要（heroku利用のため）

# 動かし方

```
git clone https://github.com/daaaaaai/hot_haiku
cd hot_haiku
bundle install
bin/rails db:create
bin/rails db:migrate
bin/dev
```

js がビルドされないときは yarn build 、
css がビルドされないときは yarn build:css
を使ってください
