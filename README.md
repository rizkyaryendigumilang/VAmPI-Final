# 🛡️ VAmPI: Automated API Security Scanning & Hardened Nginx WAF
### The Vulnerable API with Full-Spectrum Security Automation & Runtime Protection

[![Security Scan](https://img.shields.io/badge/Security-Automated-brightgreen)](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning)
[![WAF](https://img.shields.io/badge/WAF-Nginx%20Hardened-blue)](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning)

## 📌 Project Overview
**VAmPI** adalah Flask-based vulnerable API yang dirancang untuk mensimulasikan OWASP Top 10 API Security Risks. Proyek ini di-hardened dengan strategi **Defense-in-Depth** yang menggabungkan Scaning kode otomatis dan proteksi aktif di level network menggunakan Nginx WAF.

---

## 🚀 The Multi-Layer Security Stack

### 🔹 Layer 1: Automated Security Pipeline (Shift-Left)
Orkestrasi via `scan_otomatis.sh` menjalankan Scaning menyeluruh:
* **Hadolint (IaC):** Scaning keamanan Dockerfile untuk memastikan best-practice containerization.
* **Trivy (SCA):** Memindai library pihak ketiga (`requirements.txt`) dari CVE kritis.
* **Semgrep (SAST):** Analisis code secara statis untuk mendeteksi SQLi & Insecure Functions.
* **OWASP ZAP (DAST):** Automated Pentesting pada API yang sedang berjalan.

### 🔹 Layer 2: Hardened Nginx WAF (Runtime Protection)
Menambahkan perisai aktif untuk memitigasi serangan:
* **Virtual Patching:** Memblokir karakter berbahaya (`' OR 1=1`, `%27`, dll) di level network.
* **Security Headers:** Injeksi otomatis CSP, HSTS, X-Frame-Options, dan X-Content-Type-Options.
* **Information Masking:** Menyembunyikan identitas server asli untuk mempersulit reconnaissance.

---

## 📂 Security Scaning Structure
Seluruh temuan keamanan dikumpulkan secara otomatis ke dalam folder Scaning:

| File Laporan | Fokus Keamanan |
| :--- | :--- |
| `1_hadolint_Scaning.txt` | **Infrastruktur:** Dockerfile Hardening |
| `2_trivy_Scaning.txt` | **Supply Chain:** Vulnerable Dependencies |
| `3_semgrep_Scaning.txt` | **Code Logic:** SQLi, XSS, & Secrets |
| `4_zap_Scaning.txt` | **Dynamic:** Runtime API Attacks |
| `5_waf_alert.txt` | **Incident:** Real-time Blocked Attack Logs |

---
