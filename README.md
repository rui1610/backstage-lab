# Setup Backstage for testing

This repository brings together various resources to more easily setup a Backstage instance in a Docker container.

Simple run the `setup.sh` with the following command, once the devcontainer is ready:

`./setup.sh`

Current assumption is, that the created backstage instance is called `btprui` (the setup script will ask for the name). If you want to change that, please change the entry in [the file config/app.env](config/app.env).
