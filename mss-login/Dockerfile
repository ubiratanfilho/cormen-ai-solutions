# Node versão 14
FROM node:18

WORKDIR /mss-login

COPY package.json .

COPY ca.pem .

RUN npm install

COPY . .

EXPOSE 3002

CMD ["node","index.js"]