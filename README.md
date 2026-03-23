# DevOps React App

React application Dockerized with multi-stage build (Node + Nginx) and deployed automatically via GitHub Actions to GHCR, then hosted live on Railway.

## Live Demo
🚀 التطبيق شغال مباشرة على الإنترنت:  
https://devops-app-production-28a9.up.railway.app/

## CI/CD Pipeline
- GitHub Actions يبني الـ Docker image أوتوماتيك كل push لـ main
- يرفعها على GitHub Container Registry (GHCR)
- يعمل Trivy vulnerability scan (نتايج الفحص في الـ logs)

## Technologies Used
- React
- Docker (multi-stage)
- Nginx (custom config for SPA routing)
- GitHub Actions (CI/CD)
- Trivy (security scanning)
- Railway (deployment & hosting)

## How to run locally
```bash
docker build -t devops-app .
docker run -d -p 8080:80 devops-app
