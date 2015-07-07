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

run_on_background

```bash
async.run_on_background my_script.sh
```

spawn_via_loop

```bash
async.spawn_via_loop
```

spawn_via_parallel

```bash
async.spawn_via_parallel
```


### cron

Crontab creation and editing.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

add_job

```bash
cron.add_job
```

remove_job

```bash
cron.remove_job
```

### fs

Filesystem common operations.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

cat

```bash
fs.cat
```

rm

```bash
fs.rm
```

rmdir

```bash
fs.rmdir
```

rmr

```bash
fs.rmr
```
cp

```bash
fs.cp
```

mv

```bash
fs.cp
```

cpr

```bash
fs.cpr
```

sort

```bash
fs.sort
```

uniq

```bash
fs.uniq
```

is_empty

```bash
fs.is_empty
```

is_not_empty

```bash
fs.is_not_empty
```

is_readable

```bash
fs.is_readable
```

is_writable

```bash
fs.is_writable
```

is_executable

```bash
fs.is_executable
```

is_file

```bash
fs.is_file
```

is_directory

```bash
fs.is_directory
```

exists

```bash
fs.exists
```

create_tmp_dir

```bash
fs.create_tmp_dir
```

delete_tmp_dir

```bash
fs.delete_tmp_dir
```

create_dir_tree

```bash
fs.create_dir_tree
```

create_dir_if_needed

```bash
fs.create_dir_if_needed
```

create_file

```bash
fs.create_file
```

create_app_file

```bash
fs.create_app_file
```

create_temp_file

```bash
fs.create_temp_file
```

prepend_line_to_file

```bash
fs.prepend_line_to_file
```

append_line_to_file

```bash
fs.append_line_to_file
```

delete_line_from_file

fs.delete_line_from_file
```bash
```

get_last_line_from_file

```bash
fs.get_last_line_from_file
```

get_first_line_from_file

```bash
fs.get_first_line_from_file
```

delete_first_line_from_file

```bash
fs.delete_first_line_from_file
```

delete_first_line_from_file_if_empty

```bash
fs.delete_first_line_from_file_if_empty
```

delete_last_line_from_file

```bash
fs.delete_last_line_from_file
```

line_in_file

```bash
fs.line_in_file
```

add_line_to_file_if_not_exist

```bash
fs.add_line_to_file_if_not_exist
```

newline_to_space

```bash
fs.newline_to_space
```

remove_empty_lines

```bash
fs.remove_empty_lines
```

trim

```bash
fs.trim
```

remove_all_whitespace

```bash
fs.remove_all_whitespace
```

count_lines

```bash
fs.count_lines
```

replace_in_file_recursively

```bash
fs.replace_in_file_recursively
```

replace_in_file

```bash
fs.replace_in_file
```

replace_in_same_file

```bash
fs.replace_in_same_file
```

replace_in_all_files

```bash
fs.replace_in_all_files
```

change_permission

```bash
fs.change_permission
```

executable_permission

```bash
fs.executable_permission
```

readable_permission

```bash
fs.readable_permission
```

group_own

```bash
fs.group_own
```

group_apache_own

```bash
fs.group_apache_own
```

### http

Restful operations, site download, etc.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

download

```bash
http.download
```

echo

```bash
http.echo
```

get

```bash
http.get
```

post

```bash
http.post
```

rest_get

```bash
http.rest_get
```

rest_post

```bash
http.rest_post
```

rest_put

```bash
http.rest_put
```

rest_delete

```bash
http.rest_delete
```

### io

Pipes, temp files and more.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

null

```bash
io.null
```

output

```bash
io.output
```

output_escape

```bash
io.output_escape
```

write

```bash
io.write
```

open

```bash
io.open
```

save

```bash
io.save
```

clear

```bash
io.clear
```

save_and_clear

```bash
io.save_and_clear
```

remove_temp_file

```bash
io.remove_temp_file
```

remove_temp_files

```bash
io.remove_temp_files
```

stdin_save

```bash
io.stdin_save
```

stdin_restore

