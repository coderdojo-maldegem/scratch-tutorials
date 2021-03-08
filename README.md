CoderDojo Eeklo Scratch
=======================

[This site](https://cdjeeklo.gitlab.io/scratch/) will present Dutch Scratch tutorials and game creation challenges from our CoderDojo in Eelko, Belgium.

Op [deze site](https://cdjeeklo.gitlab.io/scratch/) komen Nederlandstalige leerpaden voor Scratch en uitleg voor het maken van spelletjes van de CoderDojo in Eelko, België.

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
$ git clone https://gitlab.com/cdjeeklo/scratch.git
$ git lfs checkout
$ cd scratch
$ make
Running markdown_py on galgje/1/stap1.md galgje/1/stap1.html
...
$ python -m http.server 8001 -b 127.0.0.1 &>/dev/null &
$ firefox 127.0.0.1:8001 &>/dev/null &
```

(Elke regel die met "$" begint is een opdrachtregel. Je moet waarschijnlijk in Windows `cmd.exe` gebruiken en `&>/dev/null` weglaten?)
