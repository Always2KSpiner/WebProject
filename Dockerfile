From node

ADD School-web-application-master /project
WORKDIR /project

RUN npm install
RUN npm build
RUN node app.js

EXPOSE 3000
