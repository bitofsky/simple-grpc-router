FROM node:19.6.1

WORKDIR /app

COPY --from=envoyproxy/envoy:v1.23.0 /usr/local/bin/envoy /usr/local/bin/envoy

COPY package*.json ./

RUN ["npm", "install", "--only=production"]

COPY bin/run.sh .

RUN ["chmod", "+x", "/app/run.sh"]

COPY src ./src

CMD ["/app/run.sh"]
