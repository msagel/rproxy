FROM ubuntu:20.04

RUN apt-get update \
    && apt-get install -y nginx nano vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

ADD index.nginx-debian.html /var/www/html/index.nginx-debian.html

COPY proxy/proxy.conf /etc/nginx/proxy/proxy.conf

COPY rproxy.conf /etc/nginx/conf.d/rproxy.conf

EXPOSE 80
CMD ["nginx"]
