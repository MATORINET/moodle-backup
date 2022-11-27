#!/bin/bash
mkdir -p /root/BACKUP/$(date +%d-%m-%y)
cd /var/www/
zip -r -9 /root/BACKUP/$(date +%d-%m-%y)/moodle-$(date +%d-%m-%y).zip moodle
zip -r -9 /root/BACKUP/$(date +%d-%m-%y)/moodledata-$(date +%d-%m-%y).zip moodledata -x "./moodledata/muc/" -x "./moodledata/localcache/" -x "./moodledata/sessions/" -x "./moodledata/trashdir/" -x "./moodledata/temp/" -x "./moodledata/lock/" -x "./moodledata/cache/"
mysqldump -u root -pPASSWORDMU moodle > /root/BACKUP/$(date +%d-%m-%y)/moodle-$(date +%d-%m-%y).sql
