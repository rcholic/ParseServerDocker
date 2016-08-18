FROM node:latest

RUN mkdir parse

ADD . /parse
WORKDIR /parse
RUN npm install
RUN npm install -g forever pm2

ENV APP_ID myAppId
ENV MASTER_KEY masterKey
ENV DATABASE_URI mongodb://test:Welcome01@ds153705.mlab.com:53705/iparroting

# Optional (default : 'parse/cloud/main.js')
# ENV CLOUD_CODE_MAIN cloudCodePath

# Optional (default : '/parse')
# ENV PARSE_MOUNT mountPath

EXPOSE 1337

# Uncomment if you want to access cloud code outside of your container
# A main.js file must be present, if not Parse will not start

# VOLUME /parse/cloud               

CMD [ "npm", "start" ]
