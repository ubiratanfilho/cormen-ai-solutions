# Node versão 14
FROM node:18

WORKDIR /mss-noticias

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3001

CMD ["node","index.js"]