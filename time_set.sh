#!/bin/bash

timedatectl set-ntp false
date -s "$1"