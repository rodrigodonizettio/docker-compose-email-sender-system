import psycopg2
from bottle import route, run, request

DNS = 'dbname=email_sender user=postgres host=db'
INSERT_SQL = 'insert into emails (subject, message) values (%s, %s)'

def register_message(subject, message):
  conn = psycopg2.connect(DNS)
  cur = conn.cursor()
  cur.execute(INSERT_SQL, (subject, message))
  conn.commit()
  cur.close()
  conn.close()
  print('Email was registered successfully!')

@route('/', method='POST')
def send():
  subject = request.forms.get('subject')
  message = request.forms.get('message')
  register_message(subject, message)
  return 'Email was queued! Subject: {} // Message: {}'.format(subject, message)

if __name__ == '__main__':
  run(host='0.0.0.0', port=8080, debug=True)