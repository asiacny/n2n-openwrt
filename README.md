# n2n
编译
---

   # 以 ar71xx 平台为例(使用ubuntu 14.04 x64系统）
   apt-get install -y screen subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext flex libssl-dev xsltproc wget git-core unzip quilt libxml-parser-perl mercurial bzr ecj cvs g++ libncurses5-dev zlib1g-dev bison flex unzip autoconf gawk make gettext gcc binutils patch bzip2 libz-dev asciidoc subversion sphinxsearch libtool sphinx-common libssl-dev libssl0.9.8 libc6:i386 libgcc1:i386 libstdc++5:i386 libstdc++6:i386
   wget https://downloads.openwrt.org/chaos_calmer/15.05.1/ar71xx/nand/OpenWrt-SDK-15.05.1-ar71xx-nand_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2
   
   tar xjf OpenWrt-SDK-15.05.1-ar71xx-nand_gcc-4.8-linaro_uClibc-0.9.33.2.Linux-x86_64.tar.bz2
   
   cd OpenWrt-SDK-ar71xx-*
   
   git clone https://github.com/asiacny/n2n.git package/n2n # 获取 Makefile
   
   make menuconfig # 选择要编译的包 Network -> VPN -> n2n/n2n_v2
   
   make package/n2n/compile V=99     # 开始编译
 
