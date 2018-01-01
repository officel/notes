# awk

## Examples

```
# multi separator []
awk -F "[,:]" '{print $2, $3}' 

# Last column $NF
awk '{print $NF}'
awk '{print $(NF-1)}'

# If else 
awk '{if($3==200) ok++; else ng++}; END {print ok; print ng}'

# If
awk '$(NF-1) >= 30.0 { print $0 }'
awk '{if($1==A || $2==B) print}'
awk '{if($1==A && $2==B) print}'


# ワンライナー
grep FROM mysql.slow.log | awk "{ print $2 }" | sort -n | uniq -c | sort -r | head

grep " 12:30:" sql.log | awk '{if ($(NF-1) > 0.2) print }' | head

```
