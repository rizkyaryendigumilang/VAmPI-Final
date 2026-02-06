# 🛡️ VAmPI: Automated API Security Scanning & Hardened Nginx WAF
### The Vulnerable API with Full-Spectrum Security Automation & Runtime Protection

[![Security Scan](https://img.shields.io/badge/Security-Automated-brightgreen)](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning)
[![WAF](https://img.shields.io/badge/WAF-Nginx%20Hardened-blue)](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning)

## 📌 Project Overview
**VAmPI** adalah Flask-based vulnerable API yang dirancang untuk mensimulasikan OWASP Top 10 API Security Risks. Proyek ini di-hardened dengan strategi **Defense-in-Depth** yang menggabungkan audit kode otomatis dan proteksi aktif di level network.

## 🚀 The Multi-Layer Security Stack

### 🔹 Layer 1: Automated Security Pipeline (Shift-Left)
Orkestrasi via `scan_otomatis.sh` menjalankan audit menyeluruh:
* **Hadolint (IaC):** Memastikan Dockerfile bebas dari miskonfigurasi keamanan.
* **Trivy (SCA):** Memindai library pihak ketiga (`requirements.txt`) dari CVE kritis.
* **Semgrep (SAST):** Analisis logika kode secara statis untuk mendeteksi SQLi & Insecure Functions.
* **OWASP ZAP (DAST):** Automated Pentesting pada API yang sedang berjalan untuk mencari celah runtime.

### 🔹 Layer 2: Hardened Nginx WAF (Runtime Protection)
Implementasi Reverse Proxy yang dikonfigurasi khusus untuk memblokir serangan:
* **Virtual Patching:** Memblokir karakter berbahaya (`' OR 1=1`, `%27`, dll) sebelum mencapai Flask.
* **Security Headers:** Injeksi otomatis CSP, HSTS, X-Frame-Options, dan X-Content-Type-Options.
* **Information Masking:** Menyembunyikan identitas server untuk mencegah reconnaissance.

---

## 📂 Security Audit Structure
Seluruh temuan keamanan dikumpulkan secara otomatis ke dalam folder audit:

| File Laporan | Fokus Keamanan |
| :--- | :--- |
| `1_hadolint_audit.txt` | **Infrastruktur:** Dockerfile Hardening |
| `2_trivy_audit.txt` | **Supply Chain:** Vulnerable Dependencies |
| `3_semgrep_audit.txt` | **Code Logic:** SQLi, XSS, & Secrets |
| `4_zap_audit.txt` | **Dynamic:** Runtime API Attacks |
| `5_waf_alert.txt` | **Incident:** Real-time Blocked Attack Logs |

---

## 🛠️ Installation & Usage

### 1. Clone & Setup
```bash
git clone [https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning.git](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning.git)
cd VAmPI-automated-api-security-scanning# 🛡️ VAmPI: Automated API Security Scanning & Hardened Nginx WAF
### The Vulnerable API with Full-Spectrum Security Automation & Runtime Protection

[![Security Scan](https://img.shields.io/badge/Security-Automated-brightgreen)](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning)
[![WAF](https://img.shields.io/badge/WAF-Nginx%20Hardened-blue)](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning)

## 📌 Project Overview
**VAmPI** adalah Flask-based vulnerable API yang dirancang untuk mensimulasikan OWASP Top 10 API Security Risks. Proyek ini di-hardened dengan strategi **Defense-in-Depth** yang menggabungkan audit kode otomatis dan proteksi aktif di level network.

## 🚀 The Multi-Layer Security Stack

### 🔹 Layer 1: Automated Security Pipeline (Shift-Left)
Orkestrasi via `scan_otomatis.sh` menjalankan audit menyeluruh:
* **Hadolint (IaC):** Memastikan Dockerfile bebas dari miskonfigurasi keamanan.
* **Trivy (SCA):** Memindai library pihak ketiga (`requirements.txt`) dari CVE kritis.
* **Semgrep (SAST):** Analisis logika kode secara statis untuk mendeteksi SQLi & Insecure Functions.
* **OWASP ZAP (DAST):** Automated Pentesting pada API yang sedang berjalan untuk mencari celah runtime.

### 🔹 Layer 2: Hardened Nginx WAF (Runtime Protection)
Implementasi Reverse Proxy yang dikonfigurasi khusus untuk memblokir serangan:
* **Virtual Patching:** Memblokir karakter berbahaya (`' OR 1=1`, `%27`, dll) sebelum mencapai Flask.
* **Security Headers:** Injeksi otomatis CSP, HSTS, X-Frame-Options, dan X-Content-Type-Options.
* **Information Masking:** Menyembunyikan identitas server untuk mencegah reconnaissance.

---

## 📂 Security Audit Structure
Seluruh temuan keamanan dikumpulkan secara otomatis ke dalam folder audit:

| File Laporan | Fokus Keamanan |
| :--- | :--- |
| `1_hadolint_audit.txt` | **Infrastruktur:** Dockerfile Hardening |
| `2_trivy_audit.txt` | **Supply Chain:** Vulnerable Dependencies |
| `3_semgrep_audit.txt` | **Code Logic:** SQLi, XSS, & Secrets |
| `4_zap_audit.txt` | **Dynamic:** Runtime API Attacks |
| `5_waf_alert.txt` | **Incident:** Real-time Blocked Attack Logs |

---

## 🛠️ Installation & Usage

### 1. Clone & Setup
```bash
git clone [https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning.git](https://github.com/rizkyaryendigumilang/VAmPI-automated-api-security-scanning.git)
cd VAmPI-automated-api-security-scanning
2. Jalankan Infrastruktur (VAmPI + Nginx WAF)
Bash
docker-compose up -d --build
3. Eksekusi Automated Security Scan
Bash
chmod +x scan_otomatis.sh
./scan_otomatis.sh
🔍 Proof of Concept (Incident Response)
Sistem ini tidak hanya memblokir, tapi juga memberikan peringatan (Alerting).

Percobaan Serangan:

Bash
curl -I "http://localhost/users/v1/_all?id=%27"
Output di alert_email_siap_kirim.txt:

Plaintext
=== WAF SECURITY ALERT ===
Detail Serangan Terakhir:
🕒 Jam: [06/Feb/2026:13:21:35] | 🌐 IP: 172.18.0.1 | 🚨 Serangan: /users/v1/_all?id=%27
👨‍💻 DevSecOps Vision
Proyek ini membuktikan bahwa keamanan adalah sebuah enabler. Dengan menggabungkan Automated Scanning dan Infrastructure Hardening, kita membangun aplikasi yang tidak hanya aman saat dideploy, tapi juga tangguh saat menghadapi serangan nyata.

Created by Rizky Aryendi Gumilang
2. Jalankan Infrastruktur (VAmPI + Nginx WAF)
Bash
docker-compose up -d --build
3. Eksekusi Automated Security Scan
Bash
chmod +x scan_otomatis.sh
./scan_otomatis.sh
🔍 Proof of Concept (Incident Response)
Sistem ini tidak hanya memblokir, tapi juga memberikan peringatan (Alerting).

Percobaan Serangan:

Bash
curl -I "http://localhost/users/v1/_all?id=%27"
Output di alert_email_siap_kirim.txt:

Plaintext
=== WAF SECURITY ALERT ===
Detail Serangan Terakhir:
🕒 Jam: [06/Feb/2026:13:21:35] | 🌐 IP: 172.18.0.1 | 🚨 Serangan: /users/v1/_all?id=%27
👨‍💻 DevSecOps Vision
Proyek ini membuktikan bahwa keamanan adalah sebuah enabler. Dengan menggabungkan Automated Scanning dan Infrastructure Hardening, kita membangun aplikasi yang tidak hanya aman saat dideploy, tapi juga tangguh saat menghadapi serangan nyata.

Created by Rizky Aryendi Gumilang
