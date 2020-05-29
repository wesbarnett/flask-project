Hello :wave: @{_username_}!

This issue is to remind you of what steps are needed to complete setting this repository up.

1. Create an ssh key-pair.  Open <a href="https://8gwifi.org/sshfunctions.jsp" target="_blank">this utility</a>. Select: `RSA` and `4096` and leave `Passphrase` blank.  Click the blue button `Generate-SSH-Keys`. Alternatively, create a key pair on your local machine.
2. Navigate to <a href="https://github.com/{_username_}/{_repo_name_}/settings/secrets" target="_blank">this link</a> and click `Add a new secret`.  Copy and paste the **Private Key** into the `Value` field. This includes the "---BEGIN RSA PRIVATE KEY---" and "--END RSA PRIVATE KEY---" portions. In the `Name` field, name the secret `AWS_EC2_KEY`.  
3. Add the public key to your AWS account under key pairs by going <a href="https://console.aws.amazon.com/ec2/#KeyPairs:" target="_blank">here</a>. You will need to choose "import key pair" under the white "Actions" drop down.
4. Create an AWS EC2 instance and associate an Ellastic IP address with it. Ensure port 80 is accessible to the world. Additionally use the keypair you just setup for this instance.
5. Create an A record with your domain registrar for your domain or subdomain for the IP address.
6. Update `ansible/deploy/hosts` in your repository for your domain/subdomain (replace `test.barnett.science` with your domain). Commit the change push it to master.
7. Visit your domain/subdomain. You should see a message "It works!".

## Next steps

- Anytime you push changes to your master branch, Github Pages will run an Ansible playbook to update your Flask server on your EC2 instance (or whatever server you are using). You can monitor the logs of this if you like on the Actions tab of your repo.
- If you make updates to the directory structure, like moving `__init__.py` to another location, you may break the Github action from working. It expects `__init__.py` to be under application/app. If you want it elsewhere, you’ll need to modify the ansible templates yourself. Other than that, there shouldn’t be any restrictions on what you can change or add to your flask server (templates, static files, etc.).
- You can add additional Python packages to the top-level `requirements.txt` and they will be installed automatically as part of the ansible provisioning.
- You can still ssh into your EC2 instance and check the status of both the gunicorn service (`flask-project.service` by default) and nginx service (`nginx.service`) using systemd. Note that if you make any changes to flask-project.service or the nginx configuration you should do that in the ansible template in your repository, not in your instance directly; otherwise, any changes you make to those files will be overwritten by your ansible playbook when you push later.

## See also

<a href="https://barnett.science/linux/aws/ansible/github/2020/05/28/flask-actions.html" target="_blank">This blog post</a> has more information on these steps.
