#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

clang-format -i ../*.c ../*.h --style=file --fallback-style=none

echo -e "${GREEN}Formatting completed.${NC}"