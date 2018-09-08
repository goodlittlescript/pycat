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

Clone repo, build images.

```bash
make images
```

Run the utility, test, fix, and lint.

```bash
make run <<<"success"
make test fix lint
```

Get a shell for development.

```bash
make shell
# ./bin/pycat <<<"success"
# ./test/suite
```

Package.

```bash
make artifacts
```
