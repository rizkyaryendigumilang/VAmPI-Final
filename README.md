# 🛡️ VAmPI: Ultimate DevSecOps & Automated Pentesting
**The Vulnerable API (Based on OpenAPI 3) with Multi-Layered Security Scanning**

![Security Scanning](https://github.com/rizkyaryendigumilang/VAmPI-Final/actions/workflows/devsecops.yml/badge.svg)
![Build Status](https://img.shields.io/badge/Build-Success-brightgreen)
![DevSecOps](https://img.shields.io/badge/Security-Full_Automation-blue)

## 📌 Project Overview
**VAmPI** is a Flask-based vulnerable API containing the OWASP Top 10 API Security Risks. 

This project goes beyond just running a vulnerable app; it implements a **Full-Spectrum DevSecOps Pipeline**. Every code change triggers an automated "Security Guard" that performs a 360-degree audit—from infrastructure and libraries to source code and runtime behavior.

---

## 🚀 The Multi-Layer Security Stack

This pipeline integrates four essential security pillars:

### 1. **Infrastructure as Code (IaC) Scanning**
* **Tool:** **Hadolint**
* **Function:** Scanning the `Dockerfile` for misconfigurations.
* **Outcome:** Prevents insecure root access and ensures container best practices.

### 2. **Software Composition Analysis (SCA)**
* **Tool:** **Trivy**
* **Function:** Scans third-party libraries (`requirements.txt`) for known CVEs.
* **Outcome:** Detects vulnerable dependencies before they reach production.

### 3. **Static Application Security Testing (SAST)**
* **Tool:** **Semgrep**
* **Function:** Analyzes the Python/Flask source code for logic flaws and insecure patterns.
* **Outcome:** Identifies SQL Injection, hardcoded secrets, and weak JWT configurations at the code level.

### 4. **Dynamic Application Security Testing (DAST)**
* **Tool:** **OWASP ZAP (Zaproxy)**
* **Function:** Performs automated penetration testing on the running API.
* **Outcome:** Simulates real-world attacks to find runtime vulnerabilities like *Security Misconfigurations* and *Insufficient Site Isolation (Spectre)*.

---

## 🛠️ Automated Workflow (CI/CD)
The system is orchestrated via **GitHub Actions** with the following flow:
1. **Static Phase:** Runs `scan_otomatis.sh` which executes **Hadolint, Trivy, and Semgrep**.
2. **Build Phase:** Builds the Docker image and deploys the VAmPI container in an isolated environment.
3. **Dynamic Phase:** **OWASP ZAP** performs an automated pentest against the live endpoint.
4. **Instant Reporting:** A comprehensive Scanning report is sent directly to the developer's email.

---

## 📂 Scanning Reports Structure
Each pipeline run generates five detailed security reports:
* `hasil_scan_lengkap.txt`: Full terminal scanning trail.
* `hadolint-report.txt`: Infrastructure compliance details.
* `trivy-report.txt`: Dependency vulnerability list (SCA).
* `semgrep-report.txt`: Source code security findings (SAST).
* `zap-log.txt`: Dynamic penetration testing results (DAST).

---

## 👨‍💻 Project Mission
To prove that security is not a blocker, but an enabler. By shifting security to the left (**Shift-Left Security**), we can build applications that are resilient by design and secure by default.

---
*Created for Learning/Teaching and Evaluating Security Automation Tools.*
