# Ubuntu镜像更换华为源
# 使用说明
# Ubuntu的仓库地址为：https://repo.huaweicloud.com/ubuntu/
# Ubuntu-CD的镜像地址为：https://repo.huaweicloud.com/ubuntu-cdimage/
# Ubuntu-Cloud的镜像地址为：https://repo.huaweicloud.com/ubuntu-cloud-images/
# Ubuntu-Ports的仓库地址为：https://repo.huaweicloud.com/ubuntu-ports/
# Ubuntu-Releases的镜像地址为：https://repo.huaweicloud.com/ubuntu-releases/
# 1、备份配置文件：
sudo cp -a /etc/apt/sources.list /etc/apt/sources.list.bak
# 2、修改sources.list文件，将http://archive.ubuntu.com和http://security.ubuntu.com替换成http://repo.huaweicloud.com，可以参考如下命令：
sudo sed -i "s@http://.*archive.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list
sudo sed -i "s@http://.*security.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list
# 3、执行apt-get update更新索引