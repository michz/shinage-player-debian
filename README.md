Shinage Client for Debian
=========================

License
-------
MIT, see also file `LICENSE`.


Documentation
-------------

This (following) documentation is available in *German only*.



Installation (Debian)
---------------------

* Minimales Debian-System installieren.
  (Am besten den Experten-Installer verwenden.
   Es sollte keine Software vorausgewählt sein.)
* Als Benutzer `root`:
    * Git installieren:  
        `apt-get -y --no-install-recommends install git ca-certificates`
    * Repository klonen:  
        `git clone https://github.com/michz/shinage-player-debian.git`
    * Ins neue Verzeichnis wechseln:  
        `cd shinage-player-debian`
    * Installer-Skript ausführen:  
        `cd system/ && /bin/bash ./install-base.sh`
    * Neustarten:  
        `reboot`
* Nun sollte das Gerät direkt in die digitale Anzeige starten.



Offline-Benutzung
-----------------
* Der Betrieb ist komplett offline möglich.
* Einfach einen USB-Stick einstecken, auf dem *nur* die anzuzeigenden Inhalte
  im obersten Verzeichnis abgelegt sind.
* Enthält der USB-Stick im obersten Verzeichnis eine Datei mit dem exakten Namen
  `signage_ignore`, wird der USB-Stick ignoriert.
* TODO: Erklären, wie Anzeigedauer angepasst werden kann.


Diagnose
--------
Auf Port 80 lauscht ein Webserver (nginx),
der einfache Diagnosemöglichkeiten zur Verfügung stellt.
Der Benutzer `sign` hat das Passwort `signage`.


