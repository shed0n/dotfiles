
#!/bin/sh

path (){
echo -e ${PATH//:/\\n}
}

backup() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: backup <filename>"
        return 1
    fi
    cp -- "$1" "$1.bak"
}

# cop dir1 dir2
copy() {
    if [ "$#" -eq 2 ] && [ -d "$1" ]; then
        from="${1%/}"
        to="$2"
        command cp -r -- "$from" "$to"
    else
        command cp -- "$@"
    fi
}

#vpn_connect (){
#  echo "Connecting to Cisco AnyConnect VPN..."
#  ~/.cisco/certificates/client/vpn_connect.sh
#}

#vpn_disconnect (){
#  echo "Disconnecting Cisco AnyConnect VPN..."
#  sudo killall -SIGINT openconnect
#  sleep 5
#  resolvectl status vpn0
#  echo "VPN disconnected."
#}

#get_secret() {
#kubectl get secret $1 -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
#}

# hash
# hash() {
# echo -n "$1" | md5sum |awk '{print $1}'
# }

#cluster (){
# knife search node "tags:*$1*" |grep production -b2 |grep Name |awk '{print "matheus.guedes@"$NF}' |xargs csshy
#}

#show-node() {
#fqdn=$(ping -c1 $1 |grep PING |grep -oP '$DOMAIN' )
#knife node show $1.$fqdn `echo $@ |sed "s/^$1 //g"`
#}
