# 基于gulp-project为基础模板，创建新的项目
# 使用方式：. createTlpProject.sh 项目名称
# 首先要在远程仓库创建仓库，再继续如下命令
#!/usr/bin/env bash
source /Users/nali/Desktop/ximalaya/app-ui/shell-project/common.sh
app_name=$1;
green "---------------------->>>>进入/Users/nali/Desktop/ximalaya/app-ui/目录"
cd /Users/nali/Desktop/ximalaya/app-ui/

green "---------------------->>>>创建临时目录"
mkdir temp

green "---------------------->>>>进入临时目录"
cd temp/

green "---------------------->>>>拉去gulp-project项目代码"
git clone git@github.com:joewang123456/gulp-project.git

green "---------------------->>>>进入到gulp-project项目"
cd gulp-project/

green "---------------------->>>>删除git标记"
find . -name ".git" | xargs rm -Rf
green "---------------------->>>>修改package.json和package-lock.json中项目名称"
sed -i "" "s/gulp-project/${app_name}/g" package.json package-lock.json
cd ..

green "---------------------->>>>修改项目名称"
mv gulp-project $app_name
cd ..

green "---------------------->>>>移动${app_name}到App-ui目录"
mv temp/$app_name $app_name

green "---------------------->>>>删除temp目录"
rm -rf temp

green "---------------------->>>>进入${app_name}项目"
cd $app_name

green "---------------------->>>>git初始化推送到远程仓库"
git init
git remote add origin git@gitlab.ximalaya.com:joe.wang/${app_name}.git
git add .
git commit -m "创建${app_name}项目"
git push -u origin master
green "---------------------->>>>创建develop分支"
git checkout -b develop
git push -u origin develop
green "---------------------->>>>${app_name}项目创建成功"
cd /Users/nali/Desktop/ximalaya/app-ui/shell-project