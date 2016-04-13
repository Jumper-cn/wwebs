# wwebs
一个分布式的后台架构,spring hibernate redis mysql

================================================================
向导指引
================================================================
1. 请仔细阅读本文档
2. docs\[1]技术文档\后台内部文档 存放有全部项目架构文档，服务器通信说明文档，数据文档等全部技术文档
3. ......

================================================================
项目依赖
================================================================
1.  os
2.  jdk 1.8+
3.  maven 3.0+
4.  svn
5.  ......

================================================================
目录结构
================================================================

root
├─docs      文档目录
├─script    系统脚本存放目录
├─framework 系统框架模块目录
├─modules   系统模块列表子项目，提供业务层service
│  └─ucenter    用户中心管理模块
├─auth      认证服务器war项目，提供用户注册及认证相关接口(restful 风格)
├─website   公司官网项目
└─admin     系统运营后台war项目

================================================================
源码编译
================================================================

0.  checkout源码

1.  安装j2ee开发环境

2.  安装maven客户端3.0+版本

3.  配置maven私服
    a.拷贝 root/script/maven/setting.xml 到 【当前用户】/.m2 目录下
    b.eclipse指定maven客户端 
        window->Preferences->Maven->Installations
        add 新安装的maven客户端目录(eclipse自带的maven是简化版本，有功能限制，不能直接使用)
    c.eclipse配置maven参数
        window->Preferences->Maven->User Settings
        user settings 路径指向[a]步所复制的文件
        点击update settings按钮，使配置生效
        确定保存配置

4.  导入项目源码
    a.使用项目导入向导
        eclipse->File->import...
        选择 Maven->Existing Maven Project  点击Next
        在Root Directory选项上指定项目根目录
        选择全部子项目及模块导入

5.  ......
