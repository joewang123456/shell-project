# 创建新的项目并且同步到github/gitlab仓库
# . crateNewProject.sh git@github.com:joewang123456/shell-project.git shell-project
# . crateNewProject.sh 远程仓库地址 项目名称
#!/usr/bin/env bash
source /Users/nali/Desktop/ximalaya/app-ui/shell-project/common.sh
repo_url=$1;
app_name=$2;
app_path="/Users/nali/Desktop/ximalaya/app-ui/";
green "---------------------------------->>>>发起创建项目流程"
# 进入app-ui
echo "--------------------------进入$app_path"
cd $app_path
# 创建项目名称$1
echo "------------------------项目名称：$app_name"
mkdir $app_name
# 进入$app_name
green "---------------------------------->>>>进入项目$app_name"
cd $app_name
# 初始化npm
green "---------------------------------->>>>初始化npm"
npm init -y
# 初始化git
green "---------------------------------->>>>---初始化git---------------------------------------"
git init
# 添加.gitignore文件
green "---------------------------------->>>>----创建.gitignore文件--------------------------------------"
echo -e "/node_modules\n\n/build\n\n" >> .gitignore
# git add .
green "---------------------------------->>>>---git add---------------------------------------"
git add .
# git commit -m '创建项目$1'
green "---------------------------------->>>>----git commit--------------------------------------"
git commit -m "create $app_name project"
# 关联远程仓库
green "---------------------------------->>>>-------关联远程仓库-----------------------------------"
git remote add origin $repo_url
# 推送到远程仓库
green "---------------------------------->>>>------推送到远程仓库------------------------------------"
git push -u origin master
# 创建develop分支
green "---------------------------------->>>>----------创建develop分支--------------------------------"
git checkout -b develop
# 推送到远程仓库
green "---------------------------------->>>>---推送到远程仓库---------------------------------------"
git push -u origin develop
green "---------------------------------->>>>创建项目成功"


