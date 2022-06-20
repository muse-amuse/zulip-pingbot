# zulip-pingbot

Simple pingbot that notifies on zulip, if websites are down

## Setup

The pingbot runs on Heroku and pings the sites listed in `domains.txt` every 10 minutes. 

## Deploys

Every push to master will deploy a new version of this app. Deploys happen automatically - Heroku deploys are linked with GitHub.
