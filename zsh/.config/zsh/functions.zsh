
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

# hash
# hash() {
# echo -n "$1" | md5sum |awk '{print $1}'
# }
