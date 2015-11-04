#!/bin/bash
cd /vagrant
screen -d -m bundle exec thin start -p 3000
