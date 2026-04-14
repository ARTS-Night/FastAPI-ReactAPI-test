# Vite + React + Bun (開発用)

このリポジトリは Bun 上で Vite を使い React を起動する最小構成です。Docker Compose で開発サーバを起動します。

前提: Docker が動作していること。

開発手順:

1) 依存インストール（コンテナ内で bun install を実行）
```bash
docker-compose run --rm dev bun install
```

2) 開発サーバ起動
```bash
docker-compose up dev
```

ブラウザで http://localhost:5173 を開いて確認してください。

ローカルで bun を使う場合:
```bash
bun install
bun x --bun vite --host
```
