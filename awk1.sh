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
