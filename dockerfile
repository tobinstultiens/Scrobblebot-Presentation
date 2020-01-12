# base image
FROM node:12.2.0-alpine as build

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
COPY tsconfig.json /app/tsconfig.json
COPY ./ /app/

RUN npm install
RUN npm run build

# production environment
FROM nginx:1.16.1-alpine
# RUN rm /etc/nginx/conf.d/default.conf
# COPY ./src/Neuralm.Presentation.Web/nginx/nginx.conf /etc/nginx/conf.d
COPY ./nginx/nginx.conf /temp/prod.conf
RUN envsubst /app < /temp/prod.conf > /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]