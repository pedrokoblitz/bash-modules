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
```shell
async.run_on_background my_script.sh
```

async.spawn_via_loop

##### Usage
```shell
```

async.spawn_via_parallel

##### Usage
```shell
```

### backup

Backup files and folders.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

backup.files

##### Usage
```shell
```

backup.dirs

##### Usage
```shell
```

### cron

Crontab creation and editing.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

cron.add_job

##### Usage
```shell
```

cron.remove_job

##### Usage
```shell
```

### fs

Filesystem common operations.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

fs.cat

##### Usage
```shell
```

fs.rm

##### Usage
```shell
```

fs.rmdir

##### Usage
```shell
```

fs.rmr

##### Usage
```shell
```
fs.cp

##### Usage
```shell
```

fs.mv

##### Usage
```shell
```

fs.cpr

##### Usage
```shell
```

fs.sort

##### Usage
```shell
```

fs.uniq

##### Usage
```shell
```

fs.is_empty

##### Usage
```shell
```

fs.is_not_empty

##### Usage
```shell
```

fs.is_readable

##### Usage
```shell
```

fs.is_writable

##### Usage
```shell
```

fs.is_executable

##### Usage
```shell
```

fs.is_file

##### Usage
```shell
```

fs.is_directory

##### Usage
```shell
```

fs.exists

##### Usage
```shell
```

fs.create_tmp_dir

##### Usage
```shell
```

fs.delete_tmp_dir

##### Usage
```shell
```

fs.create_dir_tree

##### Usage
```shell
```

fs.create_dir_if_needed

##### Usage
```shell
```

fs.create_file

##### Usage
```shell
```

fs.create_app_file

##### Usage
```shell
```

fs.create_temp_file

##### Usage
```shell
```

fs.prepend_line_to_file

##### Usage
```shell
```

fs.append_line_to_file

##### Usage
```shell
```

fs.delete_line_from_file

##### Usage
```shell
```

fs.get_last_line_from_file

##### Usage
```shell
```

fs.get_first_line_from_file

##### Usage
```shell
```

fs.delete_first_line_from_file

##### Usage
```shell
```

fs.delete_first_line_from_file_if_empty

##### Usage
```shell
```

fs.delete_last_line_from_file

##### Usage
```shell
```

fs.line_in_file

##### Usage
```shell
```

fs.add_line_to_file_if_not_exist

##### Usage
```shell
```

fs.newline_to_space

##### Usage
```shell
```

fs.remove_empty_lines

##### Usage
```shell
```

fs.trim

##### Usage
```shell
```

fs.remove_all_whitespace

##### Usage
```shell
```

fs.count_lines

##### Usage
```shell
```

fs.replace_in_file_recursively

##### Usage
```shell
```

fs.replace_in_file

##### Usage
```shell
```

fs.replace_in_same_file

##### Usage
```shell
```

fs.replace_in_all_files

##### Usage
```shell
```

fs.change_permission

##### Usage
```shell
```

fs.executable_permission

##### Usage
```shell
```

fs.readable_permission

##### Usage
```shell
```

fs.group_own

##### Usage
```shell
```

fs.group_apache_own

##### Usage
```shell
```

### http

Restful operations, site download, etc.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

http.download

##### Usage
```shell
```

http.echo

##### Usage
```shell
```

http.get

##### Usage
```shell
```

http.post

##### Usage
```shell
```

http.rest_get

##### Usage
```shell
```

http.rest_post

##### Usage
```shell
```

http.rest_put

##### Usage
```shell
```

http.rest_delete

##### Usage
```shell
```

### io

Pipes, temp files and more.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

io.null

##### Usage
```shell
```

io.output

##### Usage
```shell
```

io.output_escape

##### Usage
```shell
```

io.write

##### Usage
```shell
```

io.open

##### Usage
```shell
```

io.save

##### Usage
```shell
```

io.clear

##### Usage
```shell
```

io.save_and_clear

##### Usage
```shell
```

io.remove_tmp_file

##### Usage
```shell
```

io.remove_tmp_files

##### Usage
```shell
```

io.stdin_save

##### Usage
```shell
```

io.stdin_restore

