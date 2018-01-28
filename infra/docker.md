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

## alias

```
# alpine+nginx
alias alpinx='docker run -it --rm --name alpinx -v `pwd`:/usr/share/nginx/html:ro -v /etc/localtime:/etc/localtime:ro -d -p 8080:80 nginx:alpine'

# tflint
alias tflint='docker run --rm -v $(pwd):/data -t wata727/tflint'

# GitBook
alias gitbook='docker run --rm -v "$PWD":/gitbook -v /usr/share/fonts:/usr/share/fonts -p 4000:4000 --name gitbook officel/docker-gitbook-calibre gitbook'
```
