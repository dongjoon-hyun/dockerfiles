FROM java:7
MAINTAINER Dongjoon Hyun <dongjoon@apache.org>

RUN apt-get update && apt-get install -y ruby-full build-essential vim
RUN gem install jekyll jekyll-redirect-from pygments.rb
RUN curl https://bootstrap.pypa.io/ez_setup.py | python2.7 && easy_install-2.7 pip
RUN pip2.7 install Pygments sphinx
WORKDIR /spark
