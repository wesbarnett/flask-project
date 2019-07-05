# flask project

A simple flask template for getting up and running quickly.

## Requirements

* nginx
* python packages: flask, gunicorn
* make

For the purposes of this page, I'm assuming Ubuntu. Adjust commands for other Linux
distributions.

To install the requirements on Ubuntu you can do:

    sudo apt-get update
    sudo apt install nginx python3-flask gunicorn3 make

## Configuration

Modify `application/app/routes.py` to serve your site. The default is simply a line that
says `It works!`.

## Installation

The following installs both the nginx and gunicorn configuration files as well as the
project files:

    sudo make install

If you update the project, simply run this again and restart the server. Note that it
will recopy the configuration files. Thus, edit configuration files here if needed and
then run `sudo make install` again.

## Run server

To enable the server to run at boot and start right away do do:

    sudo systemctl enable --now gunicorn
    sudo systemctl enable --now  nginx
