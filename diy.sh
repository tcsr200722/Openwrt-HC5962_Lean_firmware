#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk.git package/mentohust
git clone https://github.com/BoringCat/luci-app-mentohust.git package/luci-app-mentohust
git clone https://github.com/rosywrt/luci-theme-rosy package/luci-theme-rosy
git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/openwrt-dev/po2lmo.git

device_name='HC5962'

wifi_name='HiWiFi'
theme_argon='https://github.com/sypopo/luci-theme-argon-mc.git'  # 主题地址
openClash_url='https://github.com/vernesong/OpenClash.git'       # OpenClash包地址 
lienol_url='https://github.com/Lienol/openwrt-package.git'       # Lienol 包地址
adguardhome_url='https://github.com/rufengsuixing/luci-app-adguardhome.git' # adguardhome 包地址

#插件源码
wifischedule_url='https://github.com/newkit/luci-app-wifischedule.git' # wifi计划插件地址
autoreboot_url='https://github.com/awesome-openwrt/luci-app-autoreboot.git' #高级重启插件地址
unblockmusic_url='https://github.com/maxlicheng/luci-app-unblockmusic.git' #网易云音乐解锁地址





wifischedule_url='https://github.com/newkit/luci-app-wifischedule.git' # wifi计划插件地址



#修改机器名称
echo "设置主机名"
sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate


echo "修改wifi名称"

sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh

 





pushd po2lmo
make && sudo make install
popd
./scripts/feeds update -a
./scripts/feeds install -a
