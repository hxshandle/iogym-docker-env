echo "初始化"

cd applications

git clone https://git.oschina.net/hxshandle/gymio-desktop-vue.git

git clone https://git.oschina.net/hxshandle/gym.git

echo "生成配置文件"
cp gym/.env.example gym/.env

echo "安装npm"
cd gymio-desktop-vue
npm i

echo "初始化结束"
