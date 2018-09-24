#!/bin/bash

# 1. IF we find hello on stdin => print whole line
# awk '/hello/{print $0}'

# 2. Script from file
# awk -f script1.awk

# 3. Simple print
# awk 'BEGIN { print "hello" }'

# 4. Simple print ' using octal escape sequence
# awk 'BEGIN { print "John\47s cat"} '

# 5. Simple print ' using escape ' between ''
# awk 'BEGIN { print "John'\''s cat"} '

# 6. Simple print ' using var
# awk -v char="'" 'BEGIN { print "John"char"s cat"} '

# 7. Simple search string in line
# awk '/awk/ { print $0 }' $0

# 8. Simple search string in line, omitting action (so print all)
# awk '/awk/' $0

# 9. Show line having length > 50 using pattern
# awk 'length($0)>50' $0

# 10. Show line having length > 50 using action
# awk '{ if (length($0) > 50) print }' $0

# 11. print longest record
# awk ' { if (length($0) > length(max)) max=$0 } END { print max" "length(max) }' $0

# 12. print rows having more that 10 columns
# awk 'NF > 10' $0

# 13. Show, for each row, ROW Number FIELD Number
# awk 'NF > 0 { print NR,FNR,NF }' $0

# 14. Set Output Field Separator
# awk 'BEGIN { OFS="->"} { print $1,$2,$3,$4 }' $0

# 15. NOT + AND Conditions
# awk '!/# awk/&&(NF>1) { print $0 }' $0

# 16. Set Output Record Separator
# awk 'BEGIN { ORS="|\n"} { print $0 }' $0

# 17. Set stdin and file
# awk '{ print "Row: ",$0 }' $0 -

# 18. Sed alternative: replace awk -> gawk
# awk '{ gsub("awk","gawk"); print $0}' $0

# 19. Use script1.awk, which includes script2.awk
# awk -f script1.awk $0

# 20. Use awk extensions (library)
# gawk -lordchr 'BEGIN { print chr(65) }'

# 21. cut alternative (substr) (from 1st to 20th char | 21th till end)
# awk '{ print substr($0,1,20) "|" substr($0,21) }' $0

# 22. Search string position (searching for BEGIN)
# awk '{ print index($0,"BEGIN"),$0 }' $0

# 23. Change Input Field Separator inline: 1. print left of "." and second word
#     on right of "." using " " as separator
# awk '{ FS="."; first=$1; $1=""; split($0,a," "); print first,a[2] }' $0

# 24. Match/No Match regexp
# awk '($2~/awk/) && ($0!~/gawk/) {print $0}' $0

# 25. Ignore case Match
# awk 'tolower($0)~/begin/' $0
# awk -v IGNORECASE=1 '/begin/' $0
# awk 'BEGIN{IGNORECASE=1 } /begin/' $0

# 26. Match index odd and even numbers
# awk '/^# [0-9]{0,1}[13579]\./' $0
# awk '/^# [0-9]{0,1}[^13579]\./' $0
# awk '/^# [0-9]*[^13579]\./' $0

# 27. Match index odd just with at least 2 numbers
# awk '/^# [0-9]+[13579]\./' $0

# 28. Match index just with at just 0 or 1 number
# awk '/^# [0-9]?\./' $0

# 29. Match all lines not containing digits using DYNAMIC Regular Expression
# awk 'BEGIN{RE="[0-9]"} (NF>0 && $0!~RE)' $0

# 30. Conversion "{" in "{\n" and "}" in "\n}\n", INDENT
# awk '{ gsub(/{/,"{\n\t"); gsub(/}/,"\n}\n"); print }' $0

# 31. Change Record Separator
# awk -v RS="." // $0

# 32. Array Example (Sorted)
# awk '/^# [0-9]+\./ {
#   print $0
#   $1=$2=""
#   split($0,vett," ")
#   asort(vett)
#   for (i in vett)
#     print i ": " vett[i]
#   print "WORDS COUNT: " length(vett) "\n"
# }' $0

