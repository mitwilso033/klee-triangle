#!/bin/bash

# Clear previous gcov data files (*.gcda)
find . -name "*.gcda" -delete

# Compile the coverage harness and Triangle.c with gcov instrumentation
# This creates a single executable 'coverage_runner'
gcc -fprofile-arcs -ftest-coverage Triangle.c coverage_harness.c -o coverage_runner

# Check if compilation was successful
if [ $? -ne 0 ]; then
    echo "Compilation failed. Exiting."
    exit 1
fi

# Execute the compiled program, which reads from fuzzer_test_suite.txt
./coverage_runner

# Generate the gcov report for Triangle.c
echo "Generating gcov report for Triangle.c..."
gcov Triangle.c

# Generate initial lcov data
echo "Generating lcov data..."
lcov --capture --directory . --output-file coverage.info

# Generate HTML report
echo "Generating HTML coverage report..."
genhtml coverage.info --output-directory html_coverage_report

echo "Coverage analysis complete. HTML report is in html_coverage_report directory."