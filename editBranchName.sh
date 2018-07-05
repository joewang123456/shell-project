# 将gitlab中某一个项目的某些分支同步到github中来
# . . editBranchName.sh git@github.com:joewang123456/share-buy.git share-buy hot-bugfix master
# . migrationgit.sh 项目github仓库地址 项目名称 旧的分支名称 新的分支名称
#!/usr/bin/env bash
source /Users/nali/Desktop/ximalaya/app-ui/shell-project/common.sh
#github仓库地址
github_url=$1;
#app name
app_name=$2
old_branch_name=$3;
new_branch_name=$4;

# Assume we are in your home directory
green "------------------------------->>>>进入/Users/nali/Desktop/"
cd /Users/nali/Desktop/

# create temp file
green "------------------------------->>>>创建temp文件"
mkdir temp

# go to temp file
green "------------------------------->>>>进入temp文件"
cd temp 

# Clone the repo from GitLab using the `--mirror` option
green "------------------------------->>>> Clone the repo from GitLab "
 git clone $github_url

green "------------------------------->>>> enter $app_name"
 cd $app_name/

green "------------------------------->>>> delete remote $old_branch_name"
git push origin -d $old_branch_name

green "------------------------------->>>> modify local branch name"
git branch -m $old_branch_name $new_branch_name

green "------------------------------->>>> push $new_branch_name branch to github origin"
git push -u origin $new_branch_name

# after finish all task , remove temp file
green "------------------------------->>>>  remove temp file "
cd /Users/nali/Desktop/
rm -rf temp
cd /Users/nali/Desktop/ximalaya/app-ui/shell-project/