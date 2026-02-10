CoderDojo Maldegem Scratch
==========================

[This site](https://coderdojo-maldegem.gitlab.io/scratch/) will present Dutch Scratch tutorials and game creation challenges from our CoderDojo in Eelko, Belgium.

Op [deze site](https://coderdojo-maldegem.gitlab.io/scratch/) komen Nederlandstalige leerpaden voor Scratch en uitleg voor het maken van spelletjes van de CoderDojo in Eelko, België.

## contributions - bijdragen

You can use the WebIDE button on the top of this page to edit the source files online and prepare a commit, which you save on a new branch which you can then request to be merged into *main*.
Only maintainers can commit their changes upstream directly to *main*.
Gitlab's continuous integration tool has set a post-receive hook on that branch, so that the markdown sources will be converted to html with python-markdown (in a docker container on the cloud).
The resulting pages are then copied and hosted.

Om de bronbestanden te bewerken en een commit voor te bereiden kan je bovenaan een "WebIDE" knop klikken.
Je kan je commit dan "opslaan" met een beschrijving op een nieuwe branch en vragen (met een *merge request*) een een maintainer om je wijzigingen toe te voegen aan de *main* branch.
Enkel maintainers kunnen de *main* branch rechtstreeks wijzigen.
Telkens als die verandert, zal Gitlab de markdown pagina's in html omzetten en hosten.

## requisites - benodigdheden

* [python-markdown](https://python-markdown.github.io)
* [make](https://www.gnu.org/software/make)
* [sed](https://www.gnu.org/software/sed)
* [git-lfs](https://git-lfs.github.com)

If you want to build the pages locally, you'll need the above programs.

Enkel als je de html pagina's plaatselijk wil genereren, heb de bovenstaande programma's nodig.

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
$ python -m http.server 8001 -b 127.0.0.1 &>/dev/null &
$ firefox 127.0.0.1:8001 &>/dev/null &
```

(Elke regel die met "$" begint is een opdrachtregel. Je moet waarschijnlijk in Windows `cmd.exe` gebruiken en `&>/dev/null` weglaten?)

## todo

### More content - meer inhoud

I have not committed to a specific framework so that content can be added before major design decisions are made.
This is just to see if anyone finds this assignment arrangement useful and if accessibility is effectively improved.

Ik heb me niet gebonden aan een specifiek raamwerk zodat de inhoud kan worden toegevoegd vooraleer belangrijke ontwerp keuzes gemakt worden.
Het is de bedoeling om te onderzoeken of deze voorstelling van de opdrachten de toegankelijkheid verbetert en of iemand er het nut van inziet.

While I'll be adding more assignments, there are some improvements to the content I can think of:

* accessibility improvements
* language and terminology improvements
* multilingual interface
* crosslink assignments
* service worker for offline caching
* provide a guide for writing tutorials

Terwijl ik meer opdrachten zal toevoegen zijn dit een paar verbeteringen waaraan ik denk:

* verbeteringen van de toegankelijkheid
* heldere taal en consistente terminologie
* meertaligheid
* breng opdrachten in verband met elkaar
* installatie van een service worker voor offline gebruik
* beschrijving van hoe je leermiddelen schrijft

### New content - nieuwe inhoud

In addition, it may be helpful to create tools for future work:

* pandoc templates: so that a tutorial can be written in markdown and both be exported to pdf and html
* scratch export processing: a shell script to more easily get the code block syntax and requisites
* possibly create a python-markdown addon to in stead convert the block code to static svg (rather than modifying the DOM)

Bovendien kunnen de volgende hulpmiddelen toekomstig werk vergemakkelijken:

* pandoc sjablonen: zodat een opdracht in markdown kan geschreven worden en zowel geëxporteerd kan worden als pdf en in html
* scratch uitvoer bewerking: een shell script om gemakkelijker scripts in block syntax en benodigdheden uit een geëxporteerd project te halen
* een uitbreiding van python-markdown om the block code om te zetten in svg, en zo javascript DOM manipulatie overbodig te maken
