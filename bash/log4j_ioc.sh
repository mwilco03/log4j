BADZIP=$(egrep -I -l -i -r '(\$|\%24)(\{|\%7b).*(j|J|\%4A|\%4a|\%6A|\%6a).*(n|N|\%4E|\%4e|\%6E|\%6e).*(d|D|\%44|\%64).*(i|I|\%49|\%69).*(\:|\%3a)[^\n]+' /logs/ /var/ /u01/ /data/ /webdata/ /usr/ibm/ 2>/dev/null | sort | uniq)
ZIPED=$(find / -name *.gz -type f 2>/dev/null | grep -v /lib64/ | grep -v /man/ | grep -v /lib/ | grep -v /bin/ | grep -v /doc/| grep -v /etc/ | grep -v .ctrl | grep -v .dat | grep -v /sys/ | grep -v .dtd | grep -v /proc/ | grep -v /var/cache/  | grep -v /usr/share/i18n/charmaps/ | grep -v /usr/share/info/)
BADZIP+=" "
BADZIP+=$(for i in $ZIPED; do zgrep -i -l -I '\(\$\|\%24\)\(\{\|\%7b\).*\(j\|J\|\%4A\|\%4a\|\%6A\|\%6a\).*' $i 2>/dev/null ; done)
zip /tmp/badlog.zip $BADZIP
SCRIPT=$(egrep -I -i -r '(\$|\%24)(\{|\%7b).*(j|J|\%4A|\%4a|\%6A|\%6a).*(n|N|\%4E|\%4e|\%6E|\%6e).*(d|D|\%44|\%64).*(i|I|\%49|\%69).*(\:|\%3a)[^\n]+' /logs/ /var/ /u01/ /data/ /webdata/ /usr/ibm/ 2>/dev/null )
SCRIPT+="\n"
SCRIPT+$(for i in $ZIPED; do zgrep -i -I '\(\$\|\%24\)\(\{\|\%7b\).*\(j\|J\|\%4A\|\%4a\|\%6A\|\%6a\).*' $i 2>/dev/null; echo "\n" ; done)
echo $HOSTNAME+"\n"+$SCRIPT
