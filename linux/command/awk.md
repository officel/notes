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
```
