#!/bin/bash

find . -maxdepth 1 -type d ! -name "thor" -exec sh -c 'docker build -t "{}" "{}"' \;

# EXCLUDED Thor by default
