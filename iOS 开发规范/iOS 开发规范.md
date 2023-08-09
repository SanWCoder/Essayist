# iOS 开发规范

# 一.格式化
参考地址 ：https://www.jianshu.com/p/69883f2a16e1

### 1.1 swiftformat

```
brew install swiftformat
```
### 1.2 swiftformat-for-xcode

```
brew install --cask swiftformat-for-xcode
```
### 1.3 open swiftformat-for-xcode

```
~ open "/Applications/SwiftFormat For Xcode.app"
```
### 1.4 use swiftformat-for-xcode
```
swiftformat /Users/sanw/Desktop/HCYTech/Projects/HCYArtCenter/Trunk/HCYArtCenter
```
### 1.5 codeSnippets

/Users/sanw/Library/Developer/Xcode/UserData/CodeSnippets

# 二.代码规范检测Lint

## 2.1 swiftlint

### 2.1.1 .podspec添加依赖

```
s.dependency 'SwiftLint'          ,'0.51.0'

~ pod install

```
### 2.1.2 添加脚本

TARGETS -> Build Phases -> + -> New Run Script Phase

```
// /bin/sh

# 1.Pod方式
"${PODS_ROOT}/SwiftLint/swiftlint"
# 2.Homebrew方式
# if which swiftlint >/dev/null; then
#   swiftlint
# else
#   echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
# fi

```
### 2.1.3 自定义规则

在Example根目录下创建.swiftlint.yml文件

```
~ touch .swiftlint.yml

// .swiftlint.yml

included:                                       # 执行lint包含的路径
#    - Example/Folder                           # 指定目录
#    - Example//Folder/AppDelegate.swift        # 指定文件
    - ../HCYNetRequestKit/Classes               # 指定lint需包含../HCYNetRequestKit/Classes目录

excluded:                                       # 执行lint忽略的路径，优先级高于 `included`
    - Pods                                      # 忽略Pods

#disabled_rules:                                 # 执行时排除掉的规则
#    - identifier_name                           # 驼峰命名检查
#    - trailing_whitespace                       # 空行不能有空格

#force_try: warning                              # 避免使用强制try

#force_cast: warning                             # 直接强解类型 eg: NSNumber() as! Int

#type_name: warning                              # 类型名称违规 eg：类型首字母需大写

#cyclomatic_complexity:                          # 代码复杂度,默认为10
#    warning: 10
#    error: 15

line_length:                                    # 单行代码长度,默认error 200
    warning: 300
    error: 350
  
function_parameter_count:                       # 函数参数个数
    warning: 5
    error: 7
  
#function_body_length:                           # 函数体长度 40lines - 100lines
#    warning: 100
#    error: 150

#file_length:                                    # 文件长度
#    warning: 500
#    error: 1200

```
## 2.2 Git提交lint

### 2.2.1 安装node

```
~ brew install node@16

~ echo 'export PATH="/opt/homebrew/opt/node@16/bin:$PATH"' >> ~/.zshrc

~ source ~/.zshrc

~ npm -v

```
### 2.2.2 添加package.json

在项目根目录下创建package.json文件

```
~ touch package.json


// package.json

{
  "name": "lint",
  "version": "1.0.0",
  "private": true,
  "devDependencies": {
    "husky": "^8.0.3",
    "lint-staged": "^13.2.3"
  },
  "lint-staged": {
    "*.swift":["Example/Pods/SwiftLint/swiftlint lint"]
  }
}

```
### 2.2.3 安装插件

```
~ npm install --save-dev lint-staged # 安装hulint-stagedsky
~ npm install husky --save-dev // 安装husky
~ npx husky install  // 手动启用husky
~ npx husky add .husky/pre-commit "npm run lint-staged"

```
### 2.2.4 编辑.husky/pre-commit

```
// pre-commit

#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

npx lint-staged
```
### 2.2.5 编辑package.json

lint-staged 配置规则根据实际路径修改

"Example/Pods/SwiftLint/swiftlint lint" or "Pods/SwiftLint/swiftlint lint"

```
// package.json

{
  "name": "lint",
  "version": "1.0.0",
  "private": true,
  "devDependencies": {
    "husky": "^8.0.3",
    "lint-staged": "^13.2.3"
  },
  "lint-staged": {
    "*.swift":["Example/Pods/SwiftLint/swiftlint lint"]
  }
}

```
### 2.2.6 Podfile添加插件校验

在Podfile中添加如下代码

```
## lint-staged,husky,lint插件校验
pre_install do |installer|
  # 插件路径
  sandbox_root = Pathname(installer.sandbox.root)
  # 此路径根据实际路径修改 .. or ../..
  ycroot = File.expand_path("../..", sandbox_root)
  node_module_lint_stage = File.expand_path("node_modules/lint-staged/",ycroot)
  node_module_husky = File.expand_path("node_modules/husky",ycroot)
  
  has_lint_stage = File.exist?(node_module_lint_stage)
  has_husky = File.exist?(node_module_husky)
  
  # 检查是否安装 lint-staged 及 husky
  if has_husky && has_lint_stage
    Pod::UI.puts "lint staged 和 husky 已安装"
  else
    raise "warning error： lint staged or husky 不存在，请使用以下命令安装: npm install"
  end
end
```
