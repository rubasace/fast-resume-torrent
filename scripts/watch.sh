#!/usr/bin/with-contenv sh

LOG_FILE=/logs/fast-resume.log

inotifywait -m /input -e create -e moved_to |
    while read path action file; do
        target=${path}${file}
        printf "\n########## [`date +%F`T`date +%T`] Started Processing \"${target}\" ##########\n"
	    /app/rtorrent_fast_resume.pl /data "${target}" "/output/__fast-resume__${file}"
	    printf "\n########## [`date +%F`T`date +%T`] Finished Processing \"${target}\" ##########\n"
	    sleep 1
    done