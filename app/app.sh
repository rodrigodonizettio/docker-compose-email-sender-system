#!/bin/sh

#PIP is a package manager
#BOTTLE is a WSGI (Web Server Gateway Interface) simple Web Micro-Framework
#PSYCOPG2 is a Postgres DB adapter
#REDIS is an in-memory data structure store, used as a Database, Cache and Message Broker 
pip install bottle==0.12.13 psycopg2==2.7.3.2 redis==2.10.5
python -u sender.py #Executing "sender.py" file with <-u> that forces STDOUT and STDERR to be unbuffered.