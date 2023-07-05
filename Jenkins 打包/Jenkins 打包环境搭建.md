# 安装jenkins
注：xcodebuild工具是Apple的Xcode SDK的一部分 - 它只能在Mac OS X上安装
因此打包iOS App jenkins 不能使用非Mac OS 系统，建议采用分布式部署，将Mac作为代理
## jenkins安装需要jdk

地址：https://www.oracle.com/java/technologies/downloads/#java8

```
java -version
```
## homebrew来安装jenkins

```
brew install Jenkins
```
## 启动

```
brew services start jenkins
//或者使用
jenkins
// 重新启动
brew services restart jenkins
// 停止
brew services stop jenkins
// 更新
jenkins：切换到目录cd ~/.jenkins，然后用最新下载的war包替换文件夹中的war
```
## 设置开机启动
```
// 设置开机启动
sudo launchctl load -w /Library/LaunchDaemons/org.jenkins-ci.plist 
// 取消开机启动
sudo launchctl unload -w /Library/LaunchDaemons/org.jenkins-ci.plist 
```
# 使用
## Jenkins基本操作
 * 安装地址 http://localhost:8080/
 * jenkins的配置参数存储在 /usr/local/opt/jenkins/homebrew.mxcl.jenkins.plist文件中，找到对应的参数修改即可


/private/var/jenkins/workspace/ios

pod install --allow-root

cd "${WORKSPACE}"

cd ~/Library/Keychains

login.keychain-db

/Users/sanw/Library/MobileDevice

ssh server


git@172.16.10.25:hcy_frontend_project/mockSever.git

http://172.16.10.25:9999/hcy_frontend_project/mockSever.git

echo "当前文件所在目录：$PWD"
echo "当前用户：$(whoami)"
ls
rm -rf build.tgz
rm -rf build-mock.tgz
ls
npm install
# 打压缩包
# tar -zcvf build-mock.tgz .
# ls
# rm -rf /home/hcytech/artcenter_mock_html
# mkdir -p /home/root1/jenkins/home/hcytech/build-mock
# tar -xzvf build-mock.tgz -C /home/root1/jenkins/home/hcytech/build-mock
# mv /home/root1/jenkins/home/hcytech/build-mock /home/hcytech/artcenter_mock_html
# scp -r * root1@remote-server:/path/to/destination/
# copy
# cp -rf * /home/hcytech/artcenter_mock_html
# cd /home/hcytech/artcenter_mock_html
# npm install pm2 -g
pwd
pm2 start app.js
# git tag -a sharing_bikes_web_${BUILD_TIMESTAMP} -m "sharing_bikes_web_${BUILD_TIMESTAMP}"
# git push origin sharing_bikes_web_${BUILD_TIMESTAMP}
whoami
pwd
node -v
whereis node
which node

pm2 -v

whereis pm2

which pm2


rm -rf /usr/local/company/bikes-web/bikes_html_pre_test
rm -rf /root/jenkins/hcytech/build-bike
mkdir -p /root/jenkins/hcytech/build-bike
tar -xzvf /root/jenkins/build.tgz -C /root/jenkins/hcytech/build-bike
mv /root/jenkins/hcytech/build-bike/build /usr/local/company/bikes-web/bikes_html_pre_test
ls /usr/local/company/bikes-web/bikes_html_pre_test
/home/root1/jenkins


# dashboard
```
rm -rf /home/hcytech/power-monitor/html/child/dashboard
rm -rf /home/hcytech/dashboard/html
rm -rf /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard
mkdir -p /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard
mkdir -p /home/hcytech/dashboard/html
tar -xzvf /home/root1/jenkins/dashboard.tgz -C /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard
cp -r /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard/dist/* /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard
cp -r /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard/dist/* /home/hcytech/dashboard/html
rm -rf /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard/dist
mv /home/root1/jenkins/hcytech/power-monitor/html/child/dashboard /home/hcytech/power-monitor/html/child/dashboard

```

# device
```
rm -rf /home/hcytech/power-monitor/html/child/device
rm -rf /home/hcytech/power/html/power
rm -rf /home/root1/jenkins/hcytech/power-monitor/html/child/device
mkdir -p /home/root1/jenkins/hcytech/power-monitor/html/child/device
mkdir -p /home/hcytech/power/html/power
tar -xzvf /home/root1/jenkins/device.tgz -C /home/root1/jenkins/hcytech/power-monitor/html/child/device
cp /home/root1/jenkins/hcytech/power-monitor/html/child/device/dist/* /home/root1/jenkins/hcytech/power-monitor/html/child/device
cp /home/root1/jenkins/hcytech/power-monitor/html/child/device/dist/* /home/hcytech/power/html/power
rm -rf /home/root1/jenkins/hcytech/power-monitor/html/child/device/dist
mv /home/root1/jenkins/hcytech/power-monitor/html/child/device /home/hcytech/power-monitor/html/child/device

```

# power-monitor
```
rm -rf /home/root1/jenkins/hcytech/power-monitor/html
mkdir -p /home/root1/jenkins/hcytech/power-monitor/html/child
cp -r /home/hcytech/power-monitor/html/child/* /home/root1/jenkins/hcytech/power-monitor/html/child
rm -rf /home/hcytech/power-monitor/html
tar -xzvf /home/root1/jenkins/dist.tgz -C /home/root1/jenkins/hcytech/power-monitor/html
mkdir -p /home/hcytech/power-monitor/html
cp -r /home/root1/jenkins/hcytech/power-monitor/html/dist/* /home/hcytech/power-monitor/html
cp -r /home/root1/jenkins/hcytech/power-monitor/html/child /home/hcytech/power-monitor/html
rm -rf /home/root1/jenkins/hcytech/power-monitor/html

```

# nginx

```
/etc/nginx

sudo systemctl  status nginx

sudo nginx -s reload

sudo nginx -t

sudo  systemctl start nginx

systemctl status nginx.service

sudo nginx -s reopen

cp /etc/nginx/conf.d/nginx_dashboard.conf /etc/nginx/conf.d/nginx_device.conf


vim /etc/nginx/conf.d/nginx_device.conf

listen       3017;
/home/hcytech/device/html
/home/hcytech/device/files/

```



















