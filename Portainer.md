# Install Portainer Docker UI Web Interface

Portainer is a web-based graphical user interface (UI) that allows you to manage Docker images and containers without using the command line. It provides an easy way to deploy, monitor, and manage containers, networks, and volumes. This guide will walk you through the steps to install Portainer on Ubuntu Server.

## Step 1: Create a Portainer Container

To install Portainer, run the following command to create a Docker container:

```bash
docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /home/docker/portainer/portainer_data:/data portainer/portainer-ce
```

Explanation of the command and its options:

- `-d`: Runs the container as a daemon process.
- `-p 9000:9000`: Maps the host's port 9000 to the container's port 9000, allowing access to Portainer's web UI through the host.
- `-p 9443:9443`: Maps the host's port 9443 to the container's port 9443, allowing access to Portainer's web UI over SSL through the host.
- `--name portainer`: Gives the name "portainer" to the container.
- `--restart always`: Automatically restarts the container if it stops or crashes.
- `-v /var/run/docker.sock:/var/run/docker.sock`: Mounts the host's Docker socket in the container, enabling Portainer to communicate with the host's Docker daemon.
- `-v /home/docker/portainer/portainer_data:/data`: Specifies the location where Portainer will store its data. Adjust the path according to your preference.
- `portainer/portainer-ce`: Specifies the image name and tag to use, in this case, "portainer/portainer-ce," which is the official Portainer image from Docker Hub.

## Step 2: Verify the Portainer Container

To verify that the Portainer container is running, execute the following command:

```bash
sudo docker ps
```

You should see the Portainer container listed in the output, indicating that it is running.

### Step 3: Access the Portainer Web UI

You can now access the Portainer web UI by opening your web browser and visiting `http://<your_server_ip>:9000`. Replace `<your_server_ip>` with the IP address of your Ubuntu Server.

For example, if your server's IP address is `172.17.0.1`, you would access the Portainer web UI by visiting `http://172.17.0.1:9000`.

Congratulations! You have successfully installed Portainer on your Ubuntu Server. You can now use the web interface to manage your Docker containers, images, networks, and volumes.

## [`Home`](Table_of_Contents.md) [`Next`](Dynamic_motd.md)
