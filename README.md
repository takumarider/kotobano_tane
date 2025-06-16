https://gyazo.com/de3cb29bee32b96c8f5c6fc46dbbeaf4
https://gyazo.com/f6892f0845529a03e11748ce18968b70

保護者コメント機能
https://gyazo.com/777cf0b409f16d63eace79843eb3908c

##データベース設計
childrenテーブル
|  カラム名  	| データ型 	|                      説明                     	|
|:----------:	|:--------:	|:------------------------------------------:	|
| id         	| bigint   	| 主キー（自動生成）                            	|
| name       	| string   	| 子どもの名前                                  	|
| birthday   	| date     	| 子どもの誕生日                                	|
| age        	| integer  	| 子どもの年齢（※誕生日から自動算出しても良い）      	|
| created_at 	| datetime 	| 作成日時（自動）                              	|
| updated_at 	| datetime 	| 更新日時（自動）                              	|

parentテーブル
|  カラム名  	| データ型 	|           説明           	|
|:----------:	|:--------:	|:------------------------:	|
| id         	| bigint   	| 主キー                   	|
| email      	| string   	| Deviseによるメール認証   	|
| password   	| string   	| Deviseでハッシュ化される 	|
| created_at 	| datetime 	| 作成日時                 	|
| updated_at 	| datetime 	| 更新日時                 	|
| updated_at 	| datetime 	| 更新日時（自動）         	|

commentテーブル
|  カラム名  	| データ型 	|           説明           	|
|:----------:	|:--------:	|:------------------------:	|
| id         	| bigint   	| 主キー                   	|
| memo_id    	| bigint   	| 対象のメモID             	|
| parent_id  	| bigint   	| コメント投稿者（保護者） 	|
| body       	| text     	| コメント本文             	|
| created_at 	| datetime 	| 作成日時                 	|
| updated_at 	| datetime 	| 更新日時                 	|
| updated_at 	| datetime 	| 更新日時                 	|

memoテーブル
|  カラム名  	| データ型 	|             説明             	|
|:----------:	|:--------:	|:----------------------------:	|
| id         	| bigint   	| 主キー                       	|
| child_id   	| bigint   	| childrenテーブルとの外部キー 	|
| title      	| string   	| メモのタイトル               	|
| body       	| text     	| メモ本文                     	|
| category   	| string   	| メモのカテゴリ               	|
| created_at 	| datetime 	| 作成日時                     	|
| updated_at 	| datetime 	| 更新日時                     	|

##画面遷移図
https://gyazo.com/86e7b84b833b791ac39880591fd8ec2e

#開発環境
フレームワーク：Ruby on Rails 7.x
DB：MySQL
フロントエンド：Hotwire（Turbo/Stimulus）
ユーザー認証：Devise
セッション管理：Railsセッション（子ども）

##ローカルでの動作方法
git clone https://github.com/yourusername/child_login_app.git
cd child_login_app
rails db:create
rails db:migrate
rails s

##工夫したポイント
子どもの簡易ログインによるUX向上
（自身でログインができること、覚えておくべき自分の個人情報を記入できるようにした）
保護者のコメントに定義テンプレートを導入
Turbo対応によるスムーズな操作性


##改善点
ログイン失敗時のエラーメッセージ改善
実際に子どもに操作してもらい、意見を反映させながら、実装した。子供目線のUI

##制作時間
約36時間（設計含む）