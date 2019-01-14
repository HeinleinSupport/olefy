# olefy - oletools verify over TCP socket

Small Python Daemon to use oletools over TCP sockets. Mainly to use oletools in [Rspamd](https://github.com/rspamd/rspamd).

## State of Development

This Daemon is production tested but maybe not bug free. Feel free to test and
please report any issues.

## How it works

olefy expects office documents to be send to the TCP socket. Currently olefy saves
the stream into a tmp file, calls olevba3 and returns the scan result as json.

## Future plans

Debug some issues and use oletools directly in olefy and scan inline.
Also olefy should rescan with rtfobj when olevba reports a RTF file.

## oletools

[github: oletools - python tools to analyze MS OLE2 files](https://github.com/decalage2/oletools)

[http://www.decalage.info/python/oletools](http://www.decalage.info/python/oletools)

oletools is a package of python tools to analyze Microsoft OLE2 files (also called Structured Storage, Compound File Binary Format or Compound Document File Format), such as Microsoft Office documents or Outlook messages, mainly for malware analysis, forensics and debugging. It is based on the olefile parser. See [http://www.decalage.info/python/oletools](http://www.decalage.info/python/oletools) for more info.

# Installation

Python3 >= 3.4 is required for olefy

## Install Python3 oletools and python-magic

-   use pip3, apt, yum, zypper or the source to install the oletools, python-magic
    and their requirements on your system

## Install olefy

-   clone or download this repo
-   (maybe add a user for olefy)
-   edit olefy.conf to fit your needs
-   copy olefy.py daemon file to /usr/local/bin
-   copy olefy.conf to /etc
-   create tmp directory as configured in olefy.conf
-   copy the systemd service file olefy.service to /etc/systemd/system
-   enable and unmask the Service
~~~
systemctl daemon-reload
systemctl unmask olefy.service
systemctl enable olefy.service
~~~

# License

Apache-2.0

# Author Information

~~~
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin

https://www.heinlein-support.de

Tel: 030 / 405051-10

Amtsgericht Berlin-Charlottenburg - HRB 93818 B
Geschäftsführer: Peer Heinlein - Sitz: Berlin
~~~
