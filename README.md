# pycat

The `cat` utility in python, per the [POSIX specification](http://pubs.opengroup.org/onlinepubs/000095399/utilities/cat.html).

## Development

Clone repo, build images, get a shell.

```bash
make images
make shell
```

Now in the shell develop, run tests, etc.

```bash
./bin/pycat <<<"success"
./test/suite
```

Back on the host, run tests.

```bash
make test
```

Package.

```bash
make artifacts
```
