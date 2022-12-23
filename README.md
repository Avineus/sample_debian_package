# sample_debian_package



- Write your source with Makefile

- Add basic debian files
  * changelog
  * control
  * compat
  * install
  * postinst
  * rules

- In rules you can override default by adding dh_override_xyz

To build debian package

* dh build
* dh clean
* dpkg-buildpackage

On below error , then ignore sign
dpkg-buildpackage: error: failed to sign .dsc file
* dpkg-buildpackage  --no-sign


The output of debian build will at immediate parent dir
~/sample_debian_package$ ls -l ../
../sample-debian-pkg-dbgsym_1.0_amd64.ddeb
../sample-debian-pkg_1.0.dsc
../sample-debian-pkg_1.0.tar.gz
../sample-debian-pkg_1.0_amd64.buildinfo
../sample-debian-pkg_1.0_amd64.changes
../sample-debian-pkg_1.0_amd64.deb


Some dpkg commands

*$ dpkg -c ../sample-debian-pkg_1.0_amd64.deb 
drwxr-xr-x root/root         0 2022-12-20 23:19 ./
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/lib/
-rw-r--r-- root/root      5280 2022-12-20 23:19 ./usr/lib/sample.so
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/sbin/
-rwxr-xr-x root/root      6136 2022-12-20 23:19 ./usr/sbin/sample.exe
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/share/
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/share/doc/
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/share/doc/sample-debian-pkg/
-rw-r--r-- root/root       147 2022-12-20 23:19 ./usr/share/doc/sample-debian-pkg/changelog.gz


*$ dpkg -I ../sample-debian-pkg_1.0_amd64.deb 
 new Debian package, version 2.0.
 size 3172 bytes: control archive=564 bytes.
     207 bytes,     8 lines      control              
     185 bytes,     3 lines      md5sums              
      85 bytes,     4 lines   *  postinst             
 Package: sample-debian-pkg
 Version: 1.0
 Architecture: amd64
 Maintainer: Avineus <antony.rheneus@gmail.com>
 Installed-Size: 22
 Section: unknown
 Priority: optional
 Description: sample debian packaging example


*$ dpkg -i ../sample-debian-pkg_1.0_amd64.deb
--- Installs

*$ dpkg -x ../sample-debian-pkg_1.0_amd64.deb .
--- extracts without installation




# Using ar archive extraction.

$ ar -x ../sample-debian-pkg_1.0_amd64.deb 

        build/
>>>     control.tar.xz
>>>     data.tar.xz
        debian/.debhelper/
        debian/debhelper-build-stamp
        debian/files
        debian/sample-debian-pkg.substvars
        debian/sample-debian-pkg/


$ tar tvJf control.tar.xz
drwxr-xr-x root/root         0 2022-12-20 23:19 ./
-rw-r--r-- root/root       207 2022-12-20 23:19 ./control
-rw-r--r-- root/root       185 2022-12-20 23:19 ./md5sums
-rwxr-xr-x root/root        85 2022-12-20 23:19 ./postinst

$ tar tvJf data.tar.xz 
drwxr-xr-x root/root         0 2022-12-20 23:19 ./
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/lib/
-rw-r--r-- root/root      5280 2022-12-20 23:19 ./usr/lib/sample.so
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/sbin/
-rwxr-xr-x root/root      6136 2022-12-20 23:19 ./usr/sbin/sample.exe
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/share/
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/share/doc/
drwxr-xr-x root/root         0 2022-12-20 23:19 ./usr/share/doc/sample-debian-pkg/
-rw-r--r-- root/root       147 2022-12-20 23:19 ./usr/share/doc/sample-debian-pkg/changelog.gz

