# git

## config

```
git config --global user.name "name"
git config --global user.email "mail"
git config --global core.autocrlf false
git config --global core.excludesfile ~/.gitignore_global
git config --global core.pager 'less -R'
git config --global core.quotepath false
git config --global color.ui auto
git config --global push.default simple
git config --global credential.helper cache
# see http://docs.aws.amazon.com/ja_jp/codecommit/latest/userguide/setting-up-https-windows.html#setting-up-https-windows-credential-helper
git config --global credential.helper "!aws codecommit credential-helper $@"
git config --global credential.UseHttpPath true

git config -l
git config --unset                     # 設定を外す

git config core.filemode false         # 権限変更を無視する
git config fetch.prune true            # fetch時に常にprune
```

## Examples

```
git update-index --add --chmod=+x FILE # 権限をつける（for Win）

git diff --staged
git diff HEAD..origin/master
git diff HEAD^ HEAD

git log -p --ignore-space-change       # ignore されているファイルを確認
git log --oneline --decorate --graph --branches --tags --remotes
git log --graph --date-order --all --pretty=format:'%h %Cred%d %Cgreen%ad %Cblue%cn %Creset%s' --date=short
git log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative

git reset HEAD <FILE>    # add をなかったことにする
git rm --cached <FILE>   # まだ管理下になかったファイルをaddしてないことにする
git reset --soft HEAD^   # 直前のコミットをなかったことにする（ワーキングディレクトリはそのまま）
git reset --hard HEAD^   # 同上（ワーキングディレクトリもきれいに）
```
