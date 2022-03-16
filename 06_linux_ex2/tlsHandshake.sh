sudo apt install -y aiohttp-wsgi-serve
curl -X POST -H 'Content-Type: application/json' -d '{"clientVersion": "3.2","message": "Client Hello"}' http://devops-jan22-1273001359.eu-north-1.elb.amazonaws.com:8080/clienthello -o response.json
sudo apt install -y jq
SESSION_ID=$(jq -r '.sessionID' response.json)
jq -r '.serverCert' response.json >cert.pem
wget https://devops-jan22.s3.eu-north-1.amazonaws.com/cert-ca-aws.pem --no-check-certificate
openssl verify -CAfile cert-ca-aws.pem cert.pem
