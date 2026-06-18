# INSTALLATION

This module requires the Boost C++ Libraries to be installed.
If they are not already installed prior to installing this Perl module,
the latest version will be downloaded and installed on your system
using the Alien::Boost::Headers module.

## Linux
If you prefer to install the headers using your OS package manager

### Debian

```
apt-get install libboost-graph-dev
```
or libboost-dev, libboost-all-dev

### Fedora

```
dnf install boost-devel
```

## MacOS

```
brew install boost
```

## Windows

Experimental: download either the source or the binaries from https://www.boost.org/releases
and then set the BOOST environment variable to the directory.
```Powershell
[Environment]::SetEnvironmentVariable("BOOST", "C:\boost_1_91_0", "User")
```
I haven't got a windows machine to test this out, so if please let me know how you get on with this.

## Source

You can download the source for free, at
https://www.boost.org/releases/

Remember to set the BOOST environment variable.

## Dependencies

You can install the Perl dependancies from the cpanfile using
```
cpanm -l $LOCAL_LIB --with-configure --installdeps .
export PERL5LIB=$LOCAL_LIB/lib/perl5
```

## Install the module

If your version of Boost is in an non-standard location,
set the BOOST environment variable
```
export BOOST=/path/to/boost
```
To Install this module, type the following:

   perl Makefile.PL
   make
   make test
   make install

Installation works as with any other CPAN distribution.

See also http://www.boost.org/libs/graph/doc/