##### Usage
```shell
```

io.stdin_close

##### Usage
```shell
```

io.stdout_save

##### Usage
```shell
```

io.stdout

##### Usage
```shell
```

io.stderr_close

##### Usage
```shell
```

io.open

##### Usage
```shell
```

io.write_line

##### Usage
```shell
```

io.read_line

##### Usage
```shell
```

io.close

##### Usage
```shell
```

io.stdout_to_file

##### Usage
```shell
```

io.stderr_to_file

##### Usage
```shell
```

io.stderr_to_stdout

##### Usage
```shell
```

### mysql

#### Configuration

Mysql querying, import, export and backup.

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

mysql.exec_query

##### Usage
```shell
```

mysql.exec_query_in_database

##### Usage
```shell
```

mysql.exec_query_in_table

##### Usage
```shell
```

mysql.dump

##### Usage
```shell
```

mysql.upload

##### Usage
```shell
```

mysql.create_database

##### Usage
```shell
```

mysql.remove_database

##### Usage
```shell
```

mysql.remove_tmp_files

##### Usage
```shell
```

mysql.dump_database

##### Usage
```shell
```

mysql.dump_all_databases

##### Usage
```shell
```

mysql.restore_database

##### Usage
```shell
```

mysql.insert_csv

##### Usage
```shell
```

### pid

Pid management.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

pid.delay

##### Usage
```shell
```

pid.self

##### Usage
```shell
```

pid.last_run

##### Usage
```shell
```

pid.get

##### Usage
```shell
```

pid.kill_proc

##### Usage
```shell
```

pid.kill_self

##### Usage
```shell
```

pid.store

##### Usage
```shell
```

pid.clear

##### Usage
```shell
```

pid.lock

##### Usage
```shell
```

pid.unlock

##### Usage
```shell
```

### queue

Queue management.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

queue.add_first

##### Usage
```shell
```

queue.add_last

##### Usage
```shell
```

queue.get_first

##### Usage
```shell
```

queue.get_last

##### Usage
```shell
```

queue.get

##### Usage
```shell
```

queue.remove_first

##### Usage
```shell
```

queue.remove_last

##### Usage
```shell
```

queue.clear

##### Usage
```shell
```

queue.count

##### Usage
```shell
```

### sec

Security module including key-gen and some other stuff

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

sec.generate_key_pair

##### Usage
```shell
```

sec.create_keyring_dir

##### Usage
```shell
```

sec.generate_protected_key_pair

##### Usage
```shell
```

sec.check_keyring_dir

##### Usage
```shell
```

sec.backup_keys

##### Usage
```shell
```

sec.restore_keys

##### Usage
```shell
```

### ssh

Wrappers for ssh and scp

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

ssh.main

##### Usage
```shell
```

ssh.ssh

##### Usage
```shell
```
ssh.scp

##### Usage
```shell
```

### string

Simple string manipulation.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

string.column

##### Usage
```shell
```

string.split_by

##### Usage
```shell
```

string.csv_column

##### Usage
```shell
```

string.colons_to_spaces

##### Usage
```shell
```

string.eol_to_spaces

##### Usage
```shell
```

string.delete_spaces

##### Usage
```shell
```

string.truncate_duplicate_spaces

##### Usage
```shell
```

string.apostrophes_to_spaces

##### Usage
```shell
```

string.commas_to_spaces

##### Usage
```shell
```

string.tabs_to_spaces

##### Usage
```shell
```

string.delete_edge_spaces

##### Usage
```shell
```

string.string_inside_quotes

##### Usage
```shell
```

string.default_date_delimiter

##### Usage
```shell
```

string.date_str

##### Usage
```shell
```

string.time_str

##### Usage
```shell
```

string.time_with_seconds_str

##### Usage
```shell
```

string.date_time_str

##### Usage
```shell
```

string.date_time_with_seconds_str

##### Usage
```shell
```

### varcheck

Check if variables are defined and/or not empty.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

varcheck.is_empty

##### Usage
```shell
```

varcheck.is_not_empty

##### Usage
```shell
```

varcheck.is_defined

##### Usage
```shell
```

varcheck.is_not_defined

##### Usage
```shell
```
