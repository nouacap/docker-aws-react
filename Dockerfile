# Lancement de la premiere phase => phase de build
FROM node:alpine as builder

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY ./ ./

CMD ["npm", "run", "build"]

# Lancement de la deuxième phase => phase du run
FROM nginx
EXPOSE 80

# Je copie le résultat du build de la premiere phase
COPY --from=builder /app/build /usr/share/nginx/html