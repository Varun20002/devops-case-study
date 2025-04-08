# DevOps Intern Case Study – Shadowfax

## 📦 Overview

This project demonstrates:
- Containerization with Docker
- CI/CD automation with GitHub Actions
- Infrastructure as Code using Terraform
- Basic system monitoring and alerting

---

## 🚀 Project Structure

```
├── app/                      # Flask app
├── Dockerfile                # Container setup
├── .github/workflows         # CI/CD pipeline
├── terraform/                # Infrastructure setup
├── monitoring/               # Alert scripts
└── README.md                 # Documentation
```

---

## 🐳 Docker Setup

1. Build the image:
   ```
   docker build -t flask-app .
   ```

2. Run the app:
   ```
   docker run -p 5000:5000 flask-app
   ```

App will be available at `http://localhost:5000`.

---

## ⚙️ GitHub Actions CI/CD

Workflow does the following:
- Builds and pushes Docker image to DockerHub
- Simulates deployment to a VM

### Secrets to Configure:
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `VM_IP` (optional)
- `VM_USERNAME` (optional)
- `VM_KEY` (optional)

---

## ☁️ Infrastructure (Terraform)

To provision a VM on AWS and deploy app:

```bash
cd terraform
terraform init
terraform apply
```

This launches a VM, opens ports, installs Docker, and runs the app.

---

## 📈 Monitoring

`monitoring/cpu_alert.sh` checks if CPU usage > 70%  
Use with cron to run every 5 minutes.

```bash
crontab -e
*/5 * * * * /path/to/cpu_alert.sh
```

---

## ✅ Deliverables Summary

- [x] Dockerfile ✅
- [x] CI/CD Workflow ✅
- [x] Terraform Scripts ✅
- [x] Documentation ✅

---

## 🚀 Setup and Deployment Instructions

### 📦 1. Clone the Repository
```bash
git clone https://github.com/your-username/devops-case-study.git
cd devops-case-study
```

---

### 🐳 2. Local Docker Setup (Run Flask App)

> These steps help you build and run the app in a container locally.

```bash
docker build -t flask-app .
docker run -p 5000:5000 flask-app
```

Now, open your browser and go to:  
➡️ `http://localhost:5000`  
You should see: **"Hello from Shadowfax Intern Flask App!"**

---

### 🔄 3. CI/CD Pipeline via GitHub Actions

> The pipeline builds the Docker image and pushes it to DockerHub.

**Secrets Required (Configure in GitHub → Settings → Secrets):**
- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Docker Hub access token
- `VM_IP`: Your VM's public IP (optional)
- `VM_USERNAME`: SSH username (e.g. `ubuntu`) (optional)
- `VM_KEY`: Private key for SSH (optional)

**How it works:**
- Triggered when you push code to the `main` branch
- Steps:
  - Build the Docker image
  - Push to DockerHub
  - (Simulated) Deploy the app to VM via SSH

> ⚠️ If you don’t have a VM set up, this step will simulate deployment only.

---

### ☁️ 4. Terraform Infrastructure Setup (Optional)

> Provision an EC2 VM on AWS and auto-deploy the container.

```bash
cd terraform
terraform init
terraform apply
```

You’ll need:
- AWS credentials set up on your machine
- A key pair for SSH access

---

### 🛡️ 5. Monitoring Setup (Optional)

To enable CPU usage alerting every 5 minutes:

1. Open the crontab editor:
```bash
crontab -e
```

2. Add this line:
```
*/5 * * * * /full/path/to/monitoring/cpu_alert.sh
```

---

## ✅ Done!

You now have a complete CI/CD + IaC + Monitoring stack set up and ready to demonstrate!
