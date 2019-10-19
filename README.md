# CPP17

CPP17 is intended to serve as a base skeleton/framework for C++17 projects using CMake, integrated with GitHub Workflows for CI.

## Usage
### Build Sample
#### Clone the repository
```
git clone https://github.com/karnkaul/CPP17
```

#### Use CMake to generate a build directory in `out/...` using `Source`
Command line:
```
CONFIG=Debug	# Or Release / RelWithDebInfo / etc
cmake -G Ninja . -Bout/$CONFIG -DCMAKE_BUILD_TYPE=$CONFIG
```
GUI:
1. Select repo root as Source directory
1. Select `out/...` as the Build directory (config subdirectory not required for IDE project generators)
1. Click Configure
1. For single-configuration generators: enter the desired value for `CMAKE_BUILD_TYPE`
1. Click Generate

#### Build the project:
If using IDE project generators, open the generated project/solution/workspace in the corresponding IDE and build `BUILD_ALL`.

Command line:
```
cmake --build out/$CONFIG
```
### Use as Base Setup
1. Fork the repository in into your own account
1. Follow **Build Sample** to ensure project works
1. Replace with your source code and CMake files

## GitHub CI
All GitHub related files are in `.github`:
1. `workflows/ci.yml` sets up the overall workflow; edit the `on:` sections to adjust automated build triggers
1. `CI/pre-build.sh` sets up the build environment; optionally pass "TRUE" to also install `clang` and `llvm`
1. `CI/build-config.sh` builds the config passed as the first argument (`Release` if empty); pass "TRUE" as the second argument to use `/usr/bin/clang++`

## GitHub Branch Protections
In repository settings, select "Branches" and set up protections for branch wildcards to enable:
1. Prevention of branch deletions / force pushes
1. Require status checks to pass
	1. After a CI Action has run, it will appear as an option here (to be selected as "Required")
