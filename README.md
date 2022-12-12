# Docker ハンズオン
## 対象者
* Docker の概要は理解したがどう動かしたらいいかわからない人
* Dockerの基本的な操作方法がわからない人
* Dockerについて知りたい人

## Docker(ドッカー) について軽くおさらい
### Dockerって何？
* Docker（ドッカー）とはコンテナ型アプリケーションを実行するツールのこと
### コンテナって何？
- コンテナ（container）とは、サーバー内を整理してアプリケーションやWebの開発・管理を効率的に行えるようにするOSレベルの仮想化技術のこと
- コンテナはソフトウェアからの操作により開発環境を作成、編集、起動、破棄などを行うことができる。(Dockerの場合、Docker forDesktopが代表的)<br>
そのため人間が開発に必要なOSやライブラリを導入・設定して起動させることに比べ、簡単、迅速に特定の環境を構築したり別の環境に切り替えたりすることができる。
- 詳しくは以下の社内ドキュメントをご覧いただければと思います。<br>
https://keepalive.atlassian.net/wiki/spaces/KA/pages/292094138/Docker

## Dockerを利用できるようにセットアップする方法
- dockerを用いた開発を行うためにはまず、Docker forDesktopというアプリケーションをインストールする必要がある<br>
https://matsuand.github.io/docs.docker.jp.onthefly/desktop/
<br>

- 利用方法(Windows)
1. WSL2(Windows Subsystem for Linux 2)をインストールする
2. 「設定」でHyper-Vを有効にする
3. Docker forDesktopをインストールする

上記の具体的な手順は以下のリンクからご確認ください
<br>
https://sukkiri.jp/technologies/virtualizers/docker/docker-win_install.html
<br>

## 起動手順

### ①まず本アプリケーションを「git clone」する
```
git clone https://github.com/k-aSogen/dockerHandsOn.git
```
### ②cloneしたアプリケーションの階層に移動する
```
cd dockerHandsOn
```
###  dockerfileから独自のイメージをビルドする。
- 「-t」を使うことでイメージに名前を付けることができる
```
docker build -t nodejs-docker .
```
### nodejs-docker のタグが付いたイメージを利用してコンテナ起動
- コンテナ名は、--nameオプションを利用してつけることができる
- 「-p」でコンテナ起動させるポートを設定する
```
docker run --name giken -p 3000:3000 nodejs-docker
```

### コンテナ終了方法
```
//「stop」コンテナ正常終了
docker stop giken
// 「kill」コンテナ強制終了
docker kill giken
```

### dockerコンテナ中身確認方法
```
docker exec -it giken sh
```
