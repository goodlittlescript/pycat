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

Get a shell container. All you need is docker compose.

```shell
./Projectfile shell
```

Do development in the shell.

```shell
# run the utility
./bin/pycat <<<"success"

# run tests
./test/suite
```
