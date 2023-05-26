#!/bin/bash

# Ubuntu 22.04 server setup
# Colors
COLOR_RED="\e[31m"
COLOR_RESET="\e[0m"

# 1. The line `USERNAME="lewis"` sets the username variable to "lewis". You may need to replace "lewis" with the actual username you want to set.
# Set the username
USERNAME="lewis"

# Set error handling
set -e

# Function to handle errors
handle_error() {
  local error_message="$1"
  echo "${COLOR_RED}Error: ${error_message}${COLOR_RESET}"
  exit 1
}

# Function to modify needrestart.conf file
modify_needrestart_conf() {
  echo -e "${COLOR_RED}Modifying needrestart.conf file${COLOR_RESET}"

  if sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/" /etc/needrestart/needrestart.conf; then
    echo "needrestart.conf file modified successfully."
  else
    handle_error "Failed to modify needrestart.conf file."
  fi
}

# Function to install Nala package
install_nala_package() {
  echo -e "${COLOR_RED}Install Nala package${COLOR_RESET}"

  if apt update && apt install nala -y; then
    echo "Nala package installed successfully."
  else
    handle_error "Failed to install Nala package."
  fi
}

# Function to download 45drives sources file
download_sources_file() {
  echo -e "${COLOR_RED}Downloading 45drives sources file${COLOR_RESET}"
  if curl -sSL https://repo.45drives.com/setup > /tmp/curl_log.txt 2>&1; then
    echo "Sources file downloaded successfully."
  else
    handle_error "Sources file download failed. Check the log for more information."
    cat /tmp/curl_log.txt
  fi

  echo -e "${COLOR_RED}Adding 45drives keys${COLOR_RESET}"
  if wget -qO - http://images.45drives.com/repo/keys/aptpubkey.asc | gpg --dearmor --yes --output /etc/apt/trusted.gpg.d/45drives.gpg; then
    echo "45drives keys added successfully."
  else
    handle_error "Failed to add 45drives keys."
  fi

  echo -e "${COLOR_RED}Downloading 45drives.list file${COLOR_RESET}"
  if cd /etc/apt/sources.list.d; then
    if sudo wget http://images.45drives.com/repo/debian/45drives.list; then
      echo "45drives.list file downloaded successfully."
    else
      handle_error "Failed to download 45drives.list file."
    fi
  else
    handle_error "Failed to change directory to /etc/apt/sources.list.d."
  fi
}

# Update .bashrc for APT to Nala conversion
update_bashrc() {
    echo -e "${COLOR_RED}Updating .bashrc for APT to Nala conversion${COLOR_RESET}"
    local bashrc_path="/home/$USERNAME/.bashrc"
    local root_bashrc_path="/root/.bashrc"

    # Add apt() function to .bashrc
    echo "apt() { command nala \"\$@\"; }" | tee -a "$bashrc_path" "$root_bashrc_path" > /dev/null

    # Add sudo() function to .bashrc
    echo "sudo() {
        if [ \"\$1\" = \"apt\" ]; then
            shift
            command sudo nala \"\$@\"
        else
            command sudo \"\$@\"
        fi
    }" | tee -a "$bashrc_path" "$root_bashrc_path" > /dev/null

    echo "Updated .bashrc files for APT to Nala conversion."
}

# Function to add repository, update, and upgrade
add_repo_update_upgrade() {
  echo -e "${COLOR_RED}Adding repository, updates, upgrades${COLOR_RESET}"
  if add-apt-repository universe -y && \
     add-apt-repository multiverse -y && \
     nala update && \
     nala upgrade -y; then
    echo "Repository setup, updates, and upgrades completed successfully."
  else
    handle_error "Repository setup, updates, or upgrades failed."
  fi
}

# Function to install packages
install_packages() {
  echo -e "${COLOR_RED}Adding packages and tools${COLOR_RESET}"

  packages=(
    "curl"
    "gnupg"
    "ca-certificates"
    "lsb-release"
    "resolvconf"
    "avahi-autoipd"
    "isc-dhcp-client-ddns"
    "network-manager"
    "wpasupplicant"
    "openvswitch-switch"
    "netplan.io"
    "software-properties-common"
    "fdisk"
    "gdisk"
    "isc-dhcp-client"
    "tzdata"
    "firewalld"
    "nano"
    "vim-nox"
    "apt-utils"
    "dialog"
    "locales"
    "ssh"
    "openssh-server"
    "net-tools"
    "tuned"
    "tuned-utils"
    "tuned-utils-systemtap"
    "cockpit"
    "cockpit-benchmark"
    "cockpit-navigator"
    "cockpit-pcp"
    "cockpit-sosreport"
    "cockpit-file-sharing"
    "cockpit-packagekit"
  )

  for package in "${packages[@]}"; do
    echo "Installing $package..."
    if ! nala install -y "$package"; then
      handle_error "Package installation failed. Exiting script."
    fi
  done
}

