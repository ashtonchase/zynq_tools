rm -f ./gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi.tar.*
mkdir Linaro
wget https://releases.linaro.org/components/toolchain/binaries/7.1-2017.08/arm-eabi/gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi.tar.xz
cd Linaro
tar -xvf ../gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi.tar.xz
cd ../
rm -f ./gcc-linaro-7.1.1-2017.08-x86_64_arm-eabi.tar.xz
