#Stage 1: build and prepare the container environment
FROM node:12.21.0-alpine As builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
#RUN npm run build --prod
EXPOSE 4200
CMD npm run start
LABEL  Created by Salim Khan


#Stage 2: run the container in nginx web server.
#FROM nginx:1.19.7-alpine
#COPY --from=builder /usr/src/app/dist/angular-app/ /usr/share/nginx/html
