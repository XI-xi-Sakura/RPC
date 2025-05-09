﻿
## 项目介绍

RPC（RemoteProcedureCall）远程过程调用，是一种通过用络从远程计算机上请求服务，而不需要了解底层网络通信细节。

RPC可以使影多种网络协议进行通信，如HTTP、TCP、UDP等，并且在TCP/IP网络四层模型中跨越了传输层和应用层。简言之RPC就是像调用本地方法一样调通用远程方法。

该项目是基于C++、JsonCpp、muduo网络库实现一个简单、易用的RPC通信框架，即使是不懂网络的开发者也可以很快速的上手，它实现了同步调用、异步callback调用、异步futrue调用、服务注册/发现，服务上线/下线以及发布订阅等功能设计。


## 所用技术
json 序列化，网络通信 - 高性能服务器（muduo），rpc，发布订阅

## 框架设计：
框架分三层进行设计 --（抽象层，实现层，业务层）

抽象：针对底层的网络通信和协议部分进行了抽象，降低框架的依赖，提高框架的灵活度，以及可维护性。

实现：针对抽象的功能进行具体的实现（muduo 库搭建高性能客户端服务器，TLV 应用层协议格式，消息类型）

业务：基础 rpc，服务发现与注册以及上线 / 下线通知，发布订阅。


## 环境搭建（ubuntu系统）
### 安装lrzsz传输工具

```
$ sudo apt-get install lrzsz
```

### 安装编译器gcc/g++

```
$ sudo apt-get install gcc g++
```

### 安装项目构建工具make

```
$ sudo apt-get install make
```
### 安装调试器gdb

```
$ sudo apt-get install gdb
```
### 安装git

```
$ sudo apt-get install git
```
### 安装cmake

```
$ sudo apt-get install cmake
```
### 安装jsoncpp
```
$ sudo apt-get install libjsoncpp-dev
```
### 安装Muduo

```
$ git clone https://github.com/chenshuo/muduo.git
$ sudo apt-get install libz-dev libboost-all-dev
$ unzip muduo-master.zip
$ ./build.sh
$ ./build.sh install
```

