#!/bin/bash 

DATA="../data/clean_dialog.csv"

TOTAL=$(csvtool col 3 "$DATA" | tail -n +2 | wc )

echo "pony_name, total_line_count, percent" > ../scripts/line_percentages.csv

for pony in \
"Twilight Sparkle"\
"Rarity"\
"Pinkie Pie"\
"Rainbow Dash"\
"Fluttershy"
do 
	COUNT=$(csvtool col 3 "$DATA" | grep -c "^$pony$") 
	PERCENT=$(awk "BEGIN {print ($COUNT/$TOTAL)*100}")
	echo "$pony,$COUNT,$PERCENT" >> ../scripts/Line_percentages.csv
done

