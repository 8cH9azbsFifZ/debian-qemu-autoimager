# debian-qemu-autoimager

# Using the script
- Run imager: `./build_qemu_debian_image.sh`
- Find password in build.*/logfile for root
- Start the machine ``` qemu-system-x86_64 -hda debian.qcow -m 512 -nographic ```

# Docs
- Port webserver for installation: 4321

# Preparation
- `brew install qemu`

# References
- Original script sources: [Blog](https://sigmaris.info/blog/2019/04/automating-debian-install-qemu/) [Gist](https://gist.github.com/sigmaris/dc1883f782d1ff5d74252bebf852ec50)
