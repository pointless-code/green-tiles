#!/bin/bash

generate_random() {
  echo $(( RANDOM % 11 + 1 ))
}

generate_timestamp() {
  local date="$1"
  local random_hour=$(( RANDOM % 24 ))
  local random_minute=$(( RANDOM % 60 ))
  local random_second=$(( RANDOM % 60 ))

  printf "%sT%02d:%02d:%02d" "$date" "$random_hour" "$random_minute" "$random_second"
}

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <start_date> <end_date>"
  exit 1
fi

start_date=$1
end_date=$2

start_date_seconds=$(date -d "$start_date" +%s)
end_date_seconds=$(date -d "$end_date" +%s)

current_date="$start_date"
current_date_seconds=$start_date_seconds

while [ "$current_date_seconds" -lt "$end_date_seconds" ]; do
  skip_day=$(( RANDOM % 2 ))

  if [ "$skip_day" -eq 0 ]; then
    echo "Skipping $current_date"
  else
    num_commits=$(generate_random)

    for ((i=1; i<=$num_commits; i++)); do
      timestamp=$(generate_timestamp "$current_date")
      echo "Creating fake commit for $current_date at $timestamp"
      git commit --allow-empty -m "Fake commit with specific date" --date="$timestamp"
    done
  fi

  current_date_seconds=$(($current_date_seconds + 86400))
  current_date=$(date -d "@$current_date_seconds" -I)
done

git push

echo "Fake commits creation completed."
