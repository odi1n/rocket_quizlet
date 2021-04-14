# docker build -t rocket_quizlet /root/rocket_quizlet/
FROM ruby:2.5.1-stretch

RUN apt-get update -qq >/dev/null

RUN apt-get install -y -qq postgresql postgresql-contrib libpq-dev cmake libpq5 >/dev/null
RUN apt-get install -y -qq locales apt-utils apt-transport-https  >/dev/null
RUN apt-get install -y -qq qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x >/dev/null
RUN apt-get install -y -qq xvfb > /dev/null


RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq >/dev/null
RUN apt-get install -y -qq yarn >/dev/null

RUN echo "en_US UTF-8" > /etc/locale.gen
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
RUN /bin/bash -c "source /root/.bashrc && nvm install node && nvm use node"

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
