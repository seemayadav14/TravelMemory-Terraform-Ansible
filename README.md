# TravelMemory – MERN Application Deployment Using Terraform and Ansible

## 1. Project Overview

This project demonstrates the deployment of the TravelMemory MERN (MongoDB, Express.js, React.js, Node.js) application on AWS using Infrastructure as Code (IaC) and configuration management tools.

Terraform is used to provision AWS infrastructure, while Ansible automates the configuration of the database server and web server and deploys the application.

The objective is to create a secure, automated and repeatable cloud deployment.

## 2. Project Objectives

- Provision AWS infrastructure using Terraform.
- Configure networking with public and private subnets.
- Create and configure EC2 instances for the web application and database.
- Configure IAM roles and security groups.
- Install and configure MongoDB using Ansible.
- Deploy the TravelMemory backend and frontend using Ansible.
- Configure Nginx as the web server and reverse proxy.
- Verify application availability and database connectivity.
- Maintain project code and execution evidence in GitHub.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| AWS | Cloud infrastructure |
| Terraform | Infrastructure provisioning |
| Ansible | Configuration management and deployment |
| Ubuntu Linux | EC2 operating system |
| MongoDB | Database |
| Node.js | Backend runtime |
| Express.js | Backend framework |
| React.js | Frontend |
| Nginx | Web server and reverse proxy |
| Git and GitHub | Version control and submission |
| WSL Ubuntu | Ansible execution environment |

## 4. AWS Infrastructure Architecture

The infrastructure was deployed in the AWS Mumbai region (`ap-south-1`).

The architecture includes:

- One Virtual Private Cloud (VPC).
- One public subnet for the web server.
- One private subnet for the database server.
- Internet Gateway for public connectivity.
- NAT Gateway for outbound connectivity from the private subnet.
- Public and private route tables.
- Security groups to control inbound and outbound traffic.
- IAM role and instance profile for EC2 permissions.
- EC2 web server and database server.

### Server Configuration

**Web Server**
- Runs in the public subnet.
- Hosts the TravelMemory frontend and backend.
- Uses Nginx to serve the React frontend.
- Proxies backend requests to the Node.js application.

**Database Server**
- Runs in the private subnet.
- Hosts MongoDB.
- Does not require direct public internet access for incoming database connections.
- Accepts MongoDB traffic from the web server security group.

## 5. Terraform Implementation

Terraform was used to provision and manage the AWS infrastructure.

### Terraform Files

| File | Description |
|---|---|
| `provider.tf` | AWS provider configuration |
| `variables.tf` | Input variables such as region, project name and SSH IP |
| `network.tf` | VPC, subnets, gateways and route tables |
| `iam.tf` | IAM role and instance profile |
| `security.tf` | Web and database security groups |
| `main.tf` | EC2 instances and key pair configuration |
| `outputs.tf` | Infrastructure output values |

### Terraform Execution

The following commands were used:

```bash
terraform init
terraform validate
terraform plan -out=travelmemory.tfplan
terraform apply travelmemory.tfplan
```

Terraform initialization, validation, planning and infrastructure provisioning were completed successfully.

## 6. Ansible Implementation

Ansible was used to automate server configuration and application deployment.

### Ansible Files

| File | Description |
|---|---|
| `ansible.cfg` | Ansible configuration |
| `inventory.ini` | Web and database server inventory |
| `database.yml` | MongoDB installation and configuration |
| `webserver.yml` | Web server setup and TravelMemory application deployment |

### Database Configuration

The database playbook performs the following tasks:

1. Installs required packages.
2. Adds the MongoDB repository and GPG key.
3. Installs MongoDB.
4. Configures MongoDB network binding.
5. Starts and enables the MongoDB service.

### Web Server Configuration

The web server playbook performs the following tasks:

1. Updates system packages.
2. Installs Git, Node.js, npm, Nginx and required build tools.
3. Clones the TravelMemory application repository.
4. Installs backend dependencies.
5. Configures backend environment variables.
6. Creates and starts the backend systemd service.
7. Installs frontend dependencies.
8. Builds the React frontend.
9. Copies the frontend build into the Nginx web directory.
10. Configures Nginx to serve the frontend and proxy backend requests.
11. Enables and starts the required services.

The Ansible deployment completed successfully with zero failed tasks in the final execution.

## 7. Application Deployment and Testing

The TravelMemory application was deployed successfully on AWS.

### Verification Results

| Component | Verification | Result |
|---|---|---|
| Terraform | Infrastructure provisioning | Successful |
| Ansible | Final web deployment playbook | Successful |
| Backend | systemd service status | Active (running) |
| MongoDB | Backend database connection | Connected |
| Nginx | Web server status and HTTP response | Successful |
| Frontend | Browser access | Successful |
| Health API | HTTP health endpoint | HTTP 200 OK |

### Application URL

`http://3.110.216.131`

### Health Check URL

`http://3.110.216.131/health`

### Health Check Response

```json
{
  "status": "ok",
  "db": "connected"
}
```

The health endpoint confirmed that the backend application was running and successfully connected to MongoDB at the time of testing.

## 8. Screenshots and Execution Evidence

The `screenshots/` directory contains six screenshots documenting the implementation and verification stages.

| Screenshot | Evidence |
|---|---|
| `01-terraform-init.png` | Terraform initialization |
| `02-terraform-validate.png` | Terraform validation |
| `03-terraform-plan.png` | Terraform execution plan |
| `04-terraform-apply-success.png` | Successful Terraform apply |
| `05-health-api-success.png` | Application health API and database connection |
| `06-ansible-deployment-success.png` | Successful Ansible deployment |

## 9. Project Repository Structure

```text
TravelMemory-Terraform-Ansible/
│
├── terraform/
│   ├── provider.tf
│   ├── variables.tf
│   ├── network.tf
│   ├── iam.tf
│   ├── security.tf
│   ├── main.tf
│   └── outputs.tf
│
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini
│   ├── database.yml
│   └── webserver.yml
│
├── screenshots/
│   ├── 01-terraform-init.png
│   ├── 02-terraform-validate.png
│   ├── 03-terraform-plan.png
│   ├── 04-terraform-apply-success.png
│   ├── 05-health-api-success.png
│   └── 06-ansible-deployment-success.png
│
├── .gitignore
└── README.md
```

## 10. Security Considerations

- SSH access is restricted using the configured public IP address.
- The database server is deployed in a private subnet.
- MongoDB access is restricted to the web server security group.
- Application environment files and private SSH keys are not intended for public repository storage.
- Terraform state files, credentials and generated plan files are excluded from Git tracking.

## 11. Conclusion

The TravelMemory MERN application was successfully deployed on AWS using Terraform and Ansible.

Terraform automated the infrastructure provisioning, and Ansible automated the configuration of the database and web servers and application deployment.

The frontend was accessible through the public web server, the backend service was running, and the health endpoint confirmed successful MongoDB connectivity.

This project provided practical experience with AWS infrastructure, Infrastructure as Code, configuration management, Linux administration, MERN application deployment and GitHub version control.

## 12. GitHub Repository

**Project Repository:**

https://github.com/seemayadav14/TravelMemory-Terraform-Ansible
