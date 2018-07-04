#  添加新的功能
 path="/Users/nali/Desktop/ximalaya/app-ui/gulp-project/src/";
 html="
 <!DOCTYPE html>
<html lang=\"zh-CN\">
<head>
    <meta charset=\"utf-8\">
    <meta http-equiv=\"Expires\" content=\"Mon, 05 Dec 2016 07:48:07 GMT\" />
    <meta http-equiv=\"Cache-Control\" content=\"max-age=60\" />
    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
    <meta name=\"viewport\" content=\"initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width,user-scalable=no\" />
    <title>$1</title>
    <meta name=\"keywords\" content=\"$1\">
    <meta name=\"description\" content=\"$1\">
    <!-- inject:css -->
    <!-- endinject -->
</head>
<body>
    <div class=\"content\">$1</div>
    <!-- inject:js -->
    <!-- endinject -->
</body>
</html>";
js=";\"use strict;\"\n;(function(){\n})()"
 rm -rf "${path}pages/$1.html" "${path}js/$1.js" "${path}style/$1.scss"
 touch "${path}pages/$1.html" "${path}js/$1.js" "${path}style/$1.scss"
 echo -e "${html}" > "${path}pages/$1.html"
 echo -e "${js}" > "${path}js/$1.js"
