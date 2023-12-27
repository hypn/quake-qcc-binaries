#!/bin/bash
CMD='cd src; emcc -O3 -s WASM=1 -o ../qcc-wasm.html -I ../Quake/WinQuake *.c'

# compile Linux binaries
docker run -v `pwd`:/work dockcross/web-wasm bash -c "$CMD"