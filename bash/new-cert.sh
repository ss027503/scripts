## run this to generate a new certificate signing request. prompts for the fqdn hostname

echo hostname for certificate? (fqdn)
read HOSTNAME
openssl genrsa -out $HOSTNAME.key 4096
cp $HOSTNAME.key $HOSTNAME.key.org
openssl rsa -in $HOSTNAME.key.org -out $HOSTNAME.key
openssl req -new -sha256 -key $HOSTNAME.key -out $HOSTNAME.csr