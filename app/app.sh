#!/bin/sh

#PIP is a package manager
#BOTTLE is a WSGI (Web Server Gateway Interface) simple Web Micro-Framework
#PSYCOPG2 is a Postgres DB adapter
pip install bottle==0.12.13 psycopg2==2.7.3.2
python -u sender.py #Executing "sender.py" file with <-u> that forces STDOUT and STDERR to be unbuffered.