#!/usr/bin/with-contenv sh

inotifywait -m /input -e create -e moved_to |
    while read path action file; do
        target=${path}${file}
        temp=/tmp/${file}
        output=/output/__fast-resume__${file}
        printf "\n########## [`date +%F`T`date +%T`] Started Processing \"${target}\" ##########\n"
            /app/rtorrent_fast_resume.pl /data "${target}" "${temp}"
            printf "response code was $?"
            #printf "\n########## [`date +%F`T`date +%T`] Finished Processing \"${target}\" ########>
            sleep 1
    done