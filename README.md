# Simple React + Vite (Node 開発用)

このリポジトリは `node:18-alpine` コンテナ上で Vite を使って React 開発サーバを起動する最小構成です。

前提: Docker が動作していること。

開発手順:

1) （任意）ホストの `node_modules` を削除してクリーンに:
```powershell
Remove-Item -Recurse -Force .\node_modules
```

2) コンテナ内で依存インストールと開発サーバ起動:
```bash
docker-compose run --rm app npm install
docker-compose up app
```

ブラウザで http://localhost:5173 を開いてください。

ビルドして静的ファイルを配信するには:
```bash
npm run build
# （必要に応じて nginx などで配信する Dockerfile を追加してください）
```

