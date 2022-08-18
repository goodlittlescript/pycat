pycat(1) -- POSIX cat in Python 3
================================================================

## SYNOPSIS

`pycat` [options] [FILES...]

## DESCRIPTION

The `cat` utility in ruby, per the [POSIX specification](http://pubs.opengroup.org/onlinepubs/000095399/utilities/cat.html).

## OPTIONS

These options control how `pycat` operates.

* `-u`:
  Unbuffer output.

## EXAMPLES

```bash
pycat > file <<DOC
content
DOC

pycat file
# content
```

## INSTALLATION

Add `pycat` to your PATH (or execute it directly).

## DEVELOPMENT

Clone repo, get a shell container.

```shell
./Projectfile shell
```

Do development in the shell. Use the Projectfile for common tasks.

```shell
# run the utility
./bin/pycat <<<"success"

# test
./Projectfile test

# lint
./Projectfile lint

# fix
./Projectfile fix
```
