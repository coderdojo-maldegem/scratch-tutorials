CoderDojo Maldegem Scratch
==========================

[This Gitlab pages site](https://coderdojo-maldegem.gitlab.io/scratch/) and alternatively [this Github pages site](https://coderdojo-maldegem.github.io/scratch-tutorials/) will present Dutch Scratch tutorials and game creation challenges from our CoderDojo in Maldegem, Belgium.

## contributions

You can use the WebIDE button on the top of the Gitlab page to edit the source files online and prepare a commit, which you save on a new branch which you can then request to be merged into *main*.
Only maintainers can commit their changes upstream directly to *main*.
Github's and Gitlab's continuous integration tools have set a post-receive hook on that branch, so that the markdown sources will be converted to html with python-markdown (in a docker container on the cloud).
The resulting pages are then copied and hosted.

## development requisites

* [python-markdown](https://python-markdown.github.io)
* [markdown-checklist](https://github.com/FND/markdown-checklist)
* [make](https://www.gnu.org/software/make)
* [sed](https://www.gnu.org/software/sed)
* [git-lfs](https://git-lfs.github.com)

If you want to build the pages locally, you'll need the above programs.

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

## content

While I'll be adding more assignments, there are some improvements to the content I can think of:

* accessibility improvements
* language and terminology improvements
* multilingual interface
* crosslink assignments
* service worker for offline caching
* provide a guide for writing tutorials

## new tools

In addition, it may be helpful to create tools for future work:

* pandoc templates: so that a tutorial can be written in markdown and both be exported to pdf and html
* scratch export processing: a shell script to more easily get the code block syntax and requisites
* possibly create a python-markdown addon to in stead convert the block code to static svg (rather than modifying the DOM)

