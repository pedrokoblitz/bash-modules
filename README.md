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

##### Usage
```bash
async.run_on_background my_script.sh
```

spawn_via_loop

##### Usage
```bash
async.spawn_via_loop
```

spawn_via_parallel

##### Usage
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

##### Usage
```bash
cron.add_job
```

remove_job

##### Usage
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

##### Usage
```bash
fs.cat
```

rm

##### Usage
```bash
fs.rm
```

rmdir

##### Usage
```bash
fs.rmdir
```

rmr

##### Usage
```bash
fs.rmr
```
cp

##### Usage
```bash
fs.cp
```

mv

##### Usage
```bash
fs.cp
```

cpr

##### Usage
```bash
fs.cpr
```

sort

##### Usage
```bash
fs.sort
```

uniq

##### Usage
```bash
fs.uniq
```

is_empty

##### Usage
```bash
fs.is_empty
```

is_not_empty

##### Usage
```bash
fs.is_not_empty
```

is_readable

##### Usage
```bash
fs.is_readable
```

is_writable

##### Usage
```bash
fs.is_writable
```

is_executable

##### Usage
```bash
fs.is_executable
```

is_file

##### Usage
```bash
fs.is_file
```

is_directory

##### Usage
```bash
fs.is_directory
```

exists

##### Usage
```bash
fs.exists
```

create_tmp_dir

##### Usage
```bash
fs.create_tmp_dir
```

delete_tmp_dir

##### Usage
```bash
fs.delete_tmp_dir
```

create_dir_tree

##### Usage
```bash
fs.create_dir_tree
```

create_dir_if_needed

##### Usage
```bash
fs.create_dir_if_needed
```

create_file

##### Usage
```bash
fs.create_file
```

create_app_file

##### Usage
```bash
fs.create_app_file
```

create_temp_file

##### Usage
```bash
fs.create_temp_file
```

prepend_line_to_file

##### Usage
```bash
fs.prepend_line_to_file
```

append_line_to_file

##### Usage
```bash
fs.append_line_to_file
```

delete_line_from_file

##### Usage
fs.delete_line_from_file
```bash
```

get_last_line_from_file

##### Usage
```bash
fs.get_last_line_from_file
```

get_first_line_from_file

##### Usage
```bash
fs.get_first_line_from_file
```

delete_first_line_from_file

##### Usage
```bash
fs.delete_first_line_from_file
```

delete_first_line_from_file_if_empty

##### Usage
```bash
fs.delete_first_line_from_file_if_empty
```

delete_last_line_from_file

##### Usage
```bash
fs.delete_last_line_from_file
```

line_in_file

##### Usage
```bash
fs.line_in_file
```

add_line_to_file_if_not_exist

##### Usage
```bash
fs.add_line_to_file_if_not_exist
```

newline_to_space

##### Usage
```bash
fs.newline_to_space
```

remove_empty_lines

##### Usage
```bash
fs.remove_empty_lines
```

trim

##### Usage
```bash
fs.trim
```

remove_all_whitespace

##### Usage
```bash
fs.remove_all_whitespace
```

count_lines

##### Usage
```bash
fs.count_lines
```

replace_in_file_recursively

##### Usage
```bash
fs.replace_in_file_recursively
```

replace_in_file

##### Usage
```bash
fs.replace_in_file
```

replace_in_same_file

##### Usage
```bash
fs.replace_in_same_file
```

replace_in_all_files

##### Usage
```bash
fs.replace_in_all_files
```

change_permission

##### Usage
```bash
fs.change_permission
```

executable_permission

##### Usage
```bash
fs.executable_permission
```

readable_permission

##### Usage
```bash
fs.readable_permission
```

group_own

##### Usage
```bash
fs.group_own
```

group_apache_own

##### Usage
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

##### Usage
```bash
http.download
```

echo

##### Usage
```bash
http.echo
```

get

##### Usage
```bash
http.get
```

post

##### Usage
```bash
http.post
```

rest_get

##### Usage
```bash
http.rest_get
```

rest_post

##### Usage
```bash
http.rest_post
```

rest_put

##### Usage
```bash
http.rest_put
```

rest_delete

##### Usage
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

##### Usage
```bash
io.null
```

output

##### Usage
```bash
io.output
```

output_escape

##### Usage
```bash
io.output_escape
```

write

##### Usage
```bash
io.write
```

open

##### Usage
```bash
io.open
```

save

##### Usage
```bash
io.save
```

clear

##### Usage
```bash
io.clear
```

save_and_clear

##### Usage
```bash
io.save_and_clear
```

remove_temp_file

##### Usage
```bash
io.remove_temp_file
```

