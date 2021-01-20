# olefy - oletools verify over TCP socket

Small Python Daemon to use oletools over TCP sockets. Mainly to use oletools in [Rspamd](https://github.com/rspamd/rspamd).

Rspamd oletools plugin documentation: [Rspamd External Services - Oletools](https://rspamd.com/doc/modules/external_services.html#oletools-specific-details)

Some extra details you can find here in German language:

[Emotet mit Rspamd und Oletools bekämpfen](https://www.heinlein-support.de/blog/news/emotet-mit-rspamd-und-oletools-bekaempfen/)

[Emotet mit Rspamd und Oletools bekämpfen (Teil 2)](https://www.heinlein-support.de/blog/news/emotet-mit-rspamd-und-oletools-bekaempfen-teil-2/)

[Emotet mit Rspamd und Oletools bekämpfen – Emotet 2020 (Teil 3)](https://www.heinlein-support.de/blog/news/emotet-mit-rspamd-und-oletools-bekaempfen-emotet-2020-teil-3/)

[Emotet mit Rspamd und Oletools bekämpfen – die vielen kleinen Tricks (Teil 4)](https://www.heinlein-support.de/blog/news/emotet-mit-rspamd-und-oletools-bekaempfen-die-vielen-kleinen-tricks-teil-4/)

Or google translated here:

[Fight Emotet with Rspamd and Oletools](https://translate.google.com/translate?hl=en&sl=de&tl=en&u=https%3A%2F%2Fwww.heinlein-support.de%2Fblog%2Fnews%2Femotet-mit-rspamd-und-oletools-bekaempfen%2F)

[Fighting Emotet with Rspamd and Oletools (Part 2)](https://translate.google.com/translate?hl=en&sl=de&tl=en&u=https%3A%2F%2Fwww.heinlein-support.de%2Fblog%2Fnews%2Femotet-mit-rspamd-und-oletools-bekaempfen-teil-2%2F)

[Fight Emotet with Rspamd and Oletools - Emotet 2020 (Part 3)](https://translate.google.com/translate?hl=en&sl=de&tl=en&u=https://www.heinlein-support.de/blog/news/emotet-mit-rspamd-und-oletools-bekaempfen-emotet-2020-teil-3/)

[Fighting Emotet with Rspamd and Oletools - the many little tricks (part 4)](https://translate.google.com/translate?hl=en&sl=de&tl=en&u=https://www.heinlein-support.de/blog/news/emotet-mit-rspamd-und-oletools-bekaempfen-die-vielen-kleinen-tricks-teil-4/)

## State of Development

This Daemon is production tested but maybe not bug free. Feel free to test and
please report any issues.

## How it works

olefy expects office documents to be send to the TCP socket. Currently olefy saves
the stream into a tmp file, calls olevba3 and returns the scan result as json.

## Future plans

We realized our current approach is not flexible enough and future proof to add more features here.
We will create a more generic tool using generic protocols.

## oletools

[github: oletools - python tools to analyze MS OLE2 files](https://github.com/decalage2/oletools)

[http://www.decalage.info/python/oletools](http://www.decalage.info/python/oletools)

**As spammers are creating macro viruses which are trying to trick the current oletools releases into errors, we have created a little fork to add some cherry-picked patches and negotiate some errors faster than the oletools release cycle. Maybe have a look: [oletools - patched by Heinlein](https://github.com/HeinleinSupport/oletools)**

oletools is a package of python tools to analyze Microsoft OLE2 files (also called Structured Storage, Compound File Binary Format or Compound Document File Format), such as Microsoft Office documents or Outlook messages, mainly for malware analysis, forensics and debugging. It is based on the olefile parser. See [http://www.decalage.info/python/oletools](http://www.decalage.info/python/oletools) for more info.

# Default Installation

Python3 >= 3.6 is required for olefy.
Also oletools itself and some requirements will need Python3 >= 3.6 in near future.

## Install Python3 oletools and python-magic

-   use pip3, apt, yum, zypper or the source to install the Python3 version of oletools
-   for python-magic use `pip3 install python-magic` or be aware using a packet containing this project: [https://github.com/ahupp/python-magic](https://github.com/ahupp/python-magic). E.g. the Debian [python3-magic](https://packages.debian.org/stretch/python3-magic) is *NOT* working

## Install olefy

-   clone or download this repo
-   **add the user and group olefy** or edit olefy.service to use any other existing user/group
-   edit olefy.conf to fit your needs
    --> **The paths fit for Debian style systems and maybe not yours**
-   copy olefy.py daemon file to /usr/local/bin
-   copy olefy.conf to /etc
-   copy the systemd service file olefy.service to /etc/systemd/system
-   enable and unmask the Service
~~~
systemctl daemon-reload
systemctl unmask olefy.service
systemctl enable olefy.service
~~~

# Extended Installation

Only olefy depends on Python3 because we are using AsyncIO. If you like you can use the Python2 version, even the git version of oletools or a non-default python version. You only have to adjust the config.

Also you could start olefy.py standalone. Just edit the file directly and start it using the python3 interpreter.

# Settings

Have a look to the commented olefy.conf. Set OLEFY_LOGLVL to 10 to see all details including the Rspamd scanning id.

# Debugging

Set `OLEFY_LOGLVL=10` and have a look to the logs `journalctl -u olefy`

# Monitoring

You can monitor the olefy service is working with sending just a PING to the service. olefy will return with PONG

`echo PING | nc -q1 127.0.0.1 10050`

# License

Apache-2.0

# Author Information

*   **[Dennis Kalbhen](mailto:d.kalbhen@heinlein-support.de)** - [dns-kbn](https://github.com/dns-kbn)
*   **[Carsten Rosenberg](mailto:c.rosenberg@heinlein-support.de)** - [c-rosenberg](https://github.com/c-rosenberg)

~~~
Heinlein Support GmbH
Schwedter Str. 8/9b, 10119 Berlin

https://www.heinlein-support.de

Tel: +4930 / 405051-110

Amtsgericht Berlin-Charlottenburg - HRB 93818 B
Geschäftsführer: Peer Heinlein - Sitz: Berlin
~~~
