FROM node:16-alpine3.15

# １アプリケーションディレクトリを作成する
WORKDIR /var/www

# ２アプリケーションの依存関係をインストールする
COPY package*.json ./
RUN npm install

# ３アプリケーションコードをバンドルする
COPY . .

# ４外部に公開するポートを明示する
EXPOSE 3000

# ５アプリケーションを実行する
CMD ["node", "server.js"]