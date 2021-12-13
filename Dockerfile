FROM node:16-alpine as x

WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM nginx

COPY --from=x /app/build /usr/share/nginx/html

