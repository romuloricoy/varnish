#!/bin/bash

apt-get -y update
apt-get install -y debian-archive-keyring
apt-get install -y curl gnupg apt-transport-https vim
apt-get -y update
curl -L https://packagecloud.io/varnishcache/varnish41/gpgkey | apt-key add -
echo "deb https://packagecloud.io/varnishcache/varnish41/ubuntu/ xenial main"
echo "deb-src https://packagecloud.io/varnishcache/varnish41/ubuntu/ xenial main"
apt-get -y update
apt-get install -y varnish

tee /etc/varnish/default.vcl <<EOF
vcl 4.0;

backend default {
    .host = "127.0.0.1";
    .port = "8080";
}
EOF

touch /etc/varnish/secret
