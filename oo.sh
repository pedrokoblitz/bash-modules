#!/bin/bash

# ---------------------------------------------------------------------------
# OO support functions
# Kludged by Pim van Riezen <pi@madscience.nl>
# ---------------------------------------------------------------------------
DEFCLASS=""
CLASS=""
THIS=0

class() {
  DEFCLASS="$1"
  eval CLASS_${DEFCLASS}_VARS=""
  eval CLASS_${DEFCLASS}_FUNCTIONS=""
}

func() {
  local varname="CLASS_${DEFCLASS}_FUNCTIONS"
  eval "$varname=\"\${$varname}$1 \""
}

loadfunc() {
  eval "funclist=\"\$CLASS_${CLASS}_FUNCTIONS\""
  for func in $funclist; do
    eval "${func}() { ${CLASS}::${func} \"\$*\"; return \$?; }"
  done
}

typeof() {
  eval echo \$TYPEOF_$1
}

new() {
  local class="$1"
  local cvar="$2"
  shift
  shift
  local id=$(uuidgen | tr A-F a-f | sed -e "s/-//g")
  eval TYPEOF_${id}=$class
  eval $cvar=$id
  local funclist
  eval "funclist=\"\$CLASS_${class}_FUNCTIONS\""
  for func in $funclist; do
    eval "${cvar}.${func}() { local t=\$THIS; THIS=$id; local c=\$CLASS; CLASS=$class; loadfunc; ${class}::${func} \"\$*\"; rt=\$?; CLASS=\$c; THIS=\$t; return $rt; }" 
  done
  eval "${cvar}.${class} \"\$*\" || true"
}

# ---------------------------------------------------------------------------
# Example code
# ---------------------------------------------------------------------------

# class definition
class Storpel
  func Storpel
  func print

# class implementation
Storpel::Storpel() {
  :
}

Storpel::print() { echo 'teste' }

# usage
new Storpel one "Storpilator 1000" Medium
new Storpel two
new Storpel three

two.setName "Storpilator 2000"
two.setQuality "Strong"

one.print
two.print
three.print

echo ""

echo "one: $one ($(typeof $one))"
echo "two: $two ($(typeof $two))"
echo "three: $three ($(typeof $two))"
