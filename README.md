# docker-compose-email-sender-system

### Project Description

The user can access the *"frontend"* service through [http://localhost](#). The form submition is redirected by NGINX to the Python backend application.

The backend *"app"* service connects to the Postgres *"db"* service and inserts the email data content (subject and message) into the emails table. Moreover, the *"app"* service sends the email to the queue application.

The Redis *"queue"* service receives the emails from the backend and just temporary stores the emails that are consumped by the workers applications.

The Python *"worker"* service simulates the enqueued emails consumption from *"queue" * service and do some prints in the container logs. This service is horizontally scaled, so it's possible to see during the project execution 3 workers being instantiated.

### Project Diagram

![](https://github.com/rodrigodonizettio/docker-compose-email-sender-system/blob/master/images/BLOCK-DIAGRAM_Project.png)