#!/bin/bash

echo "================================================"
echo "    🛡️  STARTING COMPLETE SECURITY SCAN 🛡️"
echo "================================================"

# 1. HADOLINT (Docker Check) sebagai Infrastructure as Code (IaC) Scanning
echo -e "\n[1/4] Running Hadolint (IaC Scan)..."
docker run --rm -v $(pwd):/root:ro hadolint/hadolint < Dockerfile > hadolint-report.txt 2>&1
echo "✅ Hadolint (IaC) Scan Completed."

# 2. TRIVY (Dependency Check) sebagai Software Supply Chain Security / SCA
echo -e "\n[2/4] Running Trivy (SCA Scan)..."
trivy fs --severity HIGH,CRITICAL . > trivy-report.txt 2>&1
echo "✅ Trivy (SCA) Scan Completed."

# 3. SEMGREP (Source Code Check) sebagai Static Application Security Testing (SAST)
echo -e "\n[3/4] Running Semgrep (SAST Scan)..."
docker run --rm -v $(pwd):/src returntocorp/semgrep semgrep scan --config=auto --text > semgrep-report.txt 2>&1
echo "✅ Semgrep (SAST) Scan Completed."

# 4. ZAP INTEGRATION (History Tracking) sebagai Dynamic Analysis (DAST)
echo -e "\n[4/4] Finalizing Scanning Trail..."
# Menjalankan ZAP Baseline scan dan menyimpan outputnya
docker run --rm -t ghcr.io/zaproxy/zaproxy:stable zap-baseline.py -t http://localhost -g gen.conf > zap-report.txt 2>&1
echo "✅ DAST Integration Verified."

# 5. WAF LOG EXTRACTION (Runtime Protection)
echo -e "\n[+] Extracting WAF Security Alerts..."
docker logs nginx-waf 2>&1 | grep "WAF SECURITY ALERT" > waf-report.txt
echo "✅ WAF Logs Extracted."

echo -e "\n================================================"
echo "    📧 SENDING SEPARATE REPORTS TO EMAIL 📧"
echo "================================================"

# Pesan Body Email
EMAIL_BODY="Report Summary"

# Mengirim Email dengan 5 attachment terpisah
echo "$EMAIL_BODY" | mail -s "DevSecOps Scanning Report: VAmPI [SUCCESS]" \
-A hadolint-report.txt \
-A trivy-report.txt \
-A semgrep-report.txt \
-A zap-report.txt \
-A waf-report.txt \
rizkyaryendigumilang@gmail.com

echo "✅ All reports sent separately to your email."
echo -e "\n================================================"
echo "    🎉 ALL SCANS FINISHED! CHECK YOUR REPORTS 🎉"
echo "================================================"
