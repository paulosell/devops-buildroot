# Buildroot Docker Image

This repository provides a Docker-based environment for working with Buildroot. The Docker image is based on Debian 12.9 and includes all necessary dependencies to run Buildroot.

## Features
- Debian 12.9 base image
- Pre-installed dependencies for Buildroot
- Automated build, tagging, and publishing workflow via Makefile
- Shell access to the container for interactive use

## Getting Started

### Prerequisites
Ensure you have the following installed on your system:
- [Docker](https://docs.docker.com/get-docker/)
- [Make](https://www.gnu.org/software/make/)
- [Git](https://git-scm.com/)

### Building the Image
To build the Docker image, run:
```sh
make build
```
This will create a Docker image tagged with the latest Git commit hash.

### Running an Interactive Shell
To start an interactive shell within the container, use:
```sh
make shell
```
This will launch a bash shell inside the container.

### Publishing the Image
To push the image to a remote repository, run:
```sh
make publish
```
This will tag and push the image to `docker.io/<your_org>/buildroot`. By default, the organization is `paulosell`, but it can be overridden using the `ORG` variable:
```sh
make publish ORG=your_org
```

## Makefile Commands
| Command | Description |
|---------|-------------|
| `make build` | Builds the Docker image and tags it with the latest commit hash and `latest` tag. |
| `make shell` | Runs an interactive shell inside the container. |
| `make publish` | Pushes the built image to the Docker registry. Supports overriding the organization via `ORG` variable. |

## Docker Image Details
The Dockerfile performs the following steps:
1. Starts from Debian 12.9 base image.
2. Installs required packages for Buildroot.
3. Downloads and extracts Buildroot 2024.11.1.
4. Moves Buildroot files to `/var/buildroot`.
5. Provides a Makefile for building, tagging, and publishing the image.

## License
This project is licensed under the MIT License.

## Author
pfs
