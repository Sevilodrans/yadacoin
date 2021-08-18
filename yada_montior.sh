#/bin/bash -
# This script is intended to monitor /etc/yadacoin/yada_app.log
# for the string - StreamClosedError(real_error=self.error)
# if the string is present in the log the script will notify the user
# and then tell systemd to restart yadanode.service.
# - sevilodran

# log file location
# Set log file path
path="/etc/yadacoin/"

# Set log file name
log="yada_app.log"

# Set string (error message) for comparison
error="StreamClosedError(real_error=self.error)"

# Set syslog message
sysmsg="yadanode.service - $error"

# Notify the authorities if error happened
# mailx -s "error in messages file" your@emailaddress.com 

# define yada service for systemd
srvc="yadanode.service"

# use tail to follow (-f) number of lins (n) of zero
tail -fn0 $path$log | \
while read line ; 
    do
        echo "$line" | grep "$error" > /dev/null
        if [ $? = 0 ] ; 
            then
            logger "${sysmsg}"
            systemctl restart $srvc
        fi
    done