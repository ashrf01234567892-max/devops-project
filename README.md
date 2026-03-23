# DevOps React Portfolio App

A simple React application containerized with Docker (multi-stage build), equipped with automated CI/CD using GitHub Actions, security scanning via Trivy, and deployed live on Railway.

## Live Demo (Running Now)
🚀 **Direct link to the live application:**  
https://devops-app-production-28a9.up.railway.app/

## Project Highlights
- **Frontend**: React (Create React App)
- **Containerization**: Multi-stage Docker build  
  → Build stage: Node 22 slim  
  → Production stage: Nginx stable-alpine
- **Web Server**: Nginx with custom configuration to support React Router (SPA routing via `try_files`)
- **CI/CD**: GitHub Actions  
  → Builds Docker image on every push to `main`  
  → Scans image with Trivy (vulnerability scanner)  
  → Pushes image to GitHub Container Registry (GHCR)
- **Deployment**: Railway.app (free tier) – automatic public domain
- **Security**: Trivy integrated into the pipeline (scan results visible in logs)

## Screenshots

### Live Application
![Live React App](screenshots/live-app.png)

### Railway Deployment – Active & Online
![Railway Active Deployment](screenshots/railway-active.png)

### GitHub Actions – Successful Run (with Trivy)
![GitHub Actions Success with Trivy](screenshots/github-actions-trivy.png)

### Trivy Scan Results (latest run)
![Trivy Scan Output](screenshots/trivy-scan.png)

## Architecture Overview
