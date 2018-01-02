# du

```
# 所定のディレクトリのサイズチェック
du | sort -nr | head
du -s DIR

# カレントディレクトリ以下の容量
du -s *

# カレントディレクトリ以下ファイルの大きい順
du -s * | sort -nr | head -10

```


