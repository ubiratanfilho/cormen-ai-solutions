# CormenAI Solutions

Repositório do projeto das disciplinas de Linguagem de Programação II e Arquitetura de Sistemas Computacionais, onde foi desenvolvido um website para uma hipotética empresa de consultoria de Inteligência Artificial, a CormenAI Solutions.

### Release 9 - dia 19/11/2023

Microsserviço de noticias implementado com front-end.

### Integrantes

- Ubiratan da Motta Filho R.A 20.00928-3

- Joao Paulo M Socio 20.00704-3

- Luan Teixeira R.A: 20.01681-6

- Bruno Davidovitch Bertanha 20.01521-6



### Como iniciar o deployment

#### 1. Inicie os contêineres e publique as imagens no Docker Hub
```
cd mss-login
docker build -t ubiratanmotta/mss-login . & docker push ubiratanmotta/mss-login

cd ..
cd mss-noticias
docker build -t ubiratanmotta/mss-noticias . & docker push ubiratanmotta/mss-noticias
```

#### 2. Inicie o deployment no Kubernetes
```
cd ..
cd kubernetes
kubectl apply -f mss-login-deployment.yaml & kubectl apply -f mss-noticias-deployment.yaml
```

#### 3. Inicie o serviço no Kubernetes
```
kubectl apply -f mss-login-service.yaml & kubectl apply -f mss-noticias-service.yaml
```

#### 4. Verifique se os pods estão rodando
```
kubectl get pods
```

### Como rodar aplicativo Flutter

#### 1. Mudar para diretório raiz do flutter

```
cd flutter/app_flutter_cormenai
```
#### 2. Rodar o aplicativo

```
flutter run
```

### Vídeo
#### T1 - Aplicação com React
https://youtu.be/CroODD9yE-w

#### T2 - Aplicação com Flutter
https://youtu.be/_7dojNoRV5I