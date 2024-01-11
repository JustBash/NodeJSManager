reset

echo "NodeJSManager"
echo "By Justman10000"
sleep 1

reset

echo "Wich version should be installed?"
sleep 1.5

versions=(
    "21.x"
    "20.x"
    "19.x"
    "18.x"
    "17.x"
    "16.x"
    "15.x"
    "14.x"
    "13.x"
    "12.x"
    "11.x"
    "10.x"
    "9.x"
    "8.x"
    "7.x"
    "6.x"
    "5.x"
    "4.x"
)

select version in "${versions[@]}"; do
    case $version in
        "21.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v21\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "20.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v20\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "19.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v19\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "18.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v18\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "17.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v17\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "16.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v16\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "15.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v15\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "14.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v14\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "13.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v13\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "12.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v12\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "11.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v11\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "10.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v10\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "9.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v9\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "8.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v8\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "7.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v7\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "6.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v6\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "5.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v5\.\d+\.\d+' | sort -rV | head -n 1)
        ;;

        "4.x")
            version=$(curl -s https://nodejs.org/dist/ | grep -oP 'v4\.\d+\.\d+' | sort -rV | head -n 1)
        ;;
    esac

    if [ -d /usr/local/node/$version ]; then
        echo "This version is already installed!"
    else
        break
    fi
done

[ ! -d /usr/local/node ] && mkdir /usr/local/node

reset

wget https://nodejs.org/dist/$version/node-$version-linux-x64.tar.xz

# reset

if ! [ -f node-$version-linux-x64.tar.xz ]; then
    echo "Download failed"
    sleep 1
    echo "Abort"
    exit 1
fi

unxz *.xz
tar xvf *.tar
rm -r *.tar
mv node-$version-linux-x64 /usr/local/node/$version

reset

echo "Switch to the new installed version?"

options=(
    "Yes"
    "No"
)

select option in ${options[@]}; do
    case $1 in
        "Yes")
            ln -fs /usr/local/node/$version/bin/* /usr/bin
        ;;

        "No");;
    esac
done

if [[ $(echo $version | grep -oP 'v\d\d') -gt 14 ]]; then
    corepack enable
fi