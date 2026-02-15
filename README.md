CoderDojo Maldegem Scratch
==========================

Op [deze Gitlab Pages site](https://coderdojo-maldegem.gitlab.io/scratch/) of [deze Github Pages site](https://coderdojo-maldegem.github.io/scratch-tutorials/) komen Nederlandstalige leerpaden voor Scratch en uitleg voor het maken van spelletjes van de CoderDojo in Maldegem, België.

## bijdragen

Om de bronbestanden te bewerken en een commit voor te bereiden kan je bovenaan een "WebIDE" knop klikken op de Gitlab pagina.
Je kan je commit dan "opslaan" met een beschrijving op een nieuwe branch en vragen (met een *merge request*) een een maintainer om je wijzigingen toe te voegen aan de *main* branch.
Enkel maintainers kunnen de *main* branch rechtstreeks wijzigen.
Telkens als die verandert, zal Gitlab de markdown pagina's in html omzetten en hosten. Ook via Github gebeurt dit.

## benodigdheden voor op je computer te werken

* [python-markdown](https://python-markdown.github.io)
* [markdown-checklist](https://github.com/FND/markdown-checklist)
* [make](https://www.gnu.org/software/make)
* [sed](https://www.gnu.org/software/sed)
* [git-lfs](https://git-lfs.github.com)

Enkel als je de html pagina's plaatselijk wil genereren, heb de bovenstaande programma's nodig.

Merk op: elke regel die met "$" begint is een opdrachtregel (laat "$" weg).

```sh
$ git clone https://gitlab.com/coderdojo-maldegem/scratch.git
$ git lfs checkout
$ cd scratch
$ python -m venv venv
$ source venv/bin/activate
$ pip install markdown markdown-checklist
$ make
Running markdown_py on galgje/1/stap1.md galgje/1/stap1.html
...
$ python localServe.py public
```

De code in localServe.py zal proberen een Firefox venster te openen. Verander dit als je een andere browser wenst te gebruiken.

## inhoud

Terwijl ik meer opdrachten zal toevoegen zijn dit een paar verbeteringen waaraan ik denk:

* verbeteringen van de toegankelijkheid
* heldere taal en consistente terminologie
* meertaligheid
* breng opdrachten in verband met elkaar
* installatie van een service worker voor offline gebruik
* beschrijving van hoe je leermiddelen schrijft

## nieuwe hulpmiddelen

Bovendien kunnen de volgende hulpmiddelen toekomstig werk vergemakkelijken:

* pandoc sjablonen: zodat een opdracht in markdown kan geschreven worden en zowel geëxporteerd kan worden als pdf en in html
* scratch uitvoer bewerking: een shell script om gemakkelijker scripts in block syntax en benodigdheden uit een geëxporteerd project te halen
* een uitbreiding van python-markdown om the block code om te zetten in svg, en zo javascript DOM manipulatie overbodig te maken

