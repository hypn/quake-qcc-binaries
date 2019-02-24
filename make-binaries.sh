#!/bin/bash
# get Quake client headers
if [ ! -d "Quake/WinQuake" ]; then
  echo "Quake source code is missing (the C headers required)"
  echo
  echo "run (in this directory):"
  echo "  git clone https://github.com/id-Software/Quake.git"
  echo
  exit 1
fi

CMD='cd src; rm *.o; $CC -static -c -g -Wall -I ../Quake/WinQuake *.c; $CC -static -o ../qcc-$CROSS_TRIPLE qcc.o pr_lex.o pr_comp.o cmdlib.o'

# compile Linux binaries
docker run -v `pwd`:/work dockcross/linux-x64 bash -c "$CMD"
docker run -v `pwd`:/work dockcross/linux-x86 bash -c "$CMD"

# compile Windows binaries
docker run -v `pwd`:/work dockcross/windows-x64 bash -c "$CMD"
docker run -v `pwd`:/work dockcross/windows-x86 bash -c "$CMD"

# rename Windows binaries
mv qcc-i686-w64-mingw32.static qcc-x86.exe
mv qcc-x86_64-w64-mingw32.static qcc-x64.exe

# list files
clear
echo "Files created:"
echo

ls -lh qcc*

echo
echo "Should be done."
echo