```bash
io.stdin_restore
```

stdin_close

```bash
io.stdin_close
```

stdout_save

```bash
io.stdout_save
```

stdout

```bash
io.stdout
```

stderr_close

```bash
io.stderr_close
```

open

```bash
io.open
```

write_line

```bash
io.write_line
```

read_line

```bash
io.read_line
```

close

```bash
io.close
```

stdout_to_file

```bash
io.stdout_to_file
```

stderr_to_file

```bash
io.stderr_to_file
```

stderr_to_stdout

```bash
io.stderr_to_stdout
```

### mysql

#### Configuration

Mysql querying, import, export and 

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

exec_query

```bash
mysql.exec_query
```

exec_query_in_database

```bash
mysql.exec_query_in_database
```

exec_query_in_table

```bash
mysql.exec_query_in_table
```

dump

```bash
mysql.dump
```

upload

```bash
mysql.upload
```

create_database

```bash
mysql.create_database
```

remove_database

```bash
mysql.remove_database
```

remove_temp_files

```bash
mysql.remove_temp_files
```

dump_database

```bash
mysql.dump_database
```

dump_all_databases

```bash
mysql.dump_all_databases
```

restore_database

```bash
mysql.restore_database
```

insert_csv

```bash
mysql.insert_csv
```

### pid

Ipc management.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

delay

```bash
pid.delay
```

self

```bash
pid.self
```

last_run

```bash
pid.last_run
```

get

```bash
pid.get
```

kill_proc

```bash
pid.kill_proc
```

kill_self

```bash
pid.kill_self
```

store

```bash
pid.store
```

clear

```bash
pid.clear
```

lock

```bash
pid.lock
```

unlock

```bash
pid.unlock
```

### queue

Queue management.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

add_first

```bash
queue.add_first
```

add_last

```bash
queue.add_last
```

get_first

```bash
queue.get_first
```

get_last

```bash
queue.get_last
```

get

```bash
queue.get
```

remove_first

```bash
queue.remove_first
```

remove_last

```bash
queue.remove_last
```

clear

```bash
queue.clear
```

count

```bash
queue.count
```

### sec

Security module including key-gen and some other stuff

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

generate_key_pair

```bash
sec.generate_key_pair
```

create_keyring_dir

```bash
sec.create_keyring_dir
```

generate_protected_key_pair

```bash
sec.generate_protected_key_pair
```

check_keyring_dir

```bash
sec.check_keyring_dir
```

backup_keys

```bash
sec.backup_keys
```

restore_keys

```bash
sec.restore_keys
```

### string

Simple string manipulation.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

column

```bash
string.column
```

split_by

```bash
string.split_by
```

csv_column

```bash
string.csv_column
```

colons_to_spaces

```bash
string.colons_to_spaces
```

eol_to_spaces

```bash
string.eol_to_spaces
```

delete_spaces

```bash
string.delete_spaces
```

truncate_duplicate_spaces

```bash
string.truncate_duplicate_spaces
```

apostrophes_to_spaces

```bash
string.apostrophes_to_spaces
```

commas_to_spaces

```bash
string.commas_to_spaces
```

tabs_to_spaces

```bash
string.tabs_to_spaces
```

delete_edge_spaces

```bash
string.delete_edge_spaces
```

string_inside_quotes

```bash
string.string_inside_quotes
```

default_date_delimiter

```bash
string.default_date_delimiter
```

date_str

```bash
string.date_str
```

time_str

```bash
string.time_str
```

time_with_seconds_str

```bash
string.time_with_seconds_str
```

date_time_str

```bash
string.date_time_str
```

date_time_with_seconds_str

```bash
string.date_time_with_seconds_str
```

### varcheck

Check if variables are defined and/or not empty.

#### Configuration

The following global variabels should be set:

* VAR1
* VAR2

#### Functions

is_empty

```bash
varcheck.is_empty
```

is_not_empty

```bash
varcheck.is_not_empty
```

is_defined

```bash
varcheck.is_defined
```

is_not_defined

```bash
varcheck.is_not_defined
```
