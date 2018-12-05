#!/bin/bash

docker build -t k9ert/bdance-app:latest .

docker push k9ert/bdance-app

kubectl apply -f deployment.yml

pod=$(kubectl get pods | tail -2 | head -1 | cut -d" " -f1)
kubectl delete pod $pod
kubectl rollout status deployment/bdanceappdeployment -w
sleep 2

# create some boxes
curl 'http://35.189.211.162:8081/box' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://35.189.211.162:8081/box' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'boxOwner=monika.januzsek%40sap.com&address=Woloska+5%2C+02-675+Warszawa%2C+Poland'
curl 'http://35.189.211.162:8081/box' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://35.189.211.162:8081/box' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'boxOwner=ken.lomax%40sap.com&address=Nymphenburgerstr+32%2C+80798%2C+Munich'
curl 'http://35.189.211.162:8081/box' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://35.189.211.162:8081/box' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'boxOwner=philippe.sauve%40sap.com&address=999+de+Maisonneuve+Boulevard+West%2C+Montreal%2C+Canada'
curl 'http://35.189.211.162:8081/box' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://35.189.211.162:8081/box' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'boxOwner=bruce.snyder%40sap.com&address=3005+Center+Green+Drive%2C+Boulder%2CUSA'

# create some regive-fake data
curl 'http://35.189.211.162:8081/regive' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://35.189.211.162:8081/regive?email=piotr.kopchyinski@sap.com&orderNumber=00001011&productDescription=Nothing' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'email=piotr.kopchyinski%40sap.com&ordernumber=00001011&donatedObject=GoPro3&replacedby=Nothing&price=%24123.11&box=Woloska+5%2C+02-675+Warszawa%2C+Poland'
curl 'http://35.189.211.162:8081/regive' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:63.0) Gecko/20100101 Firefox/63.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: http://35.189.211.162:8081/regive?email=marco.rutten@sap.com&orderNumber=00001011&productDescription=Samsung%20S1' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'email=marco.rutten%40sap.com&ordernumber=00001011&donatedObject=Samsung+S2&replacedby=Samsung+S1&price=%24123.11&box=Nymphenburgerstr+32%2C+80798%2C+Munich'
