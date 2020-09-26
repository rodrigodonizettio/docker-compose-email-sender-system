docker-compose up -d #Start all "services" (containers) defined in docker-compose.yml file in <-d> Daemon mode (running in Background)
# docker-compose ps #List running "services" (containers) mapped in docker-compose.yml file

echo "Waiting Postgres be loaded"
sleep 5

# docker-compose exec db psql -U postgres -c "\l" #Run a command "\l" (list all databases) in "db" "service" (container)

echo "Starting to scale Worker service"
sleep 1

docker-compose scale worker=3 & #Creating/Scaling 3 instances of Worker service

docker-compose exec db psql -U postgres -f /scripts/check.sql #Run the /scripts/check.sql inside the container

docker-compose logs -f -t #Display Log output from the "services" (containers) where it <-f> Follow log output and show <-t> Timestamps