# Install Docker
install_docker() {
  echo -e "${COLOR_RED}Installing Docker${COLOR_RESET}"
  mkdir -p /etc/apt/keyrings || handle_error "Failed to create directory /etc/apt/keyrings."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg || handle_error "Failed to download Docker GPG key."
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || handle_error "Failed to add Docker repository."
  nala update || handle_error "Failed to update packages."
  nala install -y docker-ce docker-ce-cli containerd.io || handle_error "Failed to install Docker."
}

# Install Docker Compose
install_docker_compose() {
  echo -e "${COLOR_RED}Installing Docker Compose${COLOR_RESET}"
  curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose || handle_error "Failed to install Docker Compose."
  chmod +x /usr/local/bin/docker-compose || handle_error "Failed to set executable permissions for Docker Compose."
}

# Run Docker Hello World and verify Docker and Docker Compose versions
run_hello_world() {
  echo -e "${COLOR_RED}Running Docker Hello World and verifying versions${COLOR_RESET}"
  docker run hello-world || handle_error "Failed to run Docker Hello World."
  echo "Docker Hello World executed successfully."
  usermod -aG docker "$USERNAME" || handle_error "Failed to add user '$USERNAME' to the 'docker' group."
  echo "User '$USERNAME' added to the 'docker' group."
  docker version || handle_error "Failed to get Docker version information."
  echo "Docker version information displayed."
  sleep 2
  docker-compose version || handle_error "Failed to get Docker Compose version information."
  echo "Docker Compose version information displayed."
  sleep 2
  usermod -aG docker "$USER" || handle_error "Failed to add current user to the 'docker' group."
  echo "Current user added to the 'docker' group."
  mkdir /home/docker || handle_error "Failed to create directory '/home/docker'."
  chmod -R 775 /home/docker || handle_error "Failed to set permissions for directory '/home/docker'."
  chown -R "$USERNAME:$USERNAME" /home/docker || handle_error "Failed to set ownership for directory '/home/docker'."
  echo "Directory '/home/docker' created and permissions set."
  sleep 5
}

# Install Portainer
install_portainer() {
    echo -e "${COLOR_RED}Install Portainer${COLOR_RESET}"
    docker run -d -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /home/docker/portainer/portainer_data:/data portainer/portainer-ce || handle_error "Failed to install Portainer."
    wait
}

# Function to set Ubuntu Server Time
set_server_time() {
    echo -e "${COLOR_RED}Set Ubuntu Server Time${COLOR_RESET}"
    timedatectl set-timezone America/New_York &&
    sed -i 's/#NTP=/NTP=0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org/' /etc/systemd/timesyncd.conf &&
    sed -i 's/#FallbackNTP=/FallbackNTP=ntp.ubuntu.com/' /etc/systemd/timesyncd.conf &&
    systemctl restart systemd-timesyncd.service

    if timedatectl; then
        echo "Ubuntu Server time set successfully."
    else
        handle_error "Failed to set Ubuntu Server time."
    fi
}

# Start and enable Firewalld service
#start_firewalld() {
#    echo -e "${COLOR_RED}Starting and enabling Firewalld service${COLOR_RESET}"
#    if ! systemctl start firewalld; then
#        handle_error "Failed to start Firewalld service."
#    fi
#
#    if ! systemctl enable firewalld; then
#        handle_error "Failed to enable Firewalld service."
#    fi
#
#    echo "Firewalld service started and enabled successfully."
#}

# Configure Firewall rules
#configure_firewall() {
#    echo -e "${COLOR_RED}Configuring Firewall rules${COLOR_RESET}"
#    if ! firewall-cmd --permanent --add-service=http; then
#        handle_error "Failed to add http service to firewall rules."
#    fi
#
#    if ! firewall-cmd --permanent --add-service=https; then
#        handle_error "Failed to add https service to firewall rules."
#    fi
#
#    if ! firewall-cmd --permanent --add-port=7676/tcp; then
#        handle_error "Failed to add port 7676 to firewall rules."
#    fi
#
#    if ! firewall-cmd --reload; then
#        handle_error "Failed to reload firewall rules."
#   fi
#
#    echo "Firewall rules configured successfully."
#}

