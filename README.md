# Quake1 QCC Binaries
QuakeC Compiler binaries for Linux and Windows (32bit and 64bit) - because https://github.com/id-Software/Quake-Tools/tree/master/qcc only comes with qcc for dos.

Compiled using https://github.com/dockcross/dockcross

## WASM test:
This branch is an attempt at getting the QuakeC Compiler working under Emscripten - see [make-wasm.sh](make-wasm.sh) (after running that, run `python3 -m http.server` and browse to [http://localhost:8000/qcc-wasm.html](http://localhost:8000/qcc-wasm.html))

The resulting WASM binary "runs" but the (hopefully) compiled `progs.dat` file is not retrievable:
```
outputfile: ../progs.dat
compiling defs.qc
compiling subs.qc
compiling fight.qc
compiling ai.qc
compiling combat.qc
compiling items.qc
compiling weapons.qc
compiling world.qc
compiling client.qc
compiling player.qc
compiling monsters.qc
compiling doors.qc
compiling buttons.qc
compiling triggers.qc
compiling plats.qc
compiling misc.qc
compiling ogre.qc
compiling demon.qc
compiling shambler.qc
compiling knight.qc
compiling soldier.qc
compiling wizard.qc
compiling dog.qc
compiling zombie.qc
compiling boss.qc
compiling tarbaby.qc
compiling hknight.qc
compiling fish.qc
compiling shalrath.qc
compiling enforcer.qc
compiling oldone.qc
writing progdefs.h
 88104 strofs
 20732 numstatements
  2091 numfunctions
  4272 numglobaldefs
   218 numfielddefs
 11350 numpr_globals
410616 TOTAL SIZE
225 unique precache_sounds
 95 unique precache_models
```


## Usage:
Run the relevant qcc binary in your QuakeC source directory (eg: "v101qc") to compile the "progs.dat", eg:

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
Run `make-binaries.sh` in Linux with Docker installed. You will need to clone the [Quake client source repo](https://github.com/id-Software/Quake) into this repo's directory (but the build script will give you the command).

Note: a few hundred megabytes of Docker images (for "dockcross") will be downloaded.


## WASM:

There is also a [PoC/test branch](https://github.com/hypn/quake-qcc-binaries/compare/47c5b827b3263fe6cf12ea972bb61d0e59e4c2d5...wasm-test) for compiling `qcc` to WASM.