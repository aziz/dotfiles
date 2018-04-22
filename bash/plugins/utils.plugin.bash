export sort_and_count="awk ' { tot[$0]++ } END { for (i in tot) print tot[i],i } ' | sort -gr"
