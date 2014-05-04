BAE Ruby Runtime
===

简介
---
构建BAE 3.0的Ruby环境,方便快速部署Rails,Sinatra等Ruby Web项目到BAE


步骤
---
1. 安装BAE本地开发一样 http://developer.baidu.com/wiki/index.php?title=docs/cplat/bae/localdev
2. 用root用户ssh登录后,运行apt-get update
3. 运行 `su - bae`, 切换到bae用户
4. git clone 本项目
5. 执行 `bash build_ruby_time.sh` , 构建成功后会在 `/tmp/build_ruby_runtime` 目录生成 `baerr-v1.tar.gz` , 此文件即是最终的ruby运行时

Web App 安装
---
[https://github.com/mangege/baerr/blob/master/APP_SETUP.md](https://github.com/mangege/baerr/blob/master/APP_SETUP.md)


软件说明
---
* nginx, web server,用于处理静态文件请求
* ruby, ruby vm
* node, nodejs vm, 项目不安装therubyracer gem,改用nodejs,减少项目的大小
* libmysqlclient-dev, mysql头文件库文件, mysql2 gem需要,无法通过系统命令安装成功,只好解压到运行时

第三方库说明
---
像mysql2依赖libmysqlclient-dev而系统包没有,这个时候得自己手动分析mysql2的 extconf.rb 此文件的源码,看会不会从环境变量读取相关信息. 如果没有,估计只能自己fork此gem,然后修改源码了.

mysql2会读PATH变量,查看有没有mysql-config文件,如果有此文件,就会生成相关的路径

Supervisor 调试
---
1. 复制 files/sv.conf 到 /home/bae/ 目录下
2. 执行 `supervisord -c /home/bae/sv.conf -n`

App 调试
---
1. 先搭建好 Supervisor 的调试环境
2. 克隆 App 源码到 /home/bae/app 目录下, `ls /home/bae/app/` 结果应该是 `app  app.conf  bin  build_runtime.sh  config  config.ru  db  Gemfile  Gemfile.lock  lib  log  public  Rakefile  README.rdoc  supervisord.conf  test  tmp  vendor`
3. 执行 `supervisord -c /home/bae/sv.conf -n`

License
---
MIT License
