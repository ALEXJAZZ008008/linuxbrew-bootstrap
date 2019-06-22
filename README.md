# Introduction
This scripts help you to install Linuxbrew (http://linuxbrew.sh/)
without root privilleges in minimum linux environments.

# Requirements
Required packages below are checked on debian 9 of LXD default containers.
```
$ apt-get install make
$ apt-get install gcc
$ apt-get install libdata-dump-perl
```

# Install
1. Clone this repository to $WORK directory
2. run
   `$ ./run.sh $(pwd)`
3. If glibc will not install, patch with
   `brew edit glibc`
   replace
   `specs = Pathname.new(Utils.popen_read(ENV.cc, "-print-file-name=specs.orig").chomp)`
   with
   `specs = gcc_keg.lib/"gcc/x86_64-unknown-linux-gnu/#{gcc_keg.version}/specs.orig"`
or
   
2. If you can use wget in your environment, run  
   `$ ./download.sh`  
   , or you should run download.sh on another machine in which wget is installed, and copy them to $WORK directory.
3. Run `./install.sh` in $WORK directory.
4. Add a next line into your ~/.bash_profile  
   ```PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"```
5. Run `source ~/.bash_profile` or create a new session to enable PATH setting.

# Test
If you want to test `brew`, you can use 'hello' package:  
```
$ brew install hello
==> Downloading https://linuxbrew.bintray.com/bottles/hello-2.10.x86_64_linux.bottle.tar.gz  
######################################################################## 100.0%  
==> Pouring hello-2.10.x86_64_linux.bottle.tar.gz  
🍺  /home/test/.linuxbrew/Cellar/hello/2.10: 52 files, 595.6KB  

$ hello  
Hello, world!  
```

# Tips
- If there is no curl, set environment variable like:  
  `$ HOMEBREW_FORCE_BREWED_CURL=1 brew install hello`

# License
This scripts are distributed under the BSD 2-clause "Simplified" Lisence.
Please read LICENSE.txt for more details.  
LICENSE_for_install-linuxbrew.sh.txt is applied only for `install-linuxbrew.sh`.
