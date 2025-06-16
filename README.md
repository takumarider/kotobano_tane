# ことばのたね

子どもの言葉や感情を記録・共有するためのアプリケーションです。

## 機能

### 子どものプロフィール管理
- 子どもの基本情報（名前、年齢、性別）の登録・編集
- 子どものプロフィール画像のアップロード
- 子どもの一覧表示

### メモ機能
- 子どもの言葉や感情をメモとして記録
- カテゴリー分け（ことば、きもち、がっこう、おうち、ともだち、その他）
- 画像の添付機能
- メモの検索機能
- メモの並び替え機能（新着順、古い順、タイトル順）

### コメント機能
- メモへのコメント投稿
- コメントの編集・削除

## 技術スタック

### バックエンド
- Ruby 3.3.0
- Rails 7.1.3
- PostgreSQL 15.5

### フロントエンド
- HTML/CSS
- JavaScript
- Tailwind CSS

### テスト
- RSpec
- FactoryBot
- Faker

### 開発環境
- Docker
- Docker Compose

## セットアップ手順

1. リポジトリのクローン
```bash
git clone https://github.com/yourusername/kotobano_tane.git
cd kotobano_tane
```

2. 環境変数の設定
```bash
cp .env.example .env
# .envファイルを編集して必要な環境変数を設定
```

3. Dockerコンテナの起動
```bash
docker compose up -d
```

4. データベースのセットアップ
```bash
docker compose exec web rails db:create
docker compose exec web rails db:migrate
```

5. テストの実行
```bash
docker compose exec web bundle exec rspec
```

## 開発環境の起動

```bash
docker compose up -d
```

アプリケーションは http://localhost:3000 でアクセス可能です。

## テスト

## モデル設計

### Child（子ども）
- 名前（必須）
- 年齢（必須）
- 性別（必須）
- プロフィール画像（任意）

### Memo（メモ）
- タイトル（必須）
- 本文（必須）
- カテゴリー（必須、定義済みのカテゴリーから選択）
- 画像（複数枚添付可能）
- 子どもとの関連付け（必須）

### Comment（コメント）
- 本文（必須）
- メモとの関連付け（必須）

## ライセンス

MIT License