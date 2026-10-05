#!/bin/bash

NAME_COL=1
JOB_COL=2
THEME_COL=3
FS_CHAR=","
DFS_CHAR="+"

# Task 0
mkdir -p "data_analysis"
rm -rf data_analysis/*

# Task 1
awk -F"$FS_CHAR" -v sub_del="$DFS_CHAR" '{
  theme_column = $'$THEME_COL'
  n = split(theme_column, sub_themes, sub_del)
  for (i = 1; i <= n; i++) {
    theme = sub_themes[i]
    gsub(/^[ \t]+|[ \t]+$/, "", theme)
    if (theme != "") print theme
  }
}' faculty_2.csv | sort -u > data_analysis/research_themes

wc -l < data_analysis/research_themes >> data_analysis/research_themes

# Task 2
awk -F"$FS_CHAR" -v sub_del="$DFS_CHAR" '{
  theme_column = $'$THEME_COL'
  n = split(theme_column, sub_themes, sub_del)
  for (i = 1; i <= n; i++) {
    theme = sub_themes[i]
    gsub(/^[ \t]+|[ \t]+$/, "", theme)
    if (theme != "") count[theme]++
  }
}
END {
  for (t in count) {
    if (count[t] > 6 && count[t] < 10) print t
  }
}' faculty_2.csv > data_analysis/medium_groups.txt

# Task 3
awk -F"$FS_CHAR" '{
  theme_column = $'$THEME_COL'
  if (theme_column ~ /Computer Security/ && \
      theme_column ~ /Philosophy/ && \
      theme_column ~ /Biomed(i)?cine/) {
    print $0
  }
}' faculty_2.csv > data_analysis/joined.csv

# Task 4
awk -F"$FS_CHAR" '{
  full_name = $'$NAME_COL'
  gsub(/^[ \t]+|[ \t]+$/, "", full_name)
  if (full_name != "") {
    n = split(full_name, parts, " ")
    surname = parts[n]
    firstname = ""
    for (i = 1; i < n; i++) {
      firstname = (firstname == "" ? parts[i] : firstname " " parts[i])
    }
    if (firstname == "") {
      print surname "\t" surname
    } else {
      print surname "\t" firstname " " surname
    }
  }
}' faculty_2.csv | sort -u -k1,1 | cut -f2- > data_analysis/sorted_names.txt
