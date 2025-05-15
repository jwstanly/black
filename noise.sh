#!/usr/bin/env bash
set -e

# How many noise commits?
COUNT=5

for i in $(seq 1 $COUNT); do
  echo "Creating noise commit #$i…"

  # (a) Option A: touch *every* file by appending a single space to the last line
  git ls-files | xargs -I{} sh -c 'echo -n " " >> "$1"' _ {}

  # (b) Option B: touch a random subset of 100–200 files
  # git ls-files | shuf -n $((RANDOM % 100 + 100)) | \
  #   xargs -I{} sh -c 'echo -n " " >> "$1"' _ {}

  git add -A
  git commit -m "chore: noise commit #$i – touch files"
done

            