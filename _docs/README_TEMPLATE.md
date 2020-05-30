![](https://github.com/{_username_}/{_repo_name_}/workflows/CI/badge.svg) 

# My flask project

You've completed setup of your flask project repository!

## Next steps

- Anytime you push changes to your master branch, Github Pages will run an Ansible playbook to update your Flask server on your EC2 instance (or whatever server you are using). You can monitor the logs of this if you like on the Actions tab of your repo.
- If you make updates to the directory structure, like moving `__init__.py` to another location, you may break the Github action from working. It expects `__init__.py` to be under application/app. If you want it elsewhere, you’ll need to modify the ansible templates yourself. Other than that, there shouldn’t be any restrictions on what you can change or add to your flask server (templates, static files, etc.).
- You can add additional Python packages to the top-level `requirements.txt` and they will be installed automatically as part of the ansible provisioning.
- You can still ssh into your EC2 instance and check the status of both the gunicorn service (`flask-project.service` by default) and nginx service (`nginx.service`) using systemd. Note that if you make any changes to flask-project.service or the nginx configuration you should do that in the ansible template in your repository, not in your instance directly; otherwise, any changes you make to those files will be overwritten by your ansible playbook when you push later.

## Run locally

To run with gunicorn on your local machine do:

    gunicorn --chdir application -b :8080 app:app

Then visit `http://localhost:8080`.

## See also

<a href="https://barnett.science/linux/aws/ansible/github/2020/05/28/flask-actions.html" target="_blank">This blog post</a> has more information on these steps.
