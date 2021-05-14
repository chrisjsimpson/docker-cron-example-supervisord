#! /bin/sh

# Start cron (daemonizes by default)
cron

# Run services
/usr/bin/supervisord --nodaemon
