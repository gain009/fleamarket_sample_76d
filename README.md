# README

fleamarketとは
 
 フリーアプリのクローンウェブアプリになります。
 実際にログイン・ログアウト、商品の出品・購入が可能となっております。
 アプリケーション概要
フリーマーケットのアプリケーションを作成しました。
接続先情報
http://54.178.94.112/
ID/Pass
ID: 76teamC
Pass: 76osakateamC
テスト用アカウント等
購入者用
メールアドレス: 76teamC@gmail.com
パスワード: 76teamosakaC
購入用カード情報
番号：378282246310005
期限：24(年)/12(月)
セキュリティコード：123
出品者用
メールアドレス名: 7676teamC@gmail.com
パスワード: 76teamosakaC
Githubリポジトリ
https://github.com/gain009/sample-market

開発状況
開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
開発期間と平均作業時間
開発期間：6/2〜6/24(23日間)
1日あたりの平均作業時間：約9時間
開発体制
人数：5名
アジャイル型開発（スクラム）
Trelloによるタスク管理

動作確認方法
Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
出品方法は以下の手順で確認できます
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
購入方法は以下の手順で確認できます
テストアカウントでログイン→トップページからスクロールダウン→ピックアップカテゴリーから商品選択→商品購入
画像
![ピックアップカテゴリー](https://imgur.com/vE1HKpL "サンプル")

確認後、マイページのサイドバーからログアウトをお願いします。


開発担当箇所
担当箇所一覧と確認方法
DB設計
ER図の雛形の作成
マイページ(フロントエンド)
ユーザー登録もしくはテスト用アカウントでログインしていただきます。
http://54.178.94.112/users/idにアクセスするとご覧いただけます。

![マイページ](https://imgur.com/Mg3tCi9 "サンプル")

○マイページのサイドバーから各ページへ移動することも出来ます。
![サイドバー移動](https://imgur.com/F8aZyck "サンプル")

クレジットカード登録確認ページ(フロントエンド)
出品用アカウントでログイン後、マイページのお支払い方法からご覧いただけます。
・クレジットカード登録から確認画面まで
![クレジットカード登録](https://imgur.com/2mUS2k7 "サンプル")

・クレジットカード削除から登録画面まで
![クレジットカード削除から登録まで](https://imgur.com/5dO9aO8 "サンプル")

・クレジットカード削除からマイページまで
![クレジットカード削除からマイページまで](https://imgur.com/TZusZSW "サンプル")

ルーティングの設定(バックエンド)

商品購入機能（バックエンド）
登録されたクレジットカードを使用して、商品購入を完了させます。
![購入完了](https://imgur.com/443k7st "サンプル")


購入者用アカウントでログイン後、適当な商品を選択することで商品購入画面へ進めます。クレジットカード情報は、あらかじめ入力されていますが、カード削除後に入力を求められた際は、上記の購入用カード情報を入力することで購入できます。

各担当箇所の詳細
 DB設計
概要
各メンバーを交えて、必要なテーブル、カラムを選定
テーブル間のアソシエーションの決定
担当内容
ER図の雛形の作成
各テーブルの詳細情報の決定・作成
モデルへのアソシエーションの確認と記述

マイページ
○概要
サイドバーとユーザー名と新着情報を表示させるページ
サイドバーの各項目をクリックすると、それに対応したページに飛ぶように設定
担当内容（フロントエンド）
haml,scssを使用しマイページ・ログアウト画面のマークアップ作業
支払い方法の欄を、クレジットカード登録が済んでいない場合はカード登録画面を、済んでいる場合はカード確認画面を表示するように設定
![クレジットカード情報入力](https://imgur.com/zilLLz6 "サンプル")
![支払い方法](https://imgur.com/12wdS26 "サンプル")


商品購入機能
概要
商品をクレジットカード決済を用いて購入する機能
担当内容（バックエンド）
クレジットカードへのアクセスキーを保存するモデル、コントローラ、ルーティングの作成
外部決済サービスpayjp(https://pay.jp/)を導入し、クレジットカード登録時にpayjp側で作成したアカウントへカード情報と顧客情報を新規作成
登録した情報のトークン化処理(第３者にカード情報が漏れないように暗号化)を実行
APIキーを利用してpayjp側からクレジットカード情報を取得し、ユーザーのカード情報(カード番号の下4桁と有効期限)を表示する機能の実装
商品購入時にpayjpの自分のカードを使用し、決済が完了するまでの機能を実装

開発を通じて得られた知見
工夫した点
①チームとして工夫を行った点
DB設計
 必要なテーブル、カラムを選定をスムーズに行うために、最初のチームミーティング前にER図の雛形を作成しました。最初に枠組みを作ることで、必要なカラム、テーブル間の繋がりをイメージしやすくなり、結果として、カラムの設定や制限をスムーズに決定し、メンバー全員で共有することが出来ました。
![ER図](https://imgur.com/29FTuAM "サンプル")

②個人として工夫を行った点
マイページのサイドバーを例にとると、1行ずつ作成すると、図.1のように冗長になりがちなので、図.2のように配列を利用することで、各所で可読性の向上を目指しました。
図.1
![配列を使用しない場合](https://imgur.com/AY6Dd0e "サンプル")

図.2
![配列を使用した場合](https://imgur.com/gzJEvcq "サンプル")

苦労した点
①credentials.yml.encの取り扱い
商品購入機能の実装に際し、PAY.JPのAPIキーをcredentials.yml.encに記述することまでは知っていましたが、正規の記述方法を知らず、そのままAPIキーを記述したことから、『No API key provided.』というエラーが発生してしまいました。マイナーなエラーなので、検索を行っても、原因と解決がなかなか把握できず、ファイルの記述方法の間違いが原因ということ、ファイルを一旦破棄してrails credentials:editコマンドで作り直すことが最も早い解決方法だということを発見するのに時間がかかってしまいました。
②複数の参考記事の咀嚼
Pay.jpを用いた商品購入機能の難易度が高いことから、複数の記事を参照しましたが、それぞれの記事の執筆者・時期・バージョン等の違いを把握せずにコーディングを行ったことから、ファイル間の齟齬やエラーが頻発する結果を招いてしまいました。
製作中に最も頭を悩ませたのは、credentials.yml.encにおけるAPIキーの記述とクレジットカードのコントローラーでのAPIキーの呼び出し方の違いに関するものです。最初は、APIキーの記述を正規に行っていれば、呼び出し方に関しては、細かく考えなくても大丈夫だろうという考え方で行ったため、先述と同様の『No API key provided.』エラーが発生させてしまいました。

以下は、APIの記述と呼び出し方の関係性を把握しなおしたコードで2パターンあることがわかりました。今回のアプリでは図.4を用いて記述しています。

図.3
![記述その１](https://imgur.com/SgtYyDf "サンプル")
![]( "サンプル")

図.4
![記述その２](https://imgur.com/iN6kORI "サンプル")

今回のような状況を陥らないために以下の点を心がけました。
Ⅰ.記事で使用されている開発環境のバージョンの確認を行うこと。
Ⅱ.自身の開発環境の確認とバージョン選択・更新を慎重に行うこと。
バージョンの違いによって、新たに使用可能になった記述、逆に使用不可能になった記述、バージョンのアップデートによって変化したファイル・ディレクトリの構成の変化をしっかり把握することが開発の最初の一歩で転ばないために必要なことだと実感しました。

③GitHubにかける時間の削減
コンフリクトやブランチの選択ミスで作業中のブランチが消えてしまうという事態を恐れていたため、コミットの回数が少なくなってしまいました。
その結果、一度のコミットで発生するコンフリクトが大量であったことから、該当箇所の確認と必要な記述の選択に時間をかける結果となってしまいました。
以上の経験から、コミットのペースをある程度早めること。コンフリクト箇所で残すべき記述を把握するために、コメントを積極的に利用することやチームメンバーと即座に連絡できる体制を整えることで、修正スピードを早めることが可能だと考え、修正作業の時間を減らすことに取り組むことが出来ました。
以上


* 作成者:川浪裕太郎他
* 所属:TECHCAMP76期Cチーム
* E-mail:o76.kawanami.yutaro@gmail.com
## ER図
<img width="479" alt="de297f3d6d527442a00903dc81df4454" src="https://user-images.githubusercontent.com/64832157/83985356-e1a15000-a973-11ea-8e15-474c975ecdef.png">

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, index: true|
|encrypted_password|string|null: false|
|user_image|string||
|introduction|text||
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|

### Association
- has_many :items
- has_one :destination
- has_one :card

## destinationsテーブル
|Column|Type|Options|
|------|----|-------|
|destination_family_name|string|null: false|
|destination_first_name|string|null: false|
|destination_family_name_kana|string|null: false|
|destination_first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|integer|null: false, foreign_key: true, index: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|description|string|null: false|
|status|string|null: false|
|size|string|null: false|
|shipping_cost|integer|null: false|
|shipping_method|integer|null: false|
|shipping_date|sinteger|null: false|
|prefecture_id|integer|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
### Association
- has_many :items
