# Description

A repository for assignments completed as part of JHU's Computer Organization class, Summer 2023.

# Bash Utils

- The `create_makefile.sh` script is helpful when there are many programs in a directory: it collects all the programs in the directory (which should be the first argument to the script) and creates a basic makefil with them.
  > Example usage: `create_makefile.sh /path/to/target/`
- The `runTests.sh` script is meant to be called from another bash script. In your target directory (where the programs that need to be tested live), create a new file like `dirtests.sh`, and add the tests like this example:

```
#!/bin/bash

# Make all programs in dir

echo `make All`

# Run tests
../../runTests.sh -n KATempToCelsius -t "90, 95, 104"
../../runTests.sh -n KATempToF -t "32, 26, 18"
../../runTests.sh -n KAIntToNegative -t "5, 45, 10"
../../runTests.sh -n KAToInches -t "6'2\",5'5\",4'11\""
../../runTests.sh -n KAInchesToFeet -t "72, 65, 62"
```
> The `-n` flag is for the program name, and the `-t` flag takes a comma separated list of test cases (must be in quotes)
