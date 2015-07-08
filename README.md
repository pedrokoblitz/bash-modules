# bash-modules

## Configuration

the following global variables should be defined for every script

* PROG_NAME
* PROG_DIR

## Guidelines

Every module must have an init() function checking or giving default values for needed global variables.

Every module should have an usage() function describing its usage and features.

## Modules

[async](./modules/async) [cron](./modules/cron) [fs](./modules/fs) [http](./modules/http) [io](./modules/io) [mysql](./modules/mysql) [pid](./modules/pid) [queue](./modules/queue) [sec](./modules/sec) [string](./modules/string) [varcheck](./modules/varcheck)