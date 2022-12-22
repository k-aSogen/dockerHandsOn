# Docker ハンズオン
## 対象者
* Docker の概要は理解したがどう動かしたらいいかわからない人
* Dockerの基本的な操作方法がわからない人
* Dockerについて知りたい人

## この資料の目的
* Docker の基本的な操作を覚える
* Docker で使われるコマンドが具体的に何を行っているかを理解する
* Docker による環境構築に興味を持ってもらう

## Docker(ドッカー) について軽くおさらい

### Dockerって何？
* Docker（ドッカー）とはコンテナ型アプリケーションを実行するツールのこと
### コンテナって何？
- コンテナ（container）とは、サーバー内を整理してアプリケーションやWebの開発・管理を効率的に行えるようにする仮想化技術のこと
- コンテナはソフトウェアからの操作により開発環境を作成、編集、起動、破棄などを行うことができる。(Dockerの場合、Docker forDesktopが代表的)<br>
そのため人間が開発に必要なOSやライブラリを導入・設定して起動させることに比べ、簡単、迅速に特定の環境を構築したり別の環境に切り替えたりすることができる。
- 詳しくは以下の社内ドキュメントをご覧いただければと思います。<br>
https://keepalive.atlassian.net/wiki/spaces/KA/pages/292094138/Docker

---
## Dockerを利用できるようにセットアップする方法

- dockerを用いた開発を行うためには前提として、Docker forDesktopというアプリケーションをインストールする必要がある<br>
https://matsuand.github.io/docs.docker.jp.onthefly/desktop/
<br>

- 利用方法(Windows)
1. WSL2(Windows Subsystem for Linux 2)をインストールする
2. 「設定」でHyper-Vを有効にする
3. Docker forDesktopをインストールする

上記の具体的な手順は以下のリンクからご確認ください
<br>
https://sukkiri.jp/technologies/virtualizers/docker/docker-win_install.html

---

## 事前準備

### ①まず本アプリケーションを「git clone」する
---
```
git clone https://github.com/k-aSogen/dockerHandsOn.git
```
### ②cloneしたアプリケーションの階層に移動する
---
```
cd dockerHandsOn
```
<br>
---

## 起動手順

###  dockerfileから独自のイメージをビルドする。
---
```
docker build -t nodejs-docker .
```
「-t」を使うことでイメージに名前を付けることができる
<br>

#### Q.「docker build」は何をしている？
#### A.dockerfileの記述に基づいて、Dockerイメージを作成する

#### Q.Dockerイメージとは何？
#### A.OSやアプリケーションがインストールされたテンプレート（ファイル）のこと。
- dockerイメージは「docker image」コマンドを用いることで、ローカルに保存したコンテナイメージ一覧を表示できる
<br>


### nodejs-docker のタグが付いたイメージを利用してコンテナ起動
---
- コンテナ名は、--nameオプションを利用してつけることができる
- 「--rm」をイメージタグの直前に入力してコンテナ起動させると、コンテナ停止時に自動的にコンテナ削除を行ってくれる。
- 「-p」でコンテナ起動させるポートを設定する
```
docker run -d --rm --name giken -p 3000:3000 nodejs-docker
```
- http://localhost:3000 にアクセスすると「Hello World」が表示される

#### Q.「docker run」 は何をしている？
#### A.dockerコンテナを起動状態で作成している
- コンテナを停止状態で作成する「docker create」コマンドとコンテナを起動する「docker start」コマンドを同時に実行している
<br>

### コンテナを確認する方法
---
```
// 起動中のコンテナ確認
docker ps
// 「-a」を追加することで、停止中のコンテナも確認することが可能
docker ps -a
```
<br>

### コンテナ終了方法
---
```
//「stop」コンテナ正常終了
docker stop giken
// 「kill」コンテナ強制終了
docker kill giken
```
<br>

### コンテナ削除
---
```
docker rm giken
```
<br>

### dockerコンテナ中身確認方法
---
```
docker exec -it giken sh
```
