# 将gitlab中某一个项目的某些分支同步到github中来
# . migrationgit.sh git@gitlab.ximalaya.com:joe.wang/node-server.git git@github.com:joewang123456/node-server.git node-server master,develop
# . migrationgit.sh 项目gitlab仓库地址 项目github仓库地址 项目名称 分支名称（如果多个用英文逗号分割）
#gitlab仓库地址
gitlab_url=$1;
#github仓库地址
github_url=$2;
#app name
app_name=$3;

# Assume we are in your home directory
echo "--------------进入/Users/nali/Desktop/--------------"
cd /Users/nali/Desktop/

# create temp file
echo "--------------创建temp文件--------------"
mkdir temp

# go to temp file
echo "--------------进入temp文件--------------"
cd temp 

# Clone the repo from GitLab using the `--mirror` option
echo "-------------- Clone the repo from GitLab --------------"
 git clone $gitlab_url

echo "-------------- enter $app_name--------------"
 cd $app_name/

# 解析字符串，获取要转移的分支名称
OLD_IFS="$IFS" 
IFS="," 
branch_names=($4) 
IFS="$OLD_IFS" 
for bname in ${branch_names[@]} 
do 
    startTranfer $bname
done

# after finish all task , remove temp file
echo "--------------  remove temp file --------------"
cd /Users/nali/Desktop/
rm -rf temp

#循环遍历分支推送单元,参数为分支名称
startTranfer(){
    echo "-------------- checkout to $1 branch--------------"
    git checkout $1

    echo "-------------- delete related gitlab origin--------------"
    git remote rm origin

    echo "-------------- add new github origin--------------"
    git remote add origin $github_url

    echo "-------------- push $1 branch to github origin--------------"
    git push -u origin $1

    echo "-------------- delete github origin--------------"
    git remote rm origin

    echo "-------------- recover to gitlab origin--------------"
    git remote add origin $gitlab_url

    echo "-------------- fetch all branch--------------"
    git fetch
}