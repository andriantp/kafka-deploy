v1 = docker/v1-docker-compose.yml
# v2 = docker/v2-docker-compose.yml


systems:
	@echo "📋 prune systems"
	docker system prune -a -f

volumes:
	@echo "📋 prune volumes"
	docker volume prune -f
	rm -rf docker/kafka

up:
	@echo "🚀 Starting v1-up"
	mkdir docker/kafka
	chmod -R 777 docker/kafka
	docker compose -f $(v1) up --force-recreate -d --build

down:
	@echo "✅ v1-down"
	docker compose -f $(v1) down -v


# v2-up:clean
# 	@echo "🚀 Starting v2-up"
# 	docker compose -f $(v2) up --force-recreate -d --build

# v2-down:
# 	@echo "✅ v2-down"
# 	docker compose -f $(v2) down -v
# 	$(MAKE) clean
