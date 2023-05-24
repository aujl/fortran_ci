#!/bin/bash

# empty results for empty globs
shopt -s nullglob

# get all directories
testDirs=$(find ./source/ -type d)

# get funit variables and arguments
funitArgs=$(cat ./funitArgs)
funitVars=$(cat ./funitVars)
funitCommand="$funitVars funit $funitArgs"

# loop through all directories
failures=0
for dir in ${testDirs};
do
  testFiles=$($dir/*.fun)
  # if there are tests...
  if [[ ${#testFiles[@]} -gt 0 ]]; then
    # ... execute funit on them
    cd $dir
    testOut=$(eval $funitCommand)
    thisFails=$(echo $testOut | grep --color=always "failed" | wc -l)
    failures=$(echo "$failures + $thisFails"  | bc ) 
    if [ $(echo "$thisFails>0" | bc) == 1 ];
	then
	echo $testOut
    fi  
    eval $funitCommand --clean
  fi
  cd - 
done

echo $failures > ./funitFailures
exit $failures
