Triangle program fuzzing with afl++

Uses: Docker desktopp
Project files:'Dockerfile' 'Triangle.c' 'fuzz_harness.c' 'coverage_harness.c' 'run_coverage.sh' 'fuzzer_test_suite.txt' 
- in directory seng3320_assignment2.

1. Inside the directory: docker build -t afl_triangle_fuzzer

2. Run container:  docker run -it -v <PathtotheFolder>:/assignment afl_triangle_fuzzer /bin/bash

3. Inside the container: 

Compile fuzzing: afl-clang-fast fuzz_harness.c -o triangle_fuzz

prepare input output directories: 
mkdir in
echo "10 10 10" > in/test_input.txt
mkdir out

bypass core dump check if its needed: export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1

Run fuzz: afl-fuzz -i in -o out ./triangle_fuzz

Run coverage analysis: ./run_coverage.sh

This script will compile `Triangle.c` and `coverage_harness.c` with GCOV instrumentation, 
run all fuzzer-generated inputs, and then create an HTML coverage report.