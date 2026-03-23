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
![Live React App](live.jpg)

### Railway Deployment – Active & Online
![Railway Active Deployment](dashboard.jpg)

### GitHub Actions – Successful Run (with Trivy)
![GitHub Actions Success with Trivy](scans.jpg)

### Trivy Scan Results (latest run)
![Trivy Scan Output]   Library    ,CVE ID           ,Severity   ,Installed Version   ,Fixed Version   ,Vulnerability Summary
                       libexpat   ,CVE-2026-32767   ,CRITICAL   ,2.7.4-r0            ,2.7.5-r0        ,Authorization Bypass 
                       libexpat   ,CVE-2026-32777   ,MEDIUM     ,-                   ,-               ,DoS via infinite loop in DTD parsing
                       libexpat   ,CVE-2026-32778   ,MEDIUM     ,-                   ,-               ,DoS via NULL pointer after OOM
                       zlib       ,CVE-2026-22184   ,HIGH       ,1.3.1-r2            ,1.3.2-r0        ,Arbitrary code execution via buffer overflow
                       zlib       ,CVE-2026-27171   ,MEDIUM     ,-                   ,-               ,DoS via infinite loop in CRC32

## Architecture Overview
GitHub Push → GitHub Actions
↓
Build Docker Image
↓
Trivy Vulnerability Scan
↓
Push Image to GHCR
↓
Railway pulls latest image
↓
Public URL generated
↓
Live React App
