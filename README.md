A tool that applies the [Black](https://github.com/psf/black) python source
code formatter to a single piece of python source code instead of a whole
file or project.

Usage
-----
``` schell script
$ pip install blacken_selection
$ blacken_selection -h
usage: Apply the black code formatter for a piece of python source code

positional arguments:
  SOURCE                The python source code to be formatted. If not
                        provided then source is read from stdin.

optional arguments:
  -h, --help            show this help message and exit
  -l LINE_LENGTH, --line-length LINE_LENGTH
                        How many characters per line to allow. [default: 88]
$ blacken_selection "def main(): pass"
def main():
    pass
```


Usage from PyCharm on linux
---------------------------
Unfortunately PyCharm External Tools cannot be used directly. The
$SelectedText$ macro passes the selection as a command line argument to the
tool but there is no way to properly quote a python string using double
quotes.

But there is a solution:
* Install the ```xclip``` command line tool, we will use it to grab the
code selection in PyCharm via the clipboard
* Install blacken_selection as described above
* Grab the simple shell script [blacken_selection_xclip.sh](https://raw.githubusercontent.com/gibizer/blacken_selection/master/blacken_selection_xclip.sh)

Setup ```blacken_selection_xclip.sh``` as an external tool in PyCharm:
```
File -> Settings -> Tools -> External Tools
```

Click the + icon to add a new external tool with the following values:
```
    Name: blacken
    Description: Blacken a piece of python code
    Program: <absolute path for your blacken_selection_xclip.sh>
    Arguments:
```
Select a piece of python source code in your editor and from the right click
context menu select:
```
External Tools -> blacken
```
