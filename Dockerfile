FROM nginx:1.15.8-alpine
LABEL version="1.0.0"
ENV REFRESHED_AT=2019-12-02-1
COPY draft_logo.png /usr/share/nginx/html/draft_logo.png