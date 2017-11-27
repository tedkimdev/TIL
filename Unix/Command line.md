Command line
============

```
cd
ls
pwd

cd ..
cd .

pushd
popd

whatis mkdir

sudo ls

cat filea.txt fileb.txt
cat filea.txt fileb.txt > filec.txt
cat filea.txt fileb.txt >> filec.txt

cat -n filec.txt //line number

less filec.txt
less -N filec.txt
less -M filec.txt
less -NM filec.txt

less +/the filec.txt // serch "the"

less -M filea.txt fileb.txt filec.txt // :n -> next page, :p -> previous page, :e -> open file, :d -> remove 

head filec.txt
tail -n 5 filec.txt
wc filec.txt
wc -c filec.txt // -l : line, -w : word, -c : character

```

Listing files interlligently
-----------------------------
```
ls D*

ls *.md
ls *.txt *.xml
ls f*e*
ls *.{txt,xml,md}
ls *.txt *.xml *.md

ls file?.txt  // ? -> single character
//ex) filea.txt , fileb.txt

//Options for listing
ls -a // hidden files
ls -l // -l : show a long listing
ls -lh // -h : show file sizes in a way humans can understand
ls -S // -S : sorts files by size
ls -t // -t : sorts files by last modified time
ls -lS
ls -lrS // -r : reverse

```
