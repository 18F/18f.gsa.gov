FROM node:18

WORKDIR /src

COPY package.json .
COPY package-lock.json .

RUN npm rebuild
RUN npm ci

CMD npm run dev
