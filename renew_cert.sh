#!/bin/sh
python /root/acme-tiny/acme_tiny.py --account-key /root/acme-tiny/account.key --csr /root/acme-tiny/domain.csr --acme-dir /var/www/acme-tiny-challenges/ > /tmp/signed.crt || exit
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat /tmp/signed.crt intermediate.pem > /root/acme-tiny/chained.pem
cat /tmp/signed.crt  >  /root/acme-tiny/signed.crt
