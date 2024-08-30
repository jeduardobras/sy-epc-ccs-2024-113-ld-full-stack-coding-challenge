FROM node:20.16-alpine

WORKDIR /opt/app

RUN addgroup -S app && adduser -S -G app app

COPY --chown=app:app package.json package-lock.json ./

RUN npm install && chown -R app:app node_modules

COPY --chown=app:app vite.config.js index.html ./
COPY --chown=app:app public public
COPY --chown=app:app src src

RUN chown -R app:app /opt/app && chmod -R 755 /opt/app

USER app

CMD ["npm", "run", "dev"]

EXPOSE 3000
