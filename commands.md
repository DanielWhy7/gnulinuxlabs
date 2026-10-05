## Task one
wc -w < dictionary_2026.txt
cat dictionary_2026.txt | wc -w
wc -w dictionary_2026.txt | grep -Eo "^[0-9]+"

## Task two
    -   grep -E "[cC]{2}" dictionary_2026.txt | wc -w
grep -E "[cC].+[cC]" dictionary_2026.txt | wc -w
grep -oE '\S+' dictionary_2026.txt | grep -iE "^([^c]*c){2}[^c]*$" | wc -l

## Task three
grep -E "t.t" dictionary_2026.txt | wc -w
grep -E "^[^t]*t[^t]+t[^t]*$" dictionary_2026.txt | wc -w
grep -oE '\S+' dictionary_2026.txt | grep -E '^[^t]*t[^t]+t[^t]*$' | wc -l

## Task four
grep -oE '\S+' dictionary_2026.txt | grep -oE "^\S{3}" | grep -v "oo" | sort | uniq -c | sort -rn | head -n 4
grep -oE '\S+' dictionary_2026.txt | grep -oE "^\S{3}" | grep -v "oo" | sort | uniq -c | sort -rn | head -n 4 | grep -oE "[a-zA-Z]+"
