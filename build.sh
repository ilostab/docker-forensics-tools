#!/bin/bash

find . -maxdepth 1 -type d ! -name "thor" ! -name "dev_*" -exec sh -c 'docker build -t "{}" "{}"' \;

# EXCLUDED FOLDERS: Thor, dev_* 
