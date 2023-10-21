# Como iniciar o deployment

## 1. Inicie os contêineres e publique as imagens no Docker Hub
```
cd mss-login
docker build -t ubiratanmotta/mss-login .
docker push ubiratanmotta/mss-login

cd ..
cd mss-noticias
docker build -t ubiratanmotta/mss-noticias .
docker push ubiratanmotta/mss-noticias

cd ..
cd postgres
docker build -t ubiratanmotta/postgres .
docker push ubiratanmotta/postgres
```

## 2. Inicie o deployment no Kubernetes
```
cd ..
cd kubernetes
kubectl apply -f mss-login-deployment.yaml
kubectl apply -f mss-noticias-deployment.yaml
kubectl apply -f postgres-deployment.yaml
```

## 3. Inicie o serviço no Kubernetes
```
kubectl apply -f mss-login-service.yaml
kubectl apply -f mss-noticias-service.yaml
kubectl apply -f postgres-service.yaml
```

## 4. Verifique se os pods estão rodando
```
kubectl get pods
```
