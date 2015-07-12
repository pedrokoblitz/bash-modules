# bash-modules

## Inspired by
* [Defensive BASH Programming](http://www.kfirlavi.com/blog/2012/11/14/defensive-bash-programming/)
* [Writing Robust Bash Shell Scripts](http://www.davidpashley.com/articles/writing-robust-shell-scripts/)

## Configuration

the following global variables should be defined for every script

* PROG_NAME
* PROG_DIR

## Guidelines

Every module must have an init() function checking or giving default values for needed global variables.

Every module should have an usage() function describing its usage and features.

## Modules

[async](./modules/async) [fs](./modules/fs) [http](./modules/http) [io](./modules/io) [mysql](./modules/mysql) [pid](./modules/pid) [queue](./modules/queue) [sec](./modules/sec) [string](./modules/string) [varcheck](./modules/varcheck)