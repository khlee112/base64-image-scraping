# Expect input to be [id]\t[url]
f="$1"
cat "$f" | dos2unix | tr '\n' '\0' | parallel -0 -I -P24 'echo "{}" | bash ./scrapeOneImg.sh'