# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/bananadroid/android_manifest.git -b 12 -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b banana .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch banana_X00TD-userdebug
export TZ=Asia/Jakarta
#export SKIP_API_CHECKS=true
#export SELINUX_IGNORE_NEVERALLOWS=true
make bacon -j8
# end
