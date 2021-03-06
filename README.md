# QOLE Patcher

QOLE Patcher is an auto-updater for the **GNT4 Quality of Life Edition (QOLE)** mod. For more info on the contents of this mod,
please see the [GNT4 QOLE Releases Repository](https://github.com/NicholasMoser/qole-releases).

- [How to Use](#how-to-use)
  - [Windows](#windows)
  - [Mac](#mac)
  - [Linux](#linux)
- [Common Questions](#common-questions)
- [Legal](#legal)

## How to Use

### Windows

Download the latest Windows release zip, extract it, and run `QOLE-Patcher.exe`.

### Mac

Download the latest Mac release zip and extract it. Then make sure you have the following installed:

- Homebrew
  - Download and install from https://brew.sh/
- xdelta
  - To install run `brew install xdelta`

Then run QOLE Patcher like so:

```bash
./QOLE-Patcher
```

### Linux

Download the latest Linux release zip and extract it. Then make sure you have the following installed:

- xdelta3
  - To install run `sudo apt-get install xdelta3`

Then run QOLE Patcher like so:

```bash
./QOLE-Patcher
```

## Common Questions

### Why does it say my vanilla ISO needs to be modified?

When you create an ISO of a game, you read the data from the disc into a file. It is possible during
this process that a few bytes are different than expected. This is due to errors when reading the
disc. When the bytes differ, this is called a "bad dump" since it doesn't match the original game 1:1.
In many cases, bad dumps are perfectly fine because the bytes that changed are in places that are
unused. Furthermore, sometimes it is benefitial to create a bad dump, in order for the ISO to
compress better.

QOLE Patcher expects that the GNT4 ISO used is a particular bad dump. A good dump uses random
bytes as padding on the disc, which is unable to be compressed and results in a larger zip size.
The bad dump used by QOLE Patcher uses zeroes instead of random bytes so that it compresses
cleanly. When you use QOLE Patcher with a good dump, it will ask you if you're okay with
modifying it to be the expected "bad dump".

When QOLE Patcher asks to modify your good dump GNT4 ISO you have a few options. If you don't
care just hit enter and let it modify the file. If you are particularly concerned with keeping your
good dump ISO, consider creating a copy of it to be modified instead and use that with QOLE Patcher.

### It says I'm already on the latest version but I want to reinstall it

Open the `data` folder, delete the file named `current_version`, and restart QOLE Patcher.

## Building

To build the code, first make sure you have [go 1.16+](https://golang.org/) installed.

Then install `pb` and `goversioninfo` by running:

```bash
make get
```

Finally, build the code with:

```bash
make platform
```

Currently Windows, Linux, and Mac are supported with respectively
```
windows
linux
mac
```


Different build environments can be targeted by using the `GOOS` env entry.

### Powershell Example

```powershell
$Env:GOOS = "windows"; $Env:GOARCH = "amd64"
make windows
$Env:GOOS = "linux"; $Env:GOARCH = "amd64"
make linux
$Env:GOOS = "darwin"; $Env:GOARCH = "amd64"
make mac
```

## Legal

This software is licensed under the GNU General Public License v3.0.

The bundled xdelta for Windows is licensed under Apache Public License version 2.0.

The icon for the application is owned by [thedemonknight](https://www.deviantart.com/thedemonknight/art/Naruto-dojutsu-icon-pack-270461865)
