Hello :wave: @{_username_}!

Before merging this PR, complete the following steps in order to finish setting up your respository.

1. Create an ssh key-pair.  Open <a href="https://8gwifi.org/sshfunctions.jsp" target="_blank">this utility</a>. Select: `RSA` and `4096` and leave `Passphrase` blank.  Click the blue button `Generate-SSH-Keys`. Alternatively, create a key pair on your local machine.
2. Navigate to <a href="https://github.com/{_username_}/{_repo_name_}/settings/secrets" target="_blank">this link</a> and click `Add a new secret`.  Copy and paste the **Private Key** into the `Value` field. This includes the "---BEGIN RSA PRIVATE KEY---" and "--END RSA PRIVATE KEY---" portions. In the `Name` field, name the secret `AWS_EC2_KEY`.  
3. Add the public key to your AWS account under key pairs by going <a href="https://console.aws.amazon.com/ec2/#KeyPairs:" target="_blank">here</a>. You will need to choose "import key pair" under the white "Actions" drop down.
4. <a href="https://console.aws.amazon.com/ec2#LaunchInstanceWizard:" target="_blank">Create an AWS EC2 instance</a>. Ensure port 80 is accessible to the world. Additionally use the keypair you just setup for this instance.
5. <a href="https://console.aws.amazon.com/ec2#AllocateAddress:">Allocate an Elastic IP address</a> and associate it with your instance. 
6. Create an A record with your domain registrar for your domain or subdomain for the IP address.
7. Update `ansible/deploy/hosts` in your repository for your domain/subdomain (replace `test.barnett.science` with your domain). Commit the change and push it to master.
8. Visit your domain/subdomain in a web browser. You should see a message "It works!".

After merging your PR, you're README.md will be updated with next steps.
