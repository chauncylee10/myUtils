更新python
安装步骤（Ubuntu 18.04）

检查系统是否安装满足版本要求的python开发环境，请在root用户下执行如下命令检查源是否可用。

    apt-get update

    apt-get install -y gcc g++ make cmake zlib1g zlib1g-dev openssl libsqlite3-dev libssl-dev libffi-dev unzip pciutils net-tools libblas-dev gfortran libblas3 libopenblas-dev


可参考如下命令安装python（以python3.7.5为例）。

    使用wget下载python3.7.5源码包，可以下载到安装环境的任意目录，命令为：
    wget https://www.python.org/ftp/python/3.7.5/Python-3.7.5.tgz
    进入下载后的目录，解压源码包，命令为：
    tar -zxvf Python-3.7.5.tgz
    进入解压后的文件夹，执行配置、编译和安装命令：
    cd Python-3.7.5
    ./configure --prefix=/usr/local/python3.7.5 --enable-loadable-sqlite-extensions --enable-shared
    make
    make install
    其中“--prefix”参数用于指定python安装路径，用户根据实际情况进行修改。“--enable-shared”参数用于编译出libpython3.7m.so.1.0动态库。“--enable-loadable-sqlite-extensions”参数用于加载libsqlite3-dev依赖。

    以--prefix=/usr/local/python3.7.5路径为例进行说明。执行配置、编译和安装命令后，安装包在/usr/local/python3.7.5路径，libpython3.7m.so.1.0动态库在/usr/local/python3.7.5/lib/libpython3.7m.so.1.0路径。

    设置python3.7.5环境变量。
    #用于设置python3.7.5库文件路径
    export LD_LIBRARY_PATH=/usr/local/python3.7.5/lib:$LD_LIBRARY_PATH
    #如果用户环境存在多个python3版本，则指定使用python3.7.5版本
    export PATH=/usr/local/python3.7.5/bin:$PATH
    通过以上export方式设置环境变量，该种方式设置的环境变量只在当前窗口有效。您也可以通过将以上命令写入~/.bashrc文件中，然后执行source ~/.bashrc命令，使上述环境变量永久生效。注意如果后续您有使用环境上其他python版本的需求，则不建议将以上命令写入到~/.bashrc文件中。

    安装完成之后，执行如下命令查看安装版本，如果返回相关版本信息，则说明安装成功。
    python3 --version
    pip3 --version


安装依赖前可配置pip源，具体可参考：
    配置pip源，配置方法如下：

    使用软件包的安装用户，执行如下命令：
    cd ~/.pip
    如果提示目录不存在，则执行如下命令创建：

    mkdir ~/.pip 
    cd ~/.pip
    编辑pip.conf文件。
    使用vi pip.conf命令打开pip.conf文件，写入如下内容：

    [global]
    #以华为源为例，请根据实际情况进行替换。
    index-url = https://mirrors.huaweicloud.com/repository/pypi/simple
    trusted-host = mirrors.huaweicloud.com
    timeout = 120
    执行:wq!命令保存文件。

    安装前，建议执行命令pip3 install --upgrade pip进行升级，避免因pip版本过低导致安装失败。