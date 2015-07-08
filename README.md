# bash-modules

## Configuration

the following global variables should be defined for every script

* PROG_NAME
* PROG_DIR

## Guidelines

Every module must have an init() function checking or giving default values for needed global variables.

Every module should have an usage() function describing its usage and features.

## Modules

[async](./modules/async/README.md)

[cron](./modules/cron/README.md)

[fs](./modules/fs/README.md)

[http](./modules/http/README.md)

[io](./modules/io/README.md)

[mysql](./modules/mysql/README.md)

[pid](./modules/pid/README.md)

[queue](./modules/queue/README.md)

[sec](./modules/sec/README.md)

[string](./modules/string/README.md)

[varcheck](./modules/varcheck/README.md)