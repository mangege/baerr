Web App 安装
====

步骤
---
1. 复制 files/ 下的 build_runtime.sh supervisord.conf app.conf 到项目根目录
2. 修改 config/database.yml 和 config/secrets.yml 文件, database 不要漏掉reconnect参数
3. 执行 `RAILS_ENV=production rake assets:precompile` , 并把生成的静态文件添加的版本库. 服务器编译256m的内存很容易因为内存不足而被杀掉.
5. 添加 puma 到 Gemfile, 复制 files/puma.rb 到项目的 config/ 目录下
4. 执行 `bundle install --path vendor/bundle`, 把gem添加到版本库,从远程拿太久也容易被杀死. 记得修改git config,把 [http postBuffer](http://stackoverflow.com/questions/2702731/git-fails-when-pushing-commit-to-github) 改大些

```
config/database.yml 局部示例

production:
  <<: *default
  database: iwLabqKPAXJTKWNVGWCN
  username: NvvucaeqBh16V1l3HkhC0YWe
  password: 0w0zK10lNbcvUgAdwF2AFnHHEVYWfmKt
  host: sqld.duapp.com
  port: 4050
  reconnect: true
```

其它
---
* 请到 [http://pan.baidu.com/s/1c0gnQ28](http://pan.baidu.com/s/1c0gnQ28) 下载最新的二进制版本,上传到自己的云存储,因为云存储是收费的,所以build_runtime.sh的"http://bcs.duapp.com/hellorails/baerr-v1.tar.gz"这个链接不保证一直有效
* 日志都存放在 /home/bae/log 目录下,可以网站上的查看日志查看到
