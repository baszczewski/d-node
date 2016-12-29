FROM ubuntu:16.10
MAINTAINER Marcin Baszczewski <marcin@baszczewski.pl>

# set locale
RUN locale-gen pl_PL.UTF-8  
ENV LANG pl_PL.UTF-8  
ENV LANGUAGE pl_PL:pl  
ENV LC_ALL pl_PL.UTF-8

# set timezone
RUN echo Europe/Warsaw >/etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

# update system
RUN DEBIAN_FRONTEND=noninteractive apt-get update -yq
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq
RUN DEBIAN_FRONTEND=noninteractive apt-get update -yq

# main packages
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq sudo pwgen curl git vim build-essential ruby ruby-dev pkg-config libmagickwand-dev openjdk-8-jre nodejs npm nodejs-legacy

# ruby gems
RUN gem install sass compass rmagick stringex

# jekyll
RUN gem install jekyll jekyll-assets jekyll-sitemap jekyll-feed jekyll-paginate s3_website

# setup npm packages globally
RUN sudo npm install -g gulp grunt grunt-cli bower forever coffee-script typescript

# exposed variables
ENV HOME /home/user/

# volumes
VOLUME  ["/data"]

# working directory
WORKDIR /data

# expose ports
EXPOSE 4040

# add user to sudo
RUN adduser --disabled-password --home=/home/user --gecos "" user
RUN adduser user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# change user
USER user