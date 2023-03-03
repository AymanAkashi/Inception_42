FROM alpine:3.16.4 AS clone
RUN apk add git
RUN git config --global advice.detachedHead false
RUN git clone https://github.com/Aveek-Saha/Online-Chess.git /app
WORKDIR /app
RUN git checkout 12f39e091aeb54432937eae46c8c03f80e8fcfb2
RUN rm -rf .git


FROM alpine:3.16.4
RUN apk add nodejs npm
COPY --from=clone /app /app
WORKDIR /app
RUN npm install
EXPOSE 8080
CMD ["node", "index.js"]