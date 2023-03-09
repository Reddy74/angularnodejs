FROM node:16 as build
WORKDIR /app

RUN npm install -g @angular/cli

COPY ./package.json .
RUN npm install
COPY . .
#RUN ng build
FROM nginx:latest
FROM nginx as runtime
COPY --from=build /app/dist/MyAngularApp /usr/share/nginx/html
