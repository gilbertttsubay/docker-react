FROM node:16-alpine as builder

workdir '/astrapay/apps'

copy package.json .
run npm install

copy . .

run npm run build

from nginx
copy --from=builder /astrapay/apps/build /usr/share/nginx/html


