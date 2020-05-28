# flask project

Barebones flask project that continuously deploys to an AWS EC2 instance using
Github actions and Ansible.

## Setup

1. Fork the repository and clone your fork to your local machine.
2. Create an SSH keypair without a passphrase. Go to the settings for your fork and add
   a secret containing the private key. Name it `AWS_EC2_KEY`.
3. Add the public key to your AWS account under key pairs. You will need to choose
   "import key pair".
4. Create an AWS EC2 instance and associate an Ellastic IP address with it. Ensure port
   80 is accessible to the world
5. Create an A record for your domain or subdomain for the IP address.
6. Update `ansible/deploy/hosts` for your domain/subdomain.
7. Make a change locally and push the change to your fork.
8. Visit your domain/subdomain. You should see a message "It works!".

## Continuous deployment

Every time a push is made to the master branch, the Github Action that updates your EC2
instance will run. In other words, you should make development changes in another
branch, test them, and when satisfied they are ready for production, merge them into
your master branch and push to Github.

To add other Python packages to your deployment, update the `requirements.txt`.

## Run locally

To run with gunicorn do:

    gunicorn --chdir application -b :8080 app:app

Then visit `http://localhost:8080`.
