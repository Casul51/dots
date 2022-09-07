## \### Generate SSL for nginx

openssl genrsa -out www.root.hard.key 2048
openssl req -new -sha256 -key www.root.hard.key -out www.root.hard.csr

### \### copy www.root.hard.csr to CA

## \### CA signing

#WINDOWS sign

certreq -submit -attrib "CertificateTemplate:WebServer" -config root.hard\\CA1_name www.root.hard.csr www.root.hard.cer

## \### copy back .cer

### restart nginx with certificates

\## Linux CA

```
#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Usage: Must supply a domain"
  exit 1
fi

DOMAIN=$1 
mkdir ~/certs
cd ~/certs

openssl genrsa -out $DOMAIN.key 2048
openssl req -new -key $DOMAIN.key -out $DOMAIN.csr

cat > $DOMAIN.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
EOF

openssl x509 -req -in $DOMAIN.csr -CA ../myCA.pem -CAkey ../myCA.key -CAcreateserial \
-out $DOMAIN.crt -days 825 -sha256 -extfile $DOMAIN.ext
```

# \#### NGINX ready

## \### Copy CA cert to hosts

### #WINDOWS gen

cd Downloads
certutil -ca.cert ca_name.cer

## \# Copy to linux entire file!

apt install smbclient
smbget smb://win-q866j0e5vlb.root.hard/Downloads/ca_name.cer

## \## REGISTER CA

### #Linux

sudo apt-get install -y ca-certificates
openssl x509 -inform DER -in ca\_name.cer -out ca\_name.crt
cp ca_name.crt /usr/local/share/ca-certificates
update-ca-certificates

\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-

### Generate SSL for nginx

openssl genrsa -out www.root.hard.key 2048
openssl req -new -sha256 -key www.root.hard.key -out www.root.hard.csr

### copy www.root.hard.csr to CA

### CA signing

#WINDOWS sign
certreq -submit -attrib "CertificateTemplate:WebServer" -config DOMAINCA\\CA1_name www.root.hard.csr www.root.hard.cer

### copy back .cer

#### NGINX ready

### Copy CA cert to hosts

#WINDOWS gen
cd Downloads
certutil -ca.cert ca_name.cer

# Copy to linux entire file!

apt install smbclient
smbget smb://win-q866j0e5vlb.root.hard/Downloads/ca_name.cer

## REGISTER CA

#Linux
sudo apt-get install -y ca-certificates
openssl x509 -inform DER -in ca\_name.cer -out ca\_name.crt
cp ca_name.crt /usr/local/share/ca-certificates
update-ca-certificates
#NOTE: firefox retarded in that way