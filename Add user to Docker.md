
# Running Docker as a Non-Root User

Docker has been one of the best containerization tools, widely used across various industries. Developers find it effective for deploying applications in production or any other environment without dependencies on the target system.

It is always a best practice to not run any command as a sudo user since you have elevated permissions. Generally, when you install docker it needs root permission because the daemon runs as a root user. Due to this, you will have to run the docker command with sudo.  While you run with sudo, you might see the below error -
```bash
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create: dial unix /var/run/docker.sock: connect: permission denied. 
See 'docker run --help'.
```
How can you fix the above error? In case you don't want to run the docker as the root user, you can read this page to solve this issue. In this guide, we learn how to run docker as a non-root user.
## Steps to Add a User to the Docker Group
There are various ways to [add the user](https://linuxopsys.com/topics/add-user-to-sudoers-file-on-ubuntu) to a docker group. Below are the steps to follow to create a user, add the user to a group, and run docker commands as a non-root user.
### Step 1. Create a Docker Group

Skip this step if the `docker` group already exists. You can check using the following command:
```bash
grep docker /etc/group
```
To create a new group named `docker`, use the following command:
```bash
sudo groupadd docker
```
### Step 2. Add User to the Docker Group
```bash
sudo usermod -aG docker $USER
```
The [usermod](https://linuxopsys.com/topics/usermod-command-in-linux) command with -a option means that you are adding or appending the user to a particular group. This should always be used with the -G option which specifies the group that the user is currently in. $USER indicates that we are going to add the currently logged-in non-root user. For a not-logged-in user, you have to explicitly mention the username.

Alternatively, you can also use the gpasswd command to add the user to the group
```bash
sudo gpasswd -a $USER docker
```
It shall prompt for the password and upon passing the password, it adds the user to the docker group.
### Step 3. Make the Changes Effective

As you created a new group the system needs to re-evaluate the group membership.
You may run any of the following methods.

- Logging out and logging back in
- You may also run `exec su -l $USER` or `newgrp docker` command
- Restarting the Docker service:
```bash
sudo systemctl restart docker
```
(Note: If you're using a virtual machine, restarting it may be necessary.)

### Step 4. Verify

Now let us run the docker command to verify that you can run as a non-root user. Let us run the hello-world docker.
```bash
docker run hello-world
```

The command execution was successful and now we can run the hello-world docker successfully.

You can also use the `groups` command to check the group membership of the current user:
```bash
groups
```

The output should include `docker`, indicating that the current user is a member of it.

## Note

If you've previously run Docker commands as a root user, you might encounter the following error:
```bash
WARNING: Error loading config file: 
/home/user/.docker/config.json -stat 
/home/user/.docker/config.json: permission denied
```
Here is how you can fix the issue. Let us take a look.
The error indicates that the docker directory has insufficient permissions and you can either remove the docker directory or change the ownership and permissions of the docker folder.
You have to change the ownership of the docker configuration folder using [chmod](https://linuxopsys.com/topics/chmod-command-in-linux) command as shown below
```bash
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
```
## Conclusion

This solution resolves the issue where the root user owns the socket, and non-users can only access it using sudo. Adding the user to the docker group allows Docker to start with the socket accessible to its members. It's worth noting that the docker group grants root privileges to the user.

Thanks for reading! Feel free to add your suggestions and feedback.
