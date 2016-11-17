    #!/bin/bash  
      
    isValidAlphaNumber()  
    {  
        result="$(echo $1 | sed 's/[^[:alnum:]]//g')"   #替换非字母数字为空格  

        if [ "$result"  = "$1" ]   #替换后结果与原输入相同
            then
            if [[ $result =~ ^[a-zA-Z] ]]
                then 
                return 0           #输入以字母开头
            else
                    return 1       #输入不以字母开头
            fi
        else
            return 1               #替换非字母数字后与原输入不同
        fi
    }  
      
    ###########代码执行起始位置###############    
    echo -n "Enter input:"    #强制不换行  
    read input                #读取输入  
      
    echo $input  
    if ! isValidAlphaNumber "$input"   #调用函数  
    then  
        echo "invalide"  
        exit 1  
    else  
        echo "valide"  
    fi  
    exit 0  