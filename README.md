# Fortran CI: automated QA for Fortran software
This repository contains boiler plate code for automated quality assurance (code formatting and testing). Upon every commit, pre-commit is used to format the source code using [fprettify](https://github.com/pseewald/fprettify) and to run all implemented tests using [funit](https://github.com/ubinexy/funit).

## Prerequisites
* python3 
* poetry
  - get it like this `curl -sSL https://install.python-poetry.org | python3 -`
  - more info on poetry is [here](https://python-poetry.org/docs/)
* rubygems / rubygems
  - MacOS: should be preinstalled
  - Ubuntu: `sudo apt install rubygems`
 
## Usage
* virtual environment with pre-commit and fprettify installed: <pre><code>
python3 -m venv venv
source venv/bin/activate
poetry install
</code></pre>
* triggering execution of pre-commit hooks:
 `pre-commit run --all-files`
