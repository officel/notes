# golang

see: https://golang.org/

```
wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

go get github.com/motemen/gore
go get github.com/nsf/gocode
go get github.com/k0kubun/pp
go get golang.org/x/tools/cmd/godoc

```
