The HPAM Firmware Section is evaluating the usage of ARM-based CPUs in our 3D printing
devices, as an alternative to the current Intel CPU. The current Firmware infrastructure is
designed to generate the development environment inside a Docker image on which we
install all the required tools and libraries, built from a Debian Docker image. Then, that
docker image is used to build a custom OS image, launch the Firmware compilation and
generate a single Firmware package which contains both the OS and the Firmware artifacts.
Therefore, to be able to run the Firmware in an ARM-based CPU we need to support the
arm64v8 instruction set from our dev-env Docker image, so we can cross-compile the
Firmware and generate all the required artifacts for an ARM-based platform.
The Firmware is compiled from a large C++ repository, so it has several libraries’
dependencies that must be included when building the Docker image, and the Firmware
itself will probably present several coding warnings/errors when trying to compile the C++
code with a different compiler.
This project will enable the usage of Raspberry Pi as a cost-effective alternative to potentially
use it as the main controller in future 3D Printing devices.


Tasks and deliverables:
- Generate 2 Debian-based docker images:
o The 1st Docker image must extend the current Firmware dev-env to include all
the required tools & libs for the arm64v8 cross-compilation (since all our
development machines use Intel CPUs).
o The 2nd Docker image must completely be arv64v8-based, so all the OS
binaries and libs can directly run in an ARM-based Hardware platform.
