# yadacoin
The files found in this repository have been uploaded to help support the yadacoin blockchain node installs on ubuntu 18.04 +
If setup.sh is run on an ubuntu installation it will completely install a full yadacoin blockchain node. This node can be solo mined
or it can be setup as a mining pool with some configuration changes.

Yada monitor watches the yada app log file for potential errors that may stop the API response or a sync stop.
The monitor will use systemd to restart the yadanode.service which will rectify the issues in most instances.
