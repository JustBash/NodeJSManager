reset

echo "NodeJSManager"
echo "By Justman10000"
sleep 1

reset

if ! [ -d /usr/local/node ]; then
    echo "It don't exist a NodeJS version!"
    exit 1
fi

echo "Wich version should be used?"

versions=(
    $(ls /usr/local/node | grep -oP '\d+\.\d+\.\d+' | sort -rV)
)

select version in "${versions[@]}"; do
    ln -fs /usr/local/node/v$version/bin/* /usr/bin
    break
done

reset

echo "DONE!"
echo "Version: $(node -v)"