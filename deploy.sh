docker build -t yoshi245/multi-client:latest -t yoshi245/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t yoshi245/multi-server:latest -t yoshi245/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t yoshi245/multi-worker:latest -t yoshi245/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push yoshi245/multi-client:latest
docker push yoshi245/multi-client:$SHA
docker push yoshi245/multi-server:latest
docker push yoshi245/multi-server:$SHA
docker push yoshi245/multi-worker:latest
docker push yoshi245/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployment/server-deployment server=yoshi245/multi-server:$SHA
kubectl set image deployment/client-deployment client=yoshi245/multi-client:$SHA
kubectl set image deployment/worker-deployment worker=yoshi245/multi-worker:$SHA
