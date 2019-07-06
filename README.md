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

You can also use a python virtual environment but will need to modify `gunicorn.service`
to make this work properly.

## Configuration

Modify `application/app/routes.py` to serve your site. The default is simply a line that
says `It works!`.

## Installation

Do the following to install both the configuration files and project files:

    sudo make install

If you update the project, simply run this again and restart the server. **Note that it
will recopy the configuration files.** Thus, edit configuration files here if needed and
then run `sudo make install` again.

To test that everything is okay do:

    curl localhost

You should see `It works!` or the index page of your website if you modified it.

## HTTPS

Add an `A` Record for the IP address for your server with your domain registrar.

In `extra/nginx.conf` uncomment the line starting with `server_name` and replace `example.com`
with your domain name. Rerun the installation.

Then install certbot:

    sudo apt-get install software-properties-common
    sudo add-apt-repository universe
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt-get update
    sudo apt-get install certbot python-certbot-nginx
    sudo certbot --nginx
    
Then copy the now-modified configuration file at `/etc/nginx/nginx.conf` back to the
location of this repository in your home directory and commit it with git! For example:

    cd /home/ubuntu/flask-project
    sudo cp /etc/nginx/sites-available/flask-project.conf ./extra/nginx.conf
    git add extra/nginx.conf
    git commit -m 'add https'
