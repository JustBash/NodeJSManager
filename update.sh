reset

echo "NodeJSManager"
echo "By Justman10000"
sleep 1

reset

version=$(curl -s https://nodejs.org/dist/ | grep -oP '\d+\.\d+\.\d+' | sort -rV | head -n 1)
oldVersion=$(node -v)
checkVersion=$(echo $version | grep -oP '\d\d')
usedGeneration=$(node -v | grep -oP '\d\d' | head -n 1)

if ! [ -d /usr/local/node ]; then
    echo "NodeJS is not installed!"
    exit 1
fi

if ! [ -d /usr/local/node/v$checkVersion* ]; then
    echo "It exists no a NodeJS version of the $checkVersion. generation"
fi

if [ $usedGeneration != $checkVersion ]; then
    echo "You use not the latest generation of NodeJS!"
    sleep 1
    echo "This Script only works with using the latest NodeJS generation"
    sleep 1
    echo "Used generation: $usedGeneration"
    echo "Latest generation: $checkVersion"

    exit 1
fi

if [[ $oldVersion != v$version ]]; then
    echo "Your NodeJS is outdated!"
    echo "Install the new version?"

    options=(
        "Yes"
        "No"
    )

    select option in "${options[@]}"; do
        case $option in
            "Yes")
                wget https://nodejs.org/dist/v$version/node-v$version-linux-x64.tar.xz
                unxz *.xz
                tar xvf *.tar
                rm -r *.tar
                mv node-v$version-linux-x64 /usr/local/node/v$version
                ln -fs /usr/local/node/v$version/bin/* /usr/bin
                corepack enable
            ;;

            "No")
                exit 0
            ;;
        esac

        break
    done

    echo "Uninstall the old version?"

    options=(
        "Yes"
        "No"
    )

    select option in $options; do
        case $option in
            "Yes")
                rm -r /usr/local/node/$oldVersion
            ;;

            "No")
                exit 0
            ;;
        esac
    done
else
    echo "You use the newest version!"
    exit
fi