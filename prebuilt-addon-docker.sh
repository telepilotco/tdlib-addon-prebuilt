if ! [ -x "$(command -v apk)" ]; then
  export TZ=Europe/Berlin
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
  apt-get update
  apt-get install -y -q \
    python3 make cmake gcc g++ git
else
  apk update
  apk --no-cache add \
    python3 make cmake gcc g++ git
fi

cd rep/
rm -rf node_modules/
npm install -g node-gyp
npm install -g pnpm
pnpm install
ls -la node_modules
npm run build:gyp
cp -L build/Release/addon.node ./prebuilds/lib/addon.node

touch ./prebuilds/lib/info.txt
git rev-parse HEAD >> ./prebuilds/lib/info.txt
cd ./prebuilds/lib

ldd addon.node

sha256sum addon.node >> info.txt
cmake --version >> info.txt
gcc --version | grep -i gcc >> info.txt
getconf GNU_LIBC_VERSION 2>&1 >> info.txt || true; ldd --version 2>&1 >> info.txt || true
