pycat(1) -- POSIX cat in Python 3
================================================================

## SYNOPSIS

`pycat` [options] [FILES...]

## DESCRIPTION

The `cat` utility in python, per the [POSIX specification](http://pubs.opengroup.org/onlinepubs/000095399/utilities/cat.html). Intended to be used as a single-file, no-dependency template for writing shell scripts.

## OPTIONS

These options control how `pycat` operates.

* `-u`:
  Unbuffer output.

* `-v`:
  Verbose output. Can be used multiple times. The log level may also be set the LOG_LEVEL env variable with standard log level names. Logging is not a part of the posix spec but was added as it is so frequently helpful.

## EXAMPLES

```bash
pycat > file <<DOC
content
DOC

pycat file
# content
```

## INSTALLATION

Add `pycat` to your PATH (or execute it directly). There are no additional dependencies.

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
