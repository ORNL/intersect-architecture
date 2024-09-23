ARG REPO=code.ornl.gov:4567/rse/images/
ARG NGINX_IMAGE=code.ornl.gov:4567/rse/images/

# use this stage for development
FROM ${REPO}python:3.11-slim as docs


RUN apt-get update \
 && apt-get install --no-install-recommends --yes \
      graphviz \
      imagemagick \
      make \
      plantuml \
 && apt-get autoremove \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

RUN make html

#-----#
# Nginx to serve HTML
FROM ${NGINX_IMAGE}nginx:1.22-alpine as server
COPY --from=docs /app/_build/ /usr/share/nginx/html