# Edit SSH configuration
edit_ssh_config() {
    echo -e "${COLOR_RED}Editing SSH configuration${COLOR_RESET}"
    if sed -i 's/#Port 22/Port 7676/' /etc/ssh/sshd_config; then
        echo "SSH configuration edited successfully."
    else
        handle_error "Failed to edit SSH configuration."
    fi

    if sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config; then
        echo "SSH configuration edited successfully."
    else
        handle_error "Failed to edit SSH configuration."
    fi
}

# Restart SSH service
restart_ssh_service() {
    echo -e "${COLOR_RED}Restarting SSH service...${COLOR_RESET}"
    if systemctl restart ssh; then
        echo "SSH service restarted successfully."
    else
        handle_error "Failed to restart SSH service."
    fi
}

# Remove snap packages
remove_snap_packages() {
    echo -e "${COLOR_RED}Removing snap packages${COLOR_RESET}"
    sudo snap remove --purge lxd || handle_error "Failed to remove snap package 'lxd'."
    sudo snap remove --purge bare || handle_error "Failed to remove snap package 'bare'."
    sudo snap remove --purge core20 || handle_error "Failed to remove snap package 'core20'."
    sudo snap remove --purge snapd || handle_error "Failed to remove snap package 'snapd'."
    
    echo "Snap packages removed successfully."
}

# Remove snap daemon
remove_snap_daemon() {
    echo -e "${COLOR_RED}Removing snap daemon${COLOR_RESET}"
    
    sudo nala remove --autoremove -y snapd || handle_error "Failed to remove snap daemon."
    
    echo "Snap daemon removed successfully."
}

# Create apt preference file to stop snap
create_apt_preference_file() {
    echo -e "${COLOR_RED}Creating apt preference file to stop snap${COLOR_RESET}"
    
    sudo tee /etc/apt/preferences.d/nosnap.pref > /dev/null << EOL
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOL
    
    echo "Apt preference file created successfully."
}

# Update /etc/sysctl.conf
update_sysctl_conf() {
    echo -e "${COLOR_RED}Updating /etc/sysctl.conf${COLOR_RESET}"
    echo "fs.file-max=100000" | sudo tee -a /etc/sysctl.conf > /dev/null
    echo "vm.overcommit_memory = 1" | tee -a /etc/sysctl.conf > /dev/null
}

# Update /etc/security/limits.conf
update_limits_conf() {
    echo -e "${COLOR_RED}Updating /etc/security/limits.conf${COLOR_RESET}"
    echo "* soft nofile 1000000" | tee -a /etc/security/limits.conf > /dev/null
    echo "* hard nofile 1000000" | tee -a /etc/security/limits.conf > /dev/null
}

# Update /etc/pam.d/common-session
update_common_session() {
    echo -e "${COLOR_RED}Updating /etc/pam.d/common-session${COLOR_RESET}"
    echo "session required        pam_limits.so" | tee -a /etc/pam.d/common-session > /dev/null
}

# Apply changes using sysctl
apply_changes() {
    echo -e "${COLOR_RED}Applying changes${COLOR_RESET}"
    sysctl -p /etc/sysctl.conf
}

# Start Cockpit
start_cockpit() {
    echo -e "${COLOR_RED}Start Cockpit${COLOR_RESET}"
    if ! systemctl start cockpit.socket; then
        handle_error "Failed to start Cockpit."
    fi

    if ! systemctl enable cockpit.socket; then
        handle_error "Failed to enable Cockpit."
    fi

    echo "Cockpit started and enabled successfully."
}

# Function to disable cloud-init
disable_cloud_init() {
  echo -e "${COLOR_RED}Disable cloud-init${COLOR_RESET}"

  echo "datasource_list: [ None ]" | sudo tee /etc/cloud/cloud.cfg.d/90_disable_cloud-init.cfg > /dev/null

  if ! systemctl stop cloud-init; then
    handle_error "Failed to stop cloud-init."
  fi

  sleep 5

  if ! systemctl disable cloud-init; then
    handle_error "Failed to disable cloud-init."
  fi

  if ! systemctl mask cloud-init; then
    handle_error "Failed to mask cloud-init."
  fi

  echo "Cloud-init disabled successfully."
}

# Perform updates and upgrades
perform_updates() {
    echo -e "${COLOR_RED}Perform final updates and upgrades${COLOR_RESET}"

    if ! nala update &&
        ! nala upgrade -y &&
        ! nala autoremove &&
        ! nala clean -y
    then
        handle_error "Updates or upgrades failed."
    fi

    echo "Updates and upgrades completed successfully."
}

