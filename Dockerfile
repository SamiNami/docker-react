FROM node:apline as builder
WORKDIR "/app"

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx
# copy from the builder stage the app/build folder over to the nginx default folder
COPY --from=builder /app/build /usr/share/nginx/html
