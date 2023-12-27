# Quake1 QCC Binaries
QuakeC Compiler binaries for Linux and Windows (32bit and 64bit) - because https://github.com/id-Software/Quake-Tools/tree/master/qcc only comes with qcc for dos.

Compiled using https://github.com/dockcross/dockcross

## WASM test:
This branch is an attempt at getting the QuakeC Compiler working under Emscripten - see [make-wasm.sh](make-wasm.sh) (after running that, run `python3 -m http.server` and browse to [http://localhost:8000/qcc-wasm.html](http://localhost:8000/qcc-wasm.html))

The resulting WASM binary "runs" but exits with an error:
```
************ ERROR ************
Error opening progs.src: No such file or directory
```


## Usage:
Run the relevant qcc binary in your QuakeC source directory to compile "progs.dat", eg:

```
~/code/quake-mod$ ~/quake-qcc-binaries/qcc-x86_64-linux-gnu
outputfile: ../progs.dat
compiling defs.qc
compiling subs.qc
compiling fight.qc
...
411104 TOTAL SIZE
226 unique precache_sounds
 95 unique precache_models
```

## Re-compiling binaries:
Run `make-binaries.sh` in Linux with Docker installed. You will need to clone the [Quake client source repo](https://github.com/id-Software/Quake) in to this repo's directory (but the build script will give you the command).

Note: a few hundred megabytes of Docker images (for "dockcross") will be downloaded.
