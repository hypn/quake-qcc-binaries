#!/bin/bash
docker run -v `pwd`:/work dockcross/web-wasm bash -c 'emcc -O3 -s WASM=1 -o qcc-wasm.html -I Quake/WinQuake src/*.c --preload-file v101qc@/'