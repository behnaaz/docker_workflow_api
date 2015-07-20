#!/bin/bash
rake db:create
rake db:schema:load
bundle exec guard -p

