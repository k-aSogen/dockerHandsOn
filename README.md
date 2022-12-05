起動手順
// dockerfileから独自のイメージをビルドする。「-t」を使うことでイメージに名前を付けることができる
docker build -t nodejs-docker .
// nodejs-docker のタグが付いたイメージを利用してコンテナ起動。コンテナ名は、--nameオプションを利用してつけることができる。
docker run --name giken -p 3000:3000 nodejs-docker
// 「stop」コンテナ正常終了
docker stop giken
// 「kill」コンテナ強制終了
docker kill giken


// dockerコンテナ中身確認方法
docker exec -it giken sh

