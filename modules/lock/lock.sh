# ----------- 
if [ ! -e $lockfile ]; then
   trap "rm -f $lockfile; exit" INT TERM EXIT
   touch $lockfile
       
       # critical-section

   rm $lockfile
   trap - INT TERM EXIT
else
   echo "critical-section is already running"
fi

# ----------- 
if ( set -o noclobber; echo "$$" > "$lockfile") 2> /dev/null; 
then
   trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT

       # critical-section

   rm -f "$lockfile"
   trap - INT TERM EXIT
else
   echo "Failed to acquire lockfile: $lockfile." 
   echo "Held by $(cat $lockfile)"
fi

# ----------- 
rollback() {
   del_from_passwd $user
   if [ -e /home/$user ]; then
      rm -rf /home/$user
   fi
   exit
}

trap rollback INT TERM EXIT
add_to_passwd $user
cp -a /etc/skel /home/$user
chown $user /home/$user -R
trap - INT TERM EXIT
