## checks the certificate information of a remote site
echo "what url do you want to cert check? example; msn.com"
read -p "URL: " SERVER_URL

read -p "what port to use for https? [443]: " PORT
port=${PORT:=443}
echo | openssl s_client -showcerts -servername $SERVER_URL -connect $SERVER_URL:$PORT 2>/dev/null | openssl x509 -inform pem -noout -text