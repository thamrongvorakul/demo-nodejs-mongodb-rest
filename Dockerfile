FROM node:10.18.0-alpine as builder 
#Add multi stage to minimize the image size and for the best run time performance

WORKDIR /app
COPY *.js /app/
COPY package*.json /app/
COPY views /app/views/
COPY routes /app/routes/
COPY public /app/public/
COPY bin /app/bin/

RUN npm ci

FROM node:10.18.0-alpine
WORKDIR /app
COPY --from=builder /app/ .

ENTRYPOINT ["npm", "start"]
