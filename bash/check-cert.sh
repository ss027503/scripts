## checks the certificate information of a remote site
echo "what url do you want to cert check? example; msn.com"
read SERVER_URL

echo | openssl s_client -showcerts -servername $SERVER_URL -connect $SERVER_URL:443 2>/dev/null | openssl x509 -inform pem -noout -text