remove_temp_files

##### Usage
```bash
io.remove_temp_files
```

stdin_save

##### Usage
```bash
io.stdin_save
```

stdin_restore

##### Usage
```bash
io.stdin_restore
```

stdin_close

##### Usage
```bash
io.stdin_close
```

stdout_save

##### Usage
```bash
io.stdout_save
```

stdout

##### Usage
```bash
io.stdout
```

stderr_close

##### Usage
```bash
io.stderr_close
```

open

##### Usage
```bash
io.open
```

write_line

##### Usage
```bash
io.write_line
```

read_line

##### Usage
```bash
io.read_line
```

close

##### Usage
```bash
io.close
```

stdout_to_file

##### Usage
```bash
io.stdout_to_file
```

stderr_to_file

##### Usage
```bash
io.stderr_to_file
```

stderr_to_stdout

##### Usage
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

##### Usage
```bash
mysql.exec_query
```

exec_query_in_database

##### Usage
```bash
mysql.exec_query_in_database
```

exec_query_in_table

##### Usage
```bash
mysql.exec_query_in_table
```

dump

##### Usage
```bash
mysql.dump
```

upload

##### Usage
```bash
mysql.upload
```

create_database

##### Usage
```bash
mysql.create_database
```

remove_database

##### Usage
```bash
mysql.remove_database
```

remove_temp_files

##### Usage
```bash
mysql.remove_temp_files
```

dump_database

##### Usage
```bash
mysql.dump_database
```

dump_all_databases

##### Usage
```bash
mysql.dump_all_databases
```

restore_database

##### Usage
```bash
mysql.restore_database
```

insert_csv

##### Usage
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

##### Usage
```bash
pid.delay
```

self

##### Usage
```bash
pid.self
```

last_run

##### Usage
```bash
pid.last_run
```

get

##### Usage
```bash
pid.get
```

kill_proc

##### Usage
```bash
pid.kill_proc
```

kill_self

##### Usage
```bash
pid.kill_self
```

store

##### Usage
```bash
pid.store
```

clear

##### Usage
```bash
pid.clear
```

lock

##### Usage
```bash
pid.lock
```

unlock

##### Usage
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

##### Usage
```bash
queue.add_first
```

add_last

##### Usage
```bash
queue.add_last
```

get_first

##### Usage
```bash
queue.get_first
```

get_last

##### Usage
```bash
queue.get_last
```

get

##### Usage
```bash
queue.get
```

remove_first

##### Usage
```bash
queue.remove_first
```

remove_last

##### Usage
```bash
queue.remove_last
```

clear

##### Usage
```bash
queue.clear
```

count

##### Usage
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

##### Usage
```bash
sec.generate_key_pair
```

create_keyring_dir

##### Usage
```bash
sec.create_keyring_dir
```

generate_protected_key_pair

##### Usage
```bash
sec.generate_protected_key_pair
```

check_keyring_dir

##### Usage
```bash
sec.check_keyring_dir
```

backup_keys

##### Usage
```bash
sec.backup_keys
```

restore_keys

##### Usage
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

##### Usage
```bash
string.column
```

split_by

##### Usage
```bash
string.split_by
```

csv_column

##### Usage
```bash
string.csv_column
```

colons_to_spaces

##### Usage
```bash
string.colons_to_spaces
```

eol_to_spaces

##### Usage
```bash
string.eol_to_spaces
```

delete_spaces

##### Usage
```bash
string.delete_spaces
```

truncate_duplicate_spaces

##### Usage
```bash
string.truncate_duplicate_spaces
```

apostrophes_to_spaces

##### Usage
```bash
string.apostrophes_to_spaces
```

commas_to_spaces

##### Usage
```bash
string.commas_to_spaces
```

tabs_to_spaces

##### Usage
```bash
string.tabs_to_spaces
```

delete_edge_spaces

##### Usage
```bash
string.delete_edge_spaces
```

string_inside_quotes

##### Usage
```bash
string.string_inside_quotes
```

default_date_delimiter

##### Usage
```bash
string.default_date_delimiter
```

date_str

##### Usage
```bash
string.date_str
```

time_str

##### Usage
```bash
string.time_str
```

time_with_seconds_str

##### Usage
```bash
string.time_with_seconds_str
```

date_time_str

##### Usage
```bash
string.date_time_str
```

date_time_with_seconds_str

##### Usage
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

##### Usage
```bash
varcheck.is_empty
```

is_not_empty

##### Usage
```bash
varcheck.is_not_empty
```

is_defined

##### Usage
```bash
varcheck.is_defined
```

is_not_defined

##### Usage
```bash
varcheck.is_not_defined
```
