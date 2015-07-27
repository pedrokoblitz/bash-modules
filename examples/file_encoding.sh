usage() {
	cat <<- EOF
		multi line text goes here...
		multi line text goes here...
		multi line text goes here...
	EOF	
}

for file in *.txt; do
    iconv -f ascii -t utf-8 "$file" -o "${file%.txt}.utf8.txt"
done

iconv -f iso-8859-1 -t utf-8 home.view.php