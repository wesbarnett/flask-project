Hello :wave: @{_username_}!

Before merging this PR, complete the following steps in order to finish setting up your respository.

## Keys

1. Create an ssh key-pair. The preferred way to do this is on your local machine, but some third-party utilities will do this for you. If you are using AWS, you can [go here](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#CreateKeyPair:) to generate a key pair, which saves you a step below.
2. Go to <a href="https://github.com/{_username_}/{_repo_name_}/settings/secrets/new" target="_blank">this link</a> to create a new secret for your repository.  Copy and paste the **private key** into the `Value` field. This includes the "---BEGIN RSA PRIVATE KEY---" and "--END RSA PRIVATE KEY---" portions. In the `Name` field, name the secret `AWS_EC2_KEY`.  
3. If you did not use AWS to generate your keypairAdd the public key to your AWS account under key pairs by going <a href="https://console.aws.amazon.com/ec2/#KeyPairs:" target="_blank">here</a>. You will need to choose "import key pair" under the white "Actions" drop down.

## AWS setup

1. <a href="https://console.aws.amazon.com/ec2#LaunchInstanceWizard:" target="_blank">Create an AWS EC2 instance</a> if you have not done so already. Ensure port 80 is accessible to the world. If you plan to use SSL, also add port 443. Additionally use the keypair you just setup for this instance.
2. <a href="https://console.aws.amazon.com/ec2#AllocateAddress:">Allocate an Elastic IP address</a> and associate it with your instance. 
3. Create an A record with your domain registrar for your domain or subdomain for the IP address.

## Configuration

Update <a href="https://github.com/{_username_}/{_repo_name_}/edit/master/ansible/deploy/hosts">`ansible/deploy/hosts`</a> in your repository for your domain/subdomain (replace `test.barnett.science` with your domain). Commit the change and push it to master. Editing in the browser directly works fine as well. Wait a few minutes for the Github action to complete. You can find its status [here](https://github.com/{_username_}/{_repo_name_}/actions).

## Verification

Visit your domain/subdomain in a web browser. You should see a message "It works!".

After completing the above steps, merge this PR and your README.md will be updated.

## SSL

This step is optional for those who want to serve using HTTPS. Ensure that your site is
served over HTTP before proceeding.

To enable SSL for your site, ensure that port 443 is open in your EC2 security group for
inbound connections. Then SSH into your EC2 instance and follow the instructions to use
Let's Encrypt's certbot [found
here](https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx).

After this is complete, simply change `SSL=True` in `ansible/deploy/hosts` and push.
This sets a boolean variable such that the nginx configuration for your domain is
changed to serve using HTTPS. Additionally all HTTP traffic will be redirected to HTTPS.
This is an important step, because if you do not change this variable the nginx
configuration will be overwritten with one that only serves over HTTP the next time you
push.

