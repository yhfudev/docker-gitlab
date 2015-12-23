#!/usr/bin/env bash

sed -e "s|yhfudev/docker-lamp|yhfu/lamp-$(uname -m)|g" \
    -i Dockerfile
docker build -t yhfu/gitlab-$(uname -m) .

# example:
#
# DN_TLS=/srv/https
# FN_CERT=server
# cd ${DN_TLS}
# Create a RSA private key for your Apache server
# openssl genrsa 2048 > ${DN_TLS}/${FN_CERT}.key
# Create a Certificate Signing Request (CSR)
# openssl req -new \
#     -key ${DN_TLS}/${FN_CERT}.key \
#     -out ${DN_TLS}/${FN_CERT}.csr
# Create a self-signed CA Certificate (X509 structure) with the RSA key of the CA
# openssl req -x509 -days 3650 \
#     -key ${DN_TLS}/${FN_CERT}.key \
#     -in  ${DN_TLS}/${FN_CERT}.csr \
#     -out ${DN_TLS}/${FN_CERT}.crt
# docker run \
#     -v /srv/https:/https \
#     --name gitlab -p 10080:80 -p 10443:443 -d yhfu/gitlab-$(uname -m)
