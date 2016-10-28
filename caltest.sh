#!/system/bin/sh
#打开计算器
am start -n com.android.calculator2/com.android.calculator2.Calculator 
#随机函数
##function Random()
##{
#	min=$1
#	max=$2
#	num=$(date +%s+%N);
#   ((retnum=num%max+min));
#	echo $retnum,$num
#}
#输入算式
for i in `seq 100000`
do
	#symbol=$(Random 1 6)
    symbol=$(($RANDOM%12+1))
    #A=$(Random 2 10000)
    A=$(($RANDOM%1000+1))
    #B=$(Random 2 10000)
    B=$(($RANDOM%1000+1))
    case $symbol in
    	1) input text $A+$B=
		   ((resu=$A+$B))
		   echo $resu
	;;
		2) input text $A-$B=
		   ((resu=$A-$B))
		   echo $resu
	;;
		3) input text $A*$B=
		   ((resu=$A*$B))
		   echo $resu
	;;
		4) input text $A/$B=
		   ((resu=$A/$B))
		   echo $resu
	;;
		5) input text $A!=
		   ((resu=$A!))
		   echo $resu
	;;
		6) input text $A%=;
		   ((resu=$A/100));
		   echo $resu
	;;
		7) input text $A^=
		   ((resu=^$A))
		   echo $resu
	;;
		8) input tap 864 482
		   input text $A=
		   ((resu=sin$A))
		   	echo $resu
	;;
		9) input tap 1030 459
		   input text $A=
		   ((resu=cos$A))
		   echo $resu
	;;
		10) input tap 271 1162
		    input text $A=
		    ((resu=tan$A))
		   	echo $resu
	;;
		11) input tap 860 538
		    input text $A=
		    ((resu=ln$A))
		   	echo $resu
	;;
		12) input tap 1016 1154
		    input text $A=
		    resu=$((log$A))
		   	echo $resu
	esac
	input text =
done
#可支持的运算符号：+，-，*，/，！，%，^,sin,cos,tan,ln,log

#计算机计算结果

#对比