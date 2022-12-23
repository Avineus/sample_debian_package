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
