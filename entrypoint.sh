#! /bin/sh

# Start cron (daemonizes by default)
cron

# Run services
exec /usr/bin/supervisord --nodaemon
