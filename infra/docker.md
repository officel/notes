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

# terraforming
alias terraforming='docker run --rm --name terraforming -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_REGION=$AWS_DEFAULT_REGION quay.io/dtan4/terraforming:latest terraforming'

```

## Amazon Linux 2

* [library/amazonlinux - Docker Hub](https://hub.docker.com/_/amazonlinux/)

```bash
docker pull amazonlinux:2

# お試し(command が /bin/bash なので何もつけないと普通に入れる)

docker run --rm -it  amazonlinux:2
amazon-linux-extras
exit

# コンテナを実行しっぱなしにする

docker run --rm -it -d --name al2-base  amazonlinux:2

# Inventory を用意する

$ cat inventory/docker
[docker_host]
localhost

[container]
al2-base ansible_user=root

# ansible でプロビジョニングする

ansible-playbook -i inventory/docker playbooks_packer/base.yml -c docker -l al2-base
```
