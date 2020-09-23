import psycopg2
import redis
import json
from bottle import route, run, request

class Sender(Bottle):
  def __init__(self):
    super().__init__()
    self.route('/', method='POST', callback=self.send)
    self.queue = redis.StrictRedis(host='queue', port=6379, db=0)
    
    dataSource = 'dbname=email_sender user=postgres1 password=root host=db'
    self.conn = psycopg2.connect(dataSource)

  def register_message(self, subject, message):
    INSERT_SQL = 'insert into emails (subject, message) values (%s, %s)'

    cur = self.conn.cursor()
    cur.execute(INSERT_SQL, (subject, message))
    self.conn.commit()
    cur.close()

    msg = {'subject': subject, 'message': message}
    self.queue.rpush('sender', json.dumps(msg))
    print('Email was registered successfully!')

  def send():
    subject = request.forms.get('subject')
    message = request.forms.get('message')
    self.register_message(subject, message)
    return 'Email was queued successfully! Subject: {} - Message: {}'.format(subject, message)

#@route('/', method='POST')

if __name__ == '__main__':
  sender = Sender()
  sender.run(host='0.0.0.0', port=8080, debug=True)