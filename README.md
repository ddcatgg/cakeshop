## 开发调试环境

### 开发平台

| 操作系统  | Python 版本           |
| --------- | --------------------- |
| Windows 7 | Python 2.7 (32位版本) |



### 安装依赖包

#### mysql-python

这个包的安装比较麻烦，直接通过 pip 在线安装的话可能会失败，因此建议通过 whl 安装：

```
pip install dependency/MySQL_python-1.2.5-cp27-none-win32.whl
```

#### 其它依赖包

```
pip install -r requirements-exact.txt
```



### 设置数据库和缓存服务器信息

```
cd src
vi setting.py
```

主要是修改数据库信息，可将数据库密码设置到 DB_PASSWD 环境变量。

或在项目目录下建立一个 .env 文件：

```
DB_PASSWD=123456
```

写入数据库密码。



### 初始化数据库

首先确保 MySQL 中已创建好 `setting.py` 中 `DB_NAME` 所指定的数据库。

```
python manager.py --cmd=syncdb
```



### 运行

```
python manager.py
```

打开浏览器，输入 http://127.0.0.1:8080 打开网站。

使用管理员账号 root，密码 111111 登录。

管理员登录后，需要在管理商品里面添加商品，并添加地区，否则客户无法下单。

普通客户账号可通过注册功能自由注册。





## 生产环境

系统要求：
nginx
centos 6.x
mysql 5.1x
memcached

一 安装基本环境
1 安装系统环境
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6

yum -y install gcc nginx mysql-libs mysql-server mysql-devel memcached python-setuptools

2 安装 virtualenv
easy_install virtualenv

3 安装pypy
yum -y install pypy-libs pypy pypy-devel

4 创建基本环境
cd /home/www
virtualenv --no-site-packages -p pypy czcake

cd czcake
source bin/activate

#把源文件放进来

pip install -r requirement.txt

mkdir etc
echo_supervisord_conf > etc/supervisord.conf

vi etc/supervisord.conf
#添加配置
[program:czcake8080]
command=python /home/www/czcake/src/manager.py
autostart=true
stderr_logfile = /var/log/nginx/app.log
stdout_logfile = /var/log/nginx/app.log

supervisord -c /home/www/czcake/etc/supervisord.conf

vi /etc/nginx.conf
#添加配置
upstream czcake {
    server 127.0.0.1:8080;
}

server {
    listen       80;
    server_name czcake.heycz.com;
    client_max_body_size  4M;

    location /
    {
        proxy_pass_header Server;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Scheme $scheme;
        proxy_pass http://czcake;
    }
}

二 项目配置
cd src
vi setting.py
#设置数据库和缓存服务器信息

#初始化数据库
python manager.py --cmd=syncdb

三 开始运行
supervisorctl restart all
service nginx restart