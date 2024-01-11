reset

echo "NodeJSManager"
echo "By Justman10000"
sleep 1

reset

if ! [ -d /usr/local/node ]; then
    echo "NodeJS is not installed!"
    exit 1
fi

echo "Wich version should be uninstalled?"

versions=(
    $(ls /usr/local/node | grep -oP '\d+\.\d+\.\d+' | sort -rV)
)

select version in $versions; do
    rm -r /usr/local/node/v$version

    break
done

bash version.sh