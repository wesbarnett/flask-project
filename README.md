# flask project

Barebones flask project that continuously deploys to an AWS EC2 instance using
Github actions and Ansible.

![](https://barnett.science/images/github_actions/diagram.png)

## Setup

1. Generate a new repository based on this one by [clicking here](https://github.com/wesbarnett/flask-project/generate).
2. A new issue will be opened in your repository a few minutes after you generate the repository, outlining the next steps. Essentially you will generate a keypair, store private key in Github and the public on AWS, provision your EC2 instance, update your domain's A record to point to it, and then update one configuration file.

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

## References

I found [this](https://github.com/Preetam/transverse/tree/master/.github)
repository helpful in setting up Ansible for use with Github workflows and actions and
just want to give a shout out to it.

I was also inspired by the work done by [fastpages](https://github.com/fastai/fastpages/) which uses Github workflows and
actions to automatically update Github pages. I definitely looked at several of their
files and borrowed some of their ideas!

## See also

See the [original blog post
here](https://barnett.science/linux/aws/ansible/github/2020/05/28/flask-actions.html)
with further details on these instructions.