# Function to edit Netplan .yaml file
edit_netplan_yaml() {
  echo -e "${COLOR_RED}Editing Netplan .yaml file${COLOR_RESET}"
  local config_file="/etc/netplan/00-installer-config.yaml"
  local config_content="network:
  ethernets:
    eth0:
      dhcp4: true
  version: 2
  renderer: NetworkManager"

  # Write the configuration to the file
  echo "$config_content" | sudo tee "$config_file" > /dev/null

  echo "Netplan .yaml file edited successfully."
}

# Function to apply Netplan changes
apply_netplan_changes() {
  echo -e "${COLOR_RED}Applying Netplan changes${COLOR_RESET}"
  sudo netplan apply
  echo "Netplan changes applied successfully."
}

# Setup complete
setup_done() {
    local response=""

    echo -e "${COLOR_RED}##### Setup complete #####${COLOR_RESET}"

    read -r -p "Reboot system now? [y/N]: " response

    case $response in
        [yY]|[yY][eE][sS])
            reboot now || handle_error "Failed to reboot system."
            ;;
        *)
            echo -e "${COLOR_RED}##### Reboot soon to finish configuration. #####${COLOR_RESET}"
            exit 0
            ;;
    esac

    return 0
}

# Call the modify_needrestart_conf function
modify_needrestart_conf || handle_error "Failed to modify needrestart.conf file."

sleep 1

# Call the install_nala_package function
install_nala_package || handle_error "Failed to install Nala package."

sleep 2

# Call the download_sources_file function
download_sources_file || handle_error "Failed to download 45drives sources file."

sleep 1

# Call the update_bashrc function
update_bashrc || handle_error "Failed to update .bashrc files for APT to Nala conversion."

# Call the add_repo_update_upgrade function
add_repo_update_upgrade || handle_error "Failed to add repository, perform updates, or upgrades."

sleep 2

# Call the install_packages function
install_packages || handle_error "Failed to install packages."

sleep 5

# Call the install_docker function
install_docker || handle_error "Failed to install Docker."

sleep 5

# Call the install_docker_compose function
install_docker_compose || handle_error "Failed to install Docker Compose."

sleep 2

# Call the run_hello_world function
run_hello_world || handle_error "Failed to execute Docker Hello World and verify versions."

sleep 2

# Call the install_portainer function
install_portainer

# Call the set_server_time function
set_server_time || handle_error "Set Ubuntu Server Time."

sleep 2

# Call the start_firewalld function
#start_firewalld || handle_error "Failed to start and enable Firewalld service."

#sleep 2

# Call the configure_firewall function
#configure_firewall || handle_error "Failed to configure Firewall rules."

#sleep 1

# Call the edit_ssh_config function
edit_ssh_config || handle_error "Failed to edit SSH configuration."

sleep 2

# Call the restart_ssh_service function
restart_ssh_service || handle_error "Failed to restart SSH service."

sleep 2

# Call the remove_snap_packages function
remove_snap_packages || handle_error "Failed to remove snap packages."

# Call the remove_snap_daemon function
remove_snap_daemon || handle_error "Failed to remove snap daemon."

# Call the create_apt_preference_file function
create_apt_preference_file || handle_error "Failed to create apt preference file."

sleep 15

# Call the update_sysctl_conf function
update_sysctl_conf || handle_error "Failed to update /etc/sysctl.conf"

sleep 2

# Call the update_limits_conf function
update_limits_conf || handle_error "Failed to update /etc/security/limits.conf"

sleep 2

# Call the update_common_session function
update_common_session || handle_error "Failed to update /etc/pam.d/common-session"

sleep 2

# Call the apply_changes function
apply_changes || handle_error "Failed to apply changes"

sleep 2

# Call the start_cockpit function
start_cockpit || handle_error "Failed to start Cockpit."

sleep 2

# Call the disable_cloud_init function
disable_cloud_init || handle_error "Failed to disable cloud-init."

sleep 2

# Call the perform_updates function
perform_updates || handle_error "Failed to perform updates and upgrades."

sleep 2

# Call the edit_netplan_yaml function
edit_netplan_yaml || handle_error "Failed to edit Netplan .yaml file."

sleep 5

# Call the apply_netplan_changes function
apply_netplan_changes || handle_error "Failed to apply Netplan changes."

sleep 2

# Call the setup_done function
setup_done || handle_error "Failed to complete setup."