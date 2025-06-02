# 빌드 스테이지
FROM node:22-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# 실행 스테이지
FROM node:22-alpine

WORKDIR /app

COPY --from=build /app/.next ./.next
COPY package*.json ./
RUN npm install --omit=dev
COPY public ./public

EXPOSE 3000

CMD ["npm", "start"]