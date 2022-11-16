# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Project-Xtended/manifest.git -b xt -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b xr .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch xtended_X00TD-userdebug
export TZ=Asia/Jakarta
#export ALLOW_MISSING_DEPENDENCIES=true
#export SELINUX_IGNORE_NEVERALLOWS=true
make bacon -j8
# end1
