$1 == LastPackage {
	print "\t" $0
	CountS+=1
}
$1 != LastPackage {
print "counts to " CountS+1;
CountS=0
LastPackage = $1
print $1
print "\t" $0
}