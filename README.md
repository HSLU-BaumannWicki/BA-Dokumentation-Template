| Travis CI                                             |
|-------------------------------------------------------|
| [![Build Status][travis-badge]][travis-url]           |

| Build History                                         |
|-------------------------------------------------------|
| [![Travis build history][travis-history]][travis-url] |

[travis-url]: https://travis-ci.org/HSLU-BaumannWicki/BA-Dokumentation-Template
[travis-badge]: https://travis-ci.org/HSLU-BaumannWicki/BA-Dokumentation-Template.svg?branch=master
[travis-history]: https://buildstats.info/travisci/chart/HSLU-BaumannWicki/BA-Dokumentation-Template?branch=master&includeBuildsFromPullRequest=false

# Bachelorarbeit Dokumentation Vorlage

# Travis CI/CD

## Anpassungen in .travis.yml
Ändere den Name von ```FILE_NAME``` auf dein Dokument:

```yaml
env:
  - FILE_NAME=NAME-DEINES-DOKUMENTS
```

## Warum die vielen ```tlmgr install```?
In einer ersten Version installierten wir die ganze TeXLive Suite für jeden Build. Dies hat jeweils um die zehn Minuten gedauert. Im Vergleich dazu lief der Build der Datei jeweils maximal eine Minute. Diese Diskrepanz wollten wir angehen. Daher installieren wir eine minimale Umgebung über das Installierskript ```texlive_install.sh```. Damit aber unser Build nicht failt, müssen wir alle fehlenden Packete (und deren Abhängigkeiten) nachinstallieren. Und dazu kommt noch, dass wir die LaTeX-Build Fähigkeit auf Travis hinaufsetzen, da TeX/LaTeX nicht offiziell unterstütz wird.

### Fehlerbehebung
Am einfachsten sucht man im tlmgr repository nach der fehlenden Datei/Packet und fügt danach das fehlende Packet zur ```tlmgr install``` Linie im Skript.

```bash
tlmgr search --global -all <filename here>*
```
```yaml
...
install:
  - 
  [...]
  - tlmgr install [...] new_package
...
```

## OAuth Token in Environment Variable in Travis

# PDF/A Compliance

## <Dateiname>.xmpdata

## Was hat es mit ""