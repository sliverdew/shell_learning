# 函数 thinker()
# 功能 将附加在脚本末尾的 域名:IP 抽取出来，存储在字符串变量中，并返回该变量
function thinker(){
        # 这里是过滤脚本本身尾部的域名ip区域
        vars=`cat $0 | sed -n '/# BEGINVAR$/,/# ENDVAR$/p' | grep -v -E '# BEGINVAR|# ENDVAR' | sed -n 's/^# //gp'`
        echo $vars
}

