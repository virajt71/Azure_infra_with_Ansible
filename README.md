# Azure Infrastructure with Terraform and Ansible

This project provides Infrastructure as Code (IaC) for deploying a web application on Azure using Terraform for infrastructure provisioning and Ansible for configuration management.

## Architecture Overview

The infrastructure consists of:
- Azure Virtual Machines running Ubuntu 22.04 LTS
- Virtual Network with subnets and network security groups
- Public IP addresses for internet access
- Docker-based web application deployment
- Automated configuration using Ansible

## Project Structure

```
.
├── backend/                    # Terraform backend configuration
├── envs/                       # Environment-specific configurations
│   ├── dev/                    # Development environment
│   ├── staging/                # Staging environment
│   └── prod/                   # Production environment
├── modules/                    # Reusable Terraform modules
│   ├── ansible/                # Ansible playbook execution
│   ├── compute/                # Virtual machine resources
│   ├── network/                # Network resources
│   └── resource-group/         # Resource group management
└── ansible-config/             # Ansible configuration
    ├── playbook.yml            # Main playbook
    ├── requirements.yml        # Ansible collections
    └── roles/                  # Ansible roles
        ├── docker/             # Docker installation
        └── webapp/             # Web application deployment
```
## Ansible Configuration

### Roles

#### Docker Role
Installs and configures Docker:
- Adds Docker repository
- Installs Docker Engine
- Configures user permissions
- Enables Docker service

#### Webapp Role
Deploys the web application:
- Clones Git repository
- Builds Docker image
- Runs container with restart policy

### Running Playbooks Manually

```bash
cd ansible-config

# Install required collections
ansible-galaxy collection install -r requirements.yml

# Run playbook
ansible-playbook -i <public_ip>, playbook.yml \
  -u azureuser \
  --ask-pass \
  --ask-become-pass
```

## Roadmap

- [ ] Add Azure Key Vault integration
- [ ] Implement Azure Monitor and Log Analytics
- [ ] Add Application Gateway for load balancing
- [ ] Configure automated backups
- [ ] Add CI/CD pipeline examples
- [ ] Implement blue-green deployment strategy
