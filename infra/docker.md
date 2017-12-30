# docker

* [Docker Hub](https://hub.docker.com/)
* [Docker ドキュメント日本語化プロジェクト ? Docker-docs-ja 1.13.RC ドキュメント](http://docs.docker.jp/)

## examples

```
# 動いていないコンテナを削除
docker ps -aq -f status=exited -f status=dead | xargs docker rm

# 古いコンテナを削除
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm

# タグのついていないイメージを削除
docker images -f "dangling=true" -q | xargs docker rmi
```
