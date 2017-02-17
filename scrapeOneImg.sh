fn=`echo "$1" | sed "s/\t.*$//"`
url=`echo "$1" | sed "s/^.*\t//"`
if [ ! -e "$fn" ]; then
    curl -Ss -k -g -m 15 "$url" -o "$fn".tmp;
    convert "$fn".tmp -resize 800x800\> "$fn"
    b64=`base64 -w 0 "$fn"`
    b64sz=${#b64}
    if (( b64sz <= 4000000)); then
        echo "$fn"$'\t'"$url"$'\t'"$b64"
    fi
    rm "$fn".tmp
    rm "$fn"
fi