#!/bin/bash


modifyflutter(){
title1='<application android:requestLegacyExternalStorage="true" android:name="io.flutter.app.FlutterApplication" android:icon="@mipmap/ic_launcher" android:label="'
title2='" android:networkSecurityConfig="@xml/network_security_config" android:usesCleartextTraffic="true">'
#echo $title1
#echo $title2
title=$title1$1$title2
#echo $title
echo start create $1, please wait...
#title   important line need modify
sed -i "11c${title}" ./android/app/src/main/AndroidManifest.xml
#image
# cp -r ./resources/image/$1/icon/* ./android/app/src/main/res/
cp -r ./resources/image/$1/images/* ./assets/images/
cd ./ 
flutter pub run flutter_launcher_icons:main

#cp -r /home/rui/wang/image/$1/image/* /home/rui/mnt/mars/assets/images/2.0x/
#cp -r /home/rui/wang/image/$1/image/* /home/rui/mnt/mars/assets/images/3.0x/
#version
version='applicationId "com.'$1'.mnt"'
#echo $version
sed -i "41c${version}" ./android/app/build.gradle
#walletpath
walletpath="name: '"$1"',"
#echo $walletpath
sed -i "6c${walletpath}" ./lib/modules/wallet/domain/utils/wallet_path_utils.dart
#dpos
dpos='\"'$2'\";'
# echo dpos
sed -i "63c${dpos}" ./lib/modules/app/config/app_constants.dart
#Version download
dposname=${2:47:10}
download="return 'https://browser.metabasenet.site/api/download.html?language=\$lang&fruits="$dposname"';"
sed -i "35c${download}" ./lib/modules/app/config/app_links.dart
# echo $download
cd ./


# echo $dposname
#if ["$3" = '1']; then
flutter build apk --no-sound-null-safety
cp -r ./build/app/outputs/flutter-apk/app-release.apk ./RenameApp/$dposname.apk
#fi
}
mkdir RenameApp
modifyflutter Durian 20m07jr2smarkbab2bwatddzt56wd9sms0q2gkg2k3yhgnxby9mzrzbvc
modifyflutter Chestnut 20m0ek0kz2pdvvrmennmpp02pdpwbr1kfj8ayj2119v9vhnkdee9q2bga
modifyflutter Watermelon  20m0dygcs3mwznnqd4q2gfcp98x9905ape5sf3fj4cf4w4fy6xcspf2qg
modifyflutter Noni 20m02mzahhqfbj3zwke22w75r9vagwwmarr6e326mcgcz9zzk4z6m2e5p
modifyflutter Apple 20m06vp0mw0d4s6vvkc22nxv8kr7345156z07csnjj39x0pjc929mqc9c
modifyflutter Passionfruit 20m07m5nyy63ngawb76qhnts1xyfk9c3yc56sjv711vadnxq05m1gxy1t
modifyflutter Lemon  20m055bb12ymfr8v507vwxzyw82vf8fpnr8bx170axdp92cgrhwakytzm
modifyflutter Pitaya  20m025hsekz318z6bmbx8y78ks5n1x1tamd2sasq66xz04kqc1tdcxj6k
modifyflutter Longgan  20m08adse3nf5djdcve8bs9tbwnfttjsate2pjrsex880jhje35j110c4
modifyflutter Orange  20m09jjm09xf63f5g00wv4r33ajqbzetr0mffb4mqem581f6vck39eqn4

tar -zcvf RenameApp.zip ~/mnt/mars/RenameApp
cp -r ~/mnt/mars/RenameApp.zip ~/app_save/
scp ~/app_save/RenameApp.zip zdw@192.168.0.102:~/bak/app/
# scp ~/app_save/RenameApp.zip mnt-sh:~/bak
