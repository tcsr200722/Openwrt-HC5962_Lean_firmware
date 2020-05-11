#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
git clone https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk.git package/mentohust
git clone https://github.com/BoringCat/luci-app-mentohust.git package/luci-app-mentohust
git clone https://github.com/rosywrt/luci-theme-rosy package/luci-theme-rosy
git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/openwrt-dev/po2lmo.git

device_name='HC5962'

wifi_name='HiWiFi'






wifischedule_url='https://github.com/newkit/luci-app-wifischedule.git' # wifi计划插件地址



#修改机器名称
echo "设置主机名"
sed -i "s/OpenWrt/$device_name/g" package/base-files/files/bin/config_generate


echo "修改wifi名称"

sed -i "s/OpenWrt/$wifi_name/g" package/kernel/mac80211/files/lib/wifi/mac80211.sh


echo '添加wifi计划插件'
git clone $wifischedule_url package/lean/luci-app-wifischedule
echo 'CONFIG_PACKAGE_luci-app-wifischedule=y' >> .config



pushd po2lmo
make && sudo make install
popd
./scripts/feeds update -a
./scripts/feeds install -a
