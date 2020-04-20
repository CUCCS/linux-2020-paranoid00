# 实验主题：动手实战systemd
## 实验环境：
- asciinema
- Ubuntu 18.04
## 实验内容：
- [Systemd 入门教程：命令篇](https://asciinema.org/a/lvymuAV3Z5lrPNbRX1v4vuBrE)
- [Systemd 入门教程：实战篇](https://asciinema.org/a/kb5r9pofUG0uilhI98rUVzlXC)
### 自查清单：
#### 如何添加一个用户并使其具备sudo执行程序的权限？
```
添加用户：useradd username / adduser username
给用户sudo权限：username -a -G sudo username
```
#### 如何将一个用户添加到一个用户组？
```
usermod -a -G groupname username
```
#### 如何查看当前系统的分区表和文件系统详细信息？
```
查看分区表：sudo fdisk -l
查看文件系统详细信息：df -T
```
#### 如何实现开机自动挂载Virtualbox的共享目录分区？
```
共享分区目录：mount -t vboxsf sharefilename /mnt/share
自动挂载：在文件末尾加/etc/fstab
```
#### 基于LVM（逻辑分卷管理）的分区如何实现动态扩容和缩减容量？
```
把分区XXX剩余空间创建分区并改为LVM格式：fdisk XXX
扩容：lvextend -L size XXX
缩小文件系统：resize2fs XXX size
缩小逻辑卷：lvreduce -L size XXX
```
#### 如何通过systemd设置实现在网络连通时运行一个指定脚本，在网络断开时运行另一个脚本？
```
修改systemd-network.server配置文件中的ExecStartPost=指定脚本；ExecStopPost=另一个脚本
重载修改过的配置文件：sudo systemctl daemon-reload
重启服务：sudo systemctl restart systemd-networkd.service

```
#### 如何通过systemd设置实现一个脚本在任何情况下被杀死之后会立即重新启动？实现杀不死？
```
打开配置文件修改Restart=always
重载修改过的配置文件：sudo systemctl daemon-reload
```

### 参考文件
- [LVM动态扩容](https://blog.csdn.net/loame_zyq/article/details/81512855)
- [LVM缩减容量](https://www.cnblogs.com/useradd/p/10005207.html)
- [自动挂载](https://blog.csdn.net/ysh198554/article/details/73335844)