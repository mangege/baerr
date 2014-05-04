#!/usr/bin/env bash
SHDIR=`pwd`
BASEDIR=/tmp/build_ruby_runtime
rm -rf $BASEDIR
mkdir $BASEDIR
cd $BASEDIR

# clear
rm -rf /home/bae/runtime
mkdir /home/bae/runtime

# install ruby
wget http://ruby.taobao.org/mirrors/ruby/2.1/ruby-2.1.1.tar.gz -O ruby.tar.gz
tar xf ruby.tar.gz
cd $(find . -maxdepth 1 -name 'ruby*' -type d )
./configure --prefix=/home/bae/runtime/ruby && make && make install
cd $BASEDIR
# install bundler
/home/bae/runtime/ruby/bin/gem sources --remove https://rubygems.org/
/home/bae/runtime/ruby/bin/gem sources -a https://ruby.taobao.org/
/home/bae/runtime/ruby/bin/gem install bundler --no-rdoc --no-ri

# install nginx
wget http://nginx.org/download/nginx-1.6.0.tar.gz -O nginx.tar.gz
tar xf nginx.tar.gz
cd $(find . -maxdepth 1 -name 'nginx*' -type d )
./configure --prefix=/home/bae/runtime/nginx && make && make install
# copy nginx conf
cp $SHDIR/files/nginx.conf /home/bae/runtime/nginx/conf/
cd $BASEDIR

# install nodejs
wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz -O node.tar.gz
tar xf node.tar.gz
cp -R $(find . -maxdepth 1 -name 'node*' -type d) /home/bae/runtime/
mv  $(find /home/bae/runtime -maxdepth 1 -name 'node*' -type d) /home/bae/runtime/node

# install mysql dev
apt-get download libmysqlclient-dev
dpkg-deb -x libmysqlclient-dev* libmysqlclient-dev
mv libmysqlclient-dev/usr/lib/x86_64-linux-gnu/libmysqlclient* libmysqlclient-dev/usr/lib/
rm -rf libmysqlclient-dev/usr/lib/x86_64-linux-gnu/
cp -R libmysqlclient-dev /home/bae/runtime/

# pack
tar cfz baerr-v1.tar.gz -C /home/bae/runtime libmysqlclient-dev nginx ruby node
