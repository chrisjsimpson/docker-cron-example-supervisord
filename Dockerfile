FROM debian:buster-slim

RUN apt-get update && apt-get install -y \
  supervisor \
  cron

# Install crontab entry, and send its output to stdout
# This creates a symbolic link which points to pid 1, which is the process 
# launched by docker (and visible logs from docker logs -f) etc 

RUN ln -sf /proc/1/fd/1 /var/log/cron.log

# This crontab directs its stdout & stderror to the log file, which is visable in docker logs 
RUN echo "* * * * * echo `date` >> /var/log/cron.log 2>&1" > cronfile
# Actually install the cronfile
RUN crontab cronfile
RUN rm cronfile

#Supervisor config
USER root
COPY ./*conf /etc/supervisor/conf.d/

# Entrypoint script
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
