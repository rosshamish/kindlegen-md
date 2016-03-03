kindlegen-md
------------

Shell script that:

* converts markdown files to ebook, and then
* sends them to your Kindle

Optionally adds a prefix to the filenames.

Tested on OS X.

### Installation

Requires pandoc and kindlegen.

If you have brew, do `$ brew install pandoc` to get pandoc. Otherwise, use another package manager or download it manually.

If you have brew and brew-cask, do `$ brew cask install kindlegen` to get kindlegen. Otherwise, download it from https://www.amazon.com/gp/feature.html?docId=1000765211 and put the executable in your PATH.

### Usage

This example assumes your Kindle is plugged in via USB and is mounted at `/Volumes/Kindle`.

Using tilde (`~`) won't work, use `$HOME` instead -- the script doesn't do tilde expansion.

```
$ sh ./kindlegen-md.sh --help
Usage: sh kindlegen-md.sh notes-dir kindle-volume [filename-prefix]

$ sh ./kindlegen-md.sh . .
...Sent README.md to ./documents/README.md.mobi
...Sent sample-note.md to ./documents/sample-note.md.mobi

$ sh ./kindlegen-md.sh $HOME/winter2016/ECE\ 315\ computer\ interfacing/notes /Volumes/Kindle
...Sent lec-02-24.md to /Volumes/Kindle/documents/lec-02-24.md.mobi
...Sent lec-02-26.md to /Volumes/Kindle/documents/lec-02-26.md.mobi
...Sent lec-01-13.txt to /Volumes/Kindle/documents/lec-01-13.txt.mobi
...Sent lec-01-20.txt to /Volumes/Kindle/documents/lec-01-20.txt.mobi
...Sent lec-01-22.txt to /Volumes/Kindle/documents/lec-01-22.txt.mobi

$ sh ./kindlegen-md.sh $HOME/winter2016/ECE\ 315\ computer\ interfacing/notes /Volumes/Kindle ECE315
...Sent lec-02-24.md to /Volumes/Kindle/documents/ECE315_lec-02-24.md.mobi
...Sent lec-02-26.md to /Volumes/Kindle/documents/ECE315_lec-02-26.md.mobi
...Sent lec-01-13.txt to /Volumes/Kindle/documents/ECE315_lec-01-13.txt.mobi
...Sent lec-01-20.txt to /Volumes/Kindle/documents/ECE315_lec-01-20.txt.mobi
...Sent lec-01-22.txt to /Volumes/Kindle/documents/ECE315_lec-01-22.txt.mobi
```
