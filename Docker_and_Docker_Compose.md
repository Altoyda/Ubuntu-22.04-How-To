# Install Docker and Docker Compose

Docker is a popular containerization platform that allows you to run applications in isolated environments called containers. Docker Compose is a tool that simplifies the management of multi-container Docker applications. This guide will walk you through the steps to install Docker and Docker Compose on Ubuntu Server.

## Step 1: Add Docker's Public GPG Key

To verify the packages received during installation, we need to add Docker's public GPG key.

1. Install the required packages by running the following command:

   ```bash
   sudo apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
   ```

2. Add the GPG key by executing the following commands:

   ```bash
   sudo mkdir -p /etc/apt/keyrings
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
   ```

## Step 2: Add Docker Repository

Next, we'll add the Docker repository to Ubuntu Server.

1. Run the following command to add the Docker repository:

   ```bash
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   ```

## Step 3: Update the System

Now, update the system to rebuild the APT package index cache and recognize the newly added Docker repository.

```bash
sudo apt update
```

## Step 4: Install Docker and Docker Compose

We are now ready to install Docker and Docker Compose on Ubuntu Server.

1. Run the following command to install Docker and Docker Compose:

   ```bash
   sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
   ```

   Note: This command will install Docker Engine, Docker CLI, and Docker Compose on your system.

2. Verify the installation by checking the Docker and Docker Compose versions:

   ```bash
   docker version
   docker compose version
   ```

## Step 5: Add User to Docker Group

To use Docker without using `sudo` (which can have security implications), add your user to the Docker group.

```bash
sudo usermod -aG docker $USER
```

After adding your user to the Docker group, log out and log back in for the changes to take effect.

## Step 6: Create Directory for Docker Data Storage

To store Docker data and enable easy data restoration, create a directory to serve as the storage location.

1. Create the directory by running the following command:

   ```bash
   sudo mkdir /home/docker
   ```

2. Modify the access permissions for the directory:

   ```bash
   sudo chmod -R 775 /home/docker
   ```

3. Change the ownership of the directory to your user:

   ```bash
   sudo chown -R yourname:yourname /home/docker
   ```

   Note: Replace `yourname` with your actual username.

4. Verify the permissions and ownership by running the following command:

   ```bash
   ls -l /home
   ```

   The output should show the ownership and permissions of the `/home/docker` directory.

Docker and Docker Compose are now installed on your Ubuntu Server. You can start using Docker to deploy and manage containerized applications.

## [`Home`](Table_of_Contents.md) [`Next`](Portainer.md)
