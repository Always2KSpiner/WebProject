From node

ADD School-web-application-master /project
WORKDIR /project

RUN sudo apt-get install npm
RUN npm install
RUN npm build

EXPOSE 3000

CMD ["node","app.js"]
