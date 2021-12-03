# Blender for aquaBSD

This repository is a fork of Blender which (will) add a few nice integrations with aquaBSD.

## Features & planned features

- [ ] Custom build process for generating ZPK packages.
- [ ] Automatically follow the aquaBSD system theme.
- [ ] Integrations with [aquaBSD Launchpad](https://github.com/inobulles/aquabsd-launchpad).
- [ ] Smooth scrolling.

## Building on aquaBSD

On an aquaBSD installation, necessary dependencies should already be installed, and if one of them is not, please file an issue on this repository so I can think up a solution.
Individual steps are detailed in the `build.sh` script.
If on aquaBSD, you can also run it directly *as a user, not as root*:

```sh
% sh build.sh
```

## Iterative builds

If developing or testing changes to the source, it is first of all strongly recommended to actually understand `build.sh`.
Once the build environment is configured though, it should only be a matter of re-running the `make` command in the `build/` directory:

```sh
% cd build
% numthreads=$(sysctl -n hw.ncpu)
% make -j$numthreads
```

If you want **<span style="color:red">c</span><span style="color:orange">o</span><span style="color:yellow">l</span><span style="color:lime">o</span><span style="color:green">u</span><span style="color:cyan">r</span><span style="color:blue">e</span><span style="color:purple">d</span>** output, run `make` without the argument.
Build times will be longer, however, but a small price to pay for coloured output.

## Running the output

Install the files needed for Blender (don't worry, this will only install in your build directory!):

```sh
% cd build
% make install
```

This process should only take about 10 minutes.
Then, your final binary should be in `build/bin/blender`.
Enjoy!

## Packaging as a ZPK

This is not yet possible, but I'll naturally update this documentation when it is.

## Notes

- If linking fails looking for `gflags::SetCommandLineOption(char const*, char const*)`, make sure you don't have `devel/gflags` installed. For more information, check out [this post](https://marc.info/?l=freebsd-ports-bugs&m=152757275115239&w=2) on the `freebsd-ports-bugs` mailing list.
- If you get a `could not find PythonLibsUnix` error, you most likely don't have the required version of Python.
- If the necessary Python version doesn't come with PIP, you can bootstrap it with [`get-pip.py`](https://bootstrap.pypa.io/get-pip.py).

## Original README

Blender is the free and open source 3D creation suite. It supports the entirety of the 3D pipeline-modeling, rigging, animation, simulation, rendering, compositing, motion tracking and video editing.

### Project Pages

- [Main Website](https://www.blender.org/)
- [Reference Manual](https://docs.blender.org/manual/en/latest/index.html)
- [User Community](https://www.blender.org/community/)

### Development

- [Build Instructions](https://wiki.blender.org/wiki/Building_Blender)
- [Code Review & Bug Tracker](https://developer.blender.org/)
- [Developer Forum](https://devtalk.blender.org/)
- [Developer Documentation](https://wiki.blender.org/)

### License

Blender as a whole is licensed under the GNU General Public License, Version 3. Individual files may have a different, but compatible license.

See [blender.org/about/license](https://www.blender.org/about/license) for details.
