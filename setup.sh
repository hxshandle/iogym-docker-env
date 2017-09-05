echo "初始化"
cd applications
git clone https://git.oschina.net/hxshandle/gymio-desktop-vue.git
git clone https://git.oschina.net/hxshandle/gym.git
echo "生成配置文件"
cp gym/.env.example gym/.env
echo "改变日志存储权限"
chmod -R 777 gym/storage

read -p 'DB host address:' DB_HOST
DB_PORT_DEFAULT=3306
read -p 'DB port(default:3306):' DB_PORT
DB_PORT=${DB_PORT:-$DB_PORT_DEFAULT}
DB_SCHEMA_DEFAULT='iogym'
read -p 'DB schema(Default:iogym):' DB_SCHEMA
DB_SCHEMA=${DB_SCHEMA:-$DB_SCHEMA_DEFAULT}
while [[ -z $DB_ACCOUNT ]]; do
    read -p "DB account name:" DB_ACCOUNT
done
read -p "DB password:" DB_PASSWORD

echo "***************************"
echo "***************************"
list=(DB_HOST DB_PORT DB_SCHEMA DB_ACCOUNT DB_PASSWORD)
for M in "${list[@]}"; do
    keyIndent=$(printf '%-20s' "$M")
    printf "%s %s\n" "${keyIndent}" ${!M}
done
echo "***************************"
echo "***************************"



read -p "Confirm DB info (y/n):" CONFIRM_DB_INFO
CONFIRM_DB_INFO=${CONFIRM_DB_INFO:-"y"}
if [ $CONFIRM_DB_INFO = "y" ]; then
    echo 'yyyyyy'
else 
    echo 'nnnnnn'
fi


# echo "安装npm"
# cd gymio-desktop-vue
# npm i

# echo '建立nginx配置文件'

# cp ./nginx/sites/gym-dev.conf.example ./nginx/sites/gym-dev.conf
# cp ./nginx/sites/gym-device.conf.example ./nginx/sites/gym-device.conf

# echo "初始化结束"
