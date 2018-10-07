# ARM GCC Standalone Toolchain
## Geting the toolchain
Getting a standalone toolchain is easy. For Linux, run the following command
```
sh get_toolchain.sh
```
This will download the Linaro toolchain and extract it in the Linaro directory.
## Using the toolchain
To add the toolchain to the PATH for the working terminal session, run the following:
```
source add_toolchain_to_path.sh
```

Now you can use the toolchain. For instance, you can now run
```
arm-eabi-gcc
```
