#!/bin/sh

SOUNDCLOUD=$1

# There's a Javascript function in the SoundCloud URL that has
# information like this:
# "urn":"soundcloud:users:149281773","username":"patzr radio",
# We need to pick out that number.

NUMBER=`curl --silent "$SOUNDCLOUD" | grep "soundcloud:users" | sed 's/.*"soundcloud:users://' | sed 's/".*//'`

RSS="https://feeds.soundcloud.com/users/soundcloud:users:${NUMBER}/sounds.rss"
echo $RSS
