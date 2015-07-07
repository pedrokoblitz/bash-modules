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
```bash
async.run_on_background my_script.sh
```

async.spawn_via_loop

##### Usage
```bash
```

async.spawn_via_parallel

##### Usage
```bash
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
```bash
```

backup.dirs

##### Usage
```bash
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
```bash
```

cron.remove_job

##### Usage
```bash
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
```bash
```

fs.rm

##### Usage
```bash
```

fs.rmdir

##### Usage
```bash
```

fs.rmr

##### Usage
```bash
```
fs.cp

##### Usage
```bash
```

fs.mv

##### Usage
```bash
```

fs.cpr

##### Usage
```bash
```

fs.sort

##### Usage
```bash
```

fs.uniq

##### Usage
```bash
```

fs.is_empty

##### Usage
```bash
```

fs.is_not_empty

##### Usage
```bash
```

fs.is_readable

##### Usage
```bash
```

fs.is_writable

##### Usage
```bash
```

fs.is_executable

##### Usage
```bash
```

fs.is_file

##### Usage
```bash
```

fs.is_directory

##### Usage
```bash
```

fs.exists

##### Usage
```bash
```

fs.create_tmp_dir

##### Usage
```bash
```

fs.delete_tmp_dir

##### Usage
```bash
```

fs.create_dir_tree

##### Usage
```bash
```

fs.create_dir_if_needed

##### Usage
```bash
```

fs.create_file

##### Usage
```bash
```

fs.create_app_file

##### Usage
```bash
```

fs.create_temp_file

##### Usage
```bash
```

fs.prepend_line_to_file

##### Usage
```bash
```

fs.append_line_to_file

##### Usage
```bash
```

fs.delete_line_from_file

##### Usage
```bash
```

fs.get_last_line_from_file

##### Usage
```bash
```

fs.get_first_line_from_file

##### Usage
```bash
```

fs.delete_first_line_from_file

##### Usage
```bash
```

fs.delete_first_line_from_file_if_empty

##### Usage
```bash
```

fs.delete_last_line_from_file

##### Usage
```bash
```

fs.line_in_file

##### Usage
```bash
```

fs.add_line_to_file_if_not_exist

##### Usage
```bash
```

fs.newline_to_space

##### Usage
```bash
```

fs.remove_empty_lines

##### Usage
```bash
```

fs.trim

##### Usage
```bash
```

fs.remove_all_whitespace

##### Usage
```bash
```

fs.count_lines

##### Usage
```bash
```

fs.replace_in_file_recursively

##### Usage
```bash
```

fs.replace_in_file

##### Usage
```bash
```

fs.replace_in_same_file

##### Usage
```bash
```

fs.replace_in_all_files

##### Usage
```bash
```

fs.change_permission

##### Usage
```bash
```

fs.executable_permission

##### Usage
```bash
```

fs.readable_permission

##### Usage
```bash
```

fs.group_own

##### Usage
```bash
```

fs.group_apache_own

##### Usage
```bash
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
```bash
```

http.echo

##### Usage
```bash
```

http.get

##### Usage
```bash
```

http.post

##### Usage
```bash
```

http.rest_get

##### Usage
```bash
```

http.rest_post

##### Usage
```bash
```

http.rest_put

##### Usage
```bash
```

http.rest_delete

##### Usage
```bash
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
```bash
```

io.output

##### Usage
```bash
```

io.output_escape

##### Usage
```bash
```

io.write

##### Usage
```bash
```

io.open

##### Usage
```bash
```

io.save

##### Usage
```bash
```

io.clear

##### Usage
```bash
```

io.save_and_clear

##### Usage
```bash
```

io.remove_tmp_file

##### Usage
```bash
```

io.remove_tmp_files

##### Usage
```bash
```

io.stdin_save

##### Usage
```bash
```

io.stdin_restore

##### Usage
```bash
```

io.stdin_close

##### Usage
```bash
```

io.stdout_save

##### Usage
```bash
```

io.stdout

##### Usage
```bash
```

io.stderr_close

##### Usage
```bash
```

io.open

##### Usage
```bash
```

io.write_line

##### Usage
```bash
```

io.read_line

##### Usage
```bash
```

io.close

##### Usage
```bash
```

io.stdout_to_file

##### Usage
```bash
```

io.stderr_to_file

##### Usage
```bash
```

io.stderr_to_stdout

##### Usage
```bash
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
```bash
```

mysql.exec_query_in_database

##### Usage
```bash
```

mysql.exec_query_in_table

##### Usage
```bash
```

mysql.dump

##### Usage
```bash
```

mysql.upload

##### Usage
```bash
```

mysql.create_database

##### Usage
```bash
```

mysql.remove_database

##### Usage
```bash
```

mysql.remove_tmp_files

##### Usage
```bash
```

mysql.dump_database

##### Usage
```bash
```

mysql.dump_all_databases

##### Usage
```bash
```

mysql.restore_database

##### Usage
```bash
```

mysql.insert_csv

##### Usage
```bash
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
```bash
```

pid.self

##### Usage
```bash
```

pid.last_run

##### Usage
```bash
```

pid.get

##### Usage
```bash
```

pid.kill_proc

##### Usage
```bash
```

pid.kill_self

##### Usage
```bash
```

pid.store

##### Usage
```bash
```

pid.clear

##### Usage
```bash
```

pid.lock

##### Usage
```bash
```

pid.unlock

##### Usage
```bash
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
```bash
```

queue.add_last

##### Usage
```bash
```

queue.get_first

##### Usage
```bash
```

queue.get_last

##### Usage
```bash
```

queue.get

##### Usage
```bash
```

queue.remove_first

##### Usage
```bash
```

queue.remove_last

##### Usage
```bash
```

queue.clear

##### Usage
```bash
```

queue.count

##### Usage
```bash
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
```bash
```

sec.create_keyring_dir

##### Usage
```bash
```

sec.generate_protected_key_pair

##### Usage
```bash
```

sec.check_keyring_dir

##### Usage
```bash
```

sec.backup_keys

##### Usage
```bash
```

sec.restore_keys

##### Usage
```bash
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
```bash
```

ssh.ssh

##### Usage
```bash
```
ssh.scp

##### Usage
```bash
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
```bash
```

string.split_by

##### Usage
```bash
```

string.csv_column

##### Usage
```bash
```

string.colons_to_spaces

##### Usage
```bash
```

string.eol_to_spaces

##### Usage
```bash
```

string.delete_spaces

##### Usage
```bash
```

string.truncate_duplicate_spaces

##### Usage
```bash
```

string.apostrophes_to_spaces

##### Usage
```bash
```

string.commas_to_spaces

##### Usage
```bash
```

string.tabs_to_spaces

##### Usage
```bash
```

string.delete_edge_spaces

##### Usage
```bash
```

string.string_inside_quotes

##### Usage
```bash
```

string.default_date_delimiter

##### Usage
```bash
```

string.date_str

##### Usage
```bash
```

string.time_str

##### Usage
```bash
```

string.time_with_seconds_str

##### Usage
```bash
```

string.date_time_str

##### Usage
```bash
```

string.date_time_with_seconds_str

##### Usage
```bash
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
```bash
```

varcheck.is_not_empty

##### Usage
```bash
```

varcheck.is_defined

##### Usage
```bash
```

varcheck.is_not_defined

##### Usage
```bash
```
