# bash-modules

## Configuration

the following global variables should be defined for every script

* PROG_NAME
* PROG_DIR

## Guidelines

Every module must have an init() function checking or giving default values for needed global variables.

Every module should have an usage() function describing its usage and features.

## Modules

### async

Async operations.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

async.run_on_background

##### Usage

async.spawn_via_loop

##### Usage

async.spawn_via_parallel

##### Usage


### backup

Backup files and folders.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

backup.files

##### Usage

backup.dirs

##### Usage


### cron

Crontab creation and editing.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

cron.add_job

##### Usage

cron.remove_job

##### Usage


### fs

Filesystem common operations.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage

fs.<function>

##### Usage


### http

Restful operations, site download, etc.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

http.download

##### Usage

http.echo

##### Usage

http.get

##### Usage

http.post

##### Usage

http.rest_get

##### Usage

http.rest_post

##### Usage

http.rest_put

##### Usage

http.rest_delete

##### Usage


### io

Pipes, temp files and more.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage

io.<function>

##### Usage


### mysql

#### Configuration

Mysql querying, import, export and backup.

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage

mysql.<function>

##### Usage


### pid

Pid management.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage

pid.<function>

##### Usage


### queue

Queue management.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage

queue.<function>

##### Usage


### sec

Security module including key-gen and some other stuff

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

sec.<function>

##### Usage

sec.<function>

##### Usage

sec.<function>

##### Usage

sec.<function>

##### Usage

sec.<function>

##### Usage

sec.<function>

##### Usage

sec.<function>

##### Usage


### ssh

Wrappers for ssh and scp

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

ssh.<function>

##### Usage

ssh.<function>

##### Usage

ssh.<function>

##### Usage


### string

Simple string manipulation.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage

string.<function>

##### Usage


### varcheck

Check if variables are defined and/or not empty.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

varcheck.<function>

##### Usage

varcheck.<function>

##### Usage

varcheck.<function>

##### Usage

varcheck.<function>

##### Usage

