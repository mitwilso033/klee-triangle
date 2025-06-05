#!/bin/bash

# Directory with KLEE test cases
KLEE_OUT="klee-out-0"

# Loop over all .ktest files in the directory
for testfile in ${KLEE_OUT}/*.ktest; do
  echo "Processing $testfile"

  # Extract a, b, c from the .ktest file using ktest-tool and parsing
	a=$(ktest-tool "$testfile" | awk '/object 0: int :/ {print $5}')
    b=$(ktest-tool "$testfile" | awk '/object 1: int :/ {print $5}')
    c=$(ktest-tool "$testfile" | awk '/object 2: int :/ {print $5}')



  echo "Running test_runner with inputs: a=$a b=$b c=$c"
  ./test_runner $a $b $c
done

echo "All tests replayed."
