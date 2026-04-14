# Vite + React + Bun (開発用)

このリポジトリは Bun 上で Vite を使い React を起動する最小構成です。Docker Compose で開発サーバを起動します。

前提: Docker が動作していること。

開発手順:

1) 依存インストール（コンテナ内で bun install を実行）
```bash
docker-compose run --rm dev bun install
```

2) 開発サーバ起動（ビルドせずに開発サーバを起動）

- `dev` サービス（開発用途、ホットリロード、ポート5173）:
```bash
docker-compose up dev
```

- `web` サービス（ビルドせず Bun 上で Vite を起動、ホストのポート80で公開）:
```bash
docker-compose up web
```

ブラウザで以下にアクセスしてください:

- `dev` サービス: http://localhost:5173
- `web` サービス: http://localhost

ローカルで bun を使う場合:
```bash
bun install
bun x --bun vite --host
```