# 33. FIELDWIDTHS example
# echo "12345ABCDE1234567890ABC"|awk 'BEGIN{FIELDWIDTHS="5 5 10 3"} {
#   print \
#     "Initial String:",$0,"\n"\
#     "Using FIELDWIDTHS to extract Fixed Width Fields","\n"\
#     "First 5 Numbers:",$1,"\n"\
#     "First 5 Chars:",$2,"\n"\
#     "First 10 Numbers:",$3,"\n"\
#     "First 3 Chars:",$4,"\n"\
# }'

# 34. getline read-ahead same file example
# awk '{
#   while (getline temp) {
#     print "$0:",$0," getline:",temp
#   }
# }' $0

# 35. getline read same file in parallel
# awk -v FILENAME=$0 '{ \
#   getline temp < FILENAME; \
#   print $0 " | " temp \
# }' $0

# 36. redirecting first 2 columns to single files /tmp/1 and /tmp/2, use system to exec
# awk '{ \
#   print $1 > "/tmp/1"
#   print $2 > "/tmp/2"
# } END { \
#   print "First column"
#   system("cat /tmp/1")
#   print "Second column"
#   system("cat /tmp/2")
# }' $0

# 37. range between { and } (on/off feature)
# awk '/{/,/}/' $0

# 38. next example
# awk 'NF > 3 {next} // {print "NF:",NF,$0}' $0

# 39. exit example
# awk 'NR > 10 { exit } // { print "NR:",NR,$0}' $0

# 40. argc and argc example
# awk 'BEGIN {
#   for (i in ARGV)
#     print i":",ARGV[i];
#   print "ARGC:",ARGC
# }' $0

# 41. FILENAME example
# awk ' { print FILENAME; exit }' $0

# 42. PROCINFO and isarray() example
# awk 'BEGIN {
#   for(i in PROCINFO) {
#     if (isarray(PROCINFO[i]))
#       for(j in PROCINFO[i])
#         print i,j,PROCINFO[i][j]
#     else
#       print i,PROCINFO[i]
#   }
# }' $0

# 43. match example using on filter, printing and showing return, from a variable containing regular expression
# awk '
#   BEGIN {
#     REG=" ..\\."
#   }
#   match($0,REG) > 0 {
#     print("match($0,REG):",match($0,REG),$0)
#   }
# ' $0

# 44. strtonum example
# awk '$2 ~ /..\./ {
#   num = $2
#   gsub(/\./,"",num)
#   n = strtonum(num);
#   print "strtonum("num"*10) = " n*10," ",$0
# }' $0

# 45. sysdate(epoch),mktime,strftime
# awk 'BEGIN {
#   print "systime():",systime()
#   print "mktime(\"2000 01 01 00 00 00\"):",mktime("2000 01 01 00 00 00")
#   print "strftime(\"%d %m %Y %H %M %S\",946681200):",strftime("%d %m %Y %H %M %S",946681200)
# }' $0

# 46. User defined function example, return strtonum and quadratic
# awk '
#   function toNumAndQuadratic(s) {
#     return strtonum(s)^2
#   }
#   BEGIN {
#     NumExpr="^# [0-9]+\\."
#   }
#   match($0,NumExpr) > 0 {
#     print "toNumAndQuadratic(\""$2"\"): " toNumAndQuadratic($2)," " $0
#   }
# ' $0

# 47. Indirect function calls
# awk '
# function odd() {
#   return "called function odd";
# }
# function even() {
#   return "called function even";
# }
# BEGIN {
#   NumExpr="^# [0-9]+\\."
# }
# match($0,NumExpr) > 0 {
#   num = strtonum($2)
#   t = num % 2 != 0 ? "odd" : "even"
#   print "num:",num ",","type:",t ",",@t()
# }
# ' $0
