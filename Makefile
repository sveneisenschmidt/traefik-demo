?:
	# up        Starts all services
	#           (traefik, 2x web, 1x database, 1x cache)
	# stop      Stops all services
	# restart   Restarts all services
	# shell     Starts a bash shell inside docker, useful to 
	#           inspect DNS resolution and service registrations

up:
	@docker-compose up -d --remove-orphans

stop:
	@docker-compose stop

restart: stop up

shell:
	@docker-compose run --service-ports shell
