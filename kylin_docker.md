### 配置阿里云CentOS 8镜像源

- 之所以要配置 Centos8 的镜像源是因为在安装docker的时候需要额外的一些依赖，而这些依赖在麒麟官方的源里面是没有的。

- sudo curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-8.repo
- sudo yum install -y yum-utils
- sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
- sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
- sudo sed -i 's+download.docker.com+mirrors.aliyun.com/docker-ce+' /etc/yum.repos.d/docker-ce.repo

- echo "8" > /etc/yum/vars/centos_version
- sudo sed -i 's/$releasever/$centos_version/g' /etc/yum.repos.d/docker-ce.repo
- sudo sed -i 's/$releasever/$centos_version/g' /etc/yum.repos.d/CentOS-Base.repo
- yum makecache

- https://cloud.tencent.com/developer/article/2353414
- https://www.cnblogs.com/pxyblog/p/17704776.html
- http://www.mfbz.cn/a/93149.html