#!/bin/bash

yum list java*
yum -y install java-1.8.0-openjdk
java -version