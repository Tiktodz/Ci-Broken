# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/Project-Fluid/manifest.git -b fluid-12.1 -g default,-mips,-darwin,-notdefault
git clone https://github.com/Tiktodz/local_manifest --depth 1 -b fluid .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch fluid_X00TD-userdebug
export TZ=Asia/Jakarta
#export SKIP_API_CHECKS=true
#export SELINUX_IGNORE_NEVERALLOWS=true
mka bacon -j8
# end
