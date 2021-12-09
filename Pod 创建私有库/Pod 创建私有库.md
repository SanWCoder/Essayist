# Pod私有库使用
# 一.创建私有库
### 1.进入克隆到本地的文件夹下
`cd /Users/xxx/xxx/xxx/Projects/BFMaterialKit`
### 2.创建远程git仓库
`https://git.xxx.com/xxx/BFMaterialKit.git`
### 3.本地新增repo，克隆git到本地
`pod repo add BFMaterialKit  https://git.xxx.com/xxx/BFMaterialKit.git`
### 4.查看本地仓库
```
pod repo
```
### 5.创建BFMaterialKit pods以及DEMO工程
`pod lib create BFMaterialKit`

### 6.删除ReplaceMe文件
删除ReplaceMe文件，../Classes中

### 7.修改podspec

```swift
  s.name             = 'BFMaterialKit'
  s.version          = '1.1.5'
  s.summary          = 'A short description of BFMaterialKit.'
  s.swift_version    = '5.0'
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://git.xxx.com/xxx'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xxx' => 'xxx@xxx.com' }
  s.source           = { :git => 'https://git.xxx.com/xxx/BFMaterialKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '10.0'
```
### 8.如果有第三方库依赖，则进行pod install，如target不一致则修改target
```swift
~ cd Example
~ pod install

// 如果报错则需要更改target值
/**
[!] CocoaPods could not find compatible versions for pod "Alamofire":
  In Podfile:
    BFNetRequestKit (from `../`) was resolved to 0.1.0, which depends on
      Alamofire (= 5.4.3)

Specs satisfying the `Alamofire (= 5.4.3)` dependency were found, but they required a higher minimum deployment target.
*/
```
### 9.编写文件，提交版本
```
// 绑定远程仓库
git remote add origin https://git.xxx.com/xxx/BFMaterialKit.git

// 提交文件
git add .
git commit -m'first‘

// 推送到远程master分支
git pull origin master --allow-unrelated-histories
git push origin master

// 创建Tag
git tag -a 0.0.1 -m 'version 0.0.1'

// 推送所有Tag
git push --tags

```


### 10. 校验
```
pod spec lint (--allow-warnings)

// or
pod spec lint --sources='https://git.xxx.com/xxx/BFMaterialKit.git,https://github.com/CocoaPods/Specs' --allow-warnings

```

### 11. 校验并推送
```
pod repo push BFMaterialKit BFMaterialKit.podspec (--allow-warnings)

// or - 将BFMaterialKit推送到BFSpecs（此库创建）
pod repo push BFSpecs BFMaterialKit.podspec --sources='https://git.xxx.com/xxx/BFSpecs.git,https://github.com/CocoaPods/Specs' --allow-warnings

```
### 12.使用不同方式使用库tag/branch/commit
```
pod 'BFMaterialKit', :git => 'https://git.xxx.com/xxx/BFMaterialKit.git', :tag => '0.0.2'

pod 'BFMaterialKit', :git => 'https://git.xxx.com/xxx/BFMaterialKit.git', :branch => 'master'

pod 'BFMaterialKit', :git => 'https://git.xxx.com/xxx/BFMaterialKit.git', :commit => 'cf791f6'
```
### 13.子模块创建-子模块会生成文件夹并可以单独集成使用
```
  # s.source_files = 'Classes/**/*'
  # subspec
  s.subspec 'Base' do |ss|
    ss.source_files = 'BFCommonKit/Classes/Base/*'
    ss.dependency 'Alamofire','4.9.1'
    ss.frameworks = 'UIKit', 'WebKit'
  end
  s.subspec 'BFCategorys' do |ss|
    ss.source_files = 'BFCommonKit/Classes/BFCategorys/*'
  end
```
### 14.资源使用asset

https://www.jianshu.com/p/e772b0713f9a

# 二.创建/使用已有Specs仓库

### 1.创建git
`https://git.xxx.com/xxx/BFSpecs.git`
### 2.本地新增repo，克隆git到本地
`pod repo add BFSpecs https://git.xxx.com/xxx/BFSpecs.git`
### 3.查看本地仓库
```
pod repo
```
### 4.将其他库推送到Specs仓库
```
// 将BFMaterialKit推送到BFSpecs（此库创建参考第一步1，2，3步骤）
pod repo push BFSpecs BFMaterialKit.podspec --sources='https://git.xxx.com/xxx/BFSpecs.git,https://github.com/CocoaPods/Specs' --allow-warnings
```

# 三.私用库之间引用（eg：BFMaterialKit 引用 BFCommonKit）

### 1.在.podspec文件中添加依赖
```
s.dependency 'BFCommonKit'

```
### 2.在Example的.Podfile文件中添加被引用库source
```
source 'https://git.xxx.com/xxx/BFCommonKit.git'
source 'https://github.com/CocoaPods/Specs.git'
```
### 3.更新库
```
pod install
```
# 四.参考文章
1.https://www.cnblogs.com/shen5214444887/p/13678300.html   

2.https://www.jianshu.com/p/d6a592d6fced    

3.https://www.jianshu.com/p/a32dad005f40    

4.https://www.jianshu.com/p/e772b0713f9a    
