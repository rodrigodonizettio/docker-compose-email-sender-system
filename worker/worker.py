import redis
import json
from time import sleep
from random import randint

if __name__ == '__main__':
  r = redis.Redis(host='queue', port=6379, db=0)

  while True:
    email = json.loads(r.blpop('sender')[1])
    print('Sending the email: ', email['subject'])
    sleep(randint(15, 45))
    print('Email ' email['subject'], 'was sent!')