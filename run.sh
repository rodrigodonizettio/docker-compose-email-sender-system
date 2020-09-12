docker-compose up -d #Start all "services" (containers) defined in docker-compose.yml file in <-d> Daemon mode (running in Background)
# docker-compose ps #List running "services" (containers) mapped in docker-compose.yml file

echo "Waiting Postgres be loaded"
sleep 5

# docker-compose exec db psql -U postgres -c "\l" #Run a command "\l" (list all databases) in "db" "service" (container)
