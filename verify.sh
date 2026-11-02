#!/usr/bin/env bash

cd -- "$(dirname -- "$0")" || exit 1

result=0

echo "Running the full test suite..."

if python3 -m pytest -v; then
    echo "Tests passed."
else
    echo "Tests failed."
    result=1
fi

for filename in requirements.txt config.json; do
    if [ -f "$filename" ]; then
        echo "$filename found."
    else
        echo "$filename is missing."
        result=1
    fi
done

echo "Git status (no entries means the working tree is clean):"

if ! git status --short; then
    echo "Unable to read Git status."
    result=1
fi

if [ "$result" -eq 0 ]; then
    echo "Verification passed."
else
    echo "Verification failed. Fix the problems and run again."
fi

exit "$result"