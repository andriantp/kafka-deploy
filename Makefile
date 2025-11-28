v1 = docker/v1-docker-compose.yml
v2 = docker/v2-docker-compose.yml

clean:
	@echo "📋 clean"
	docker system prune -a -f
	docker volume prune -f

v1-up:clean
	@echo "🚀 Starting v1-up"
	docker compose -f $(v1) up --force-recreate -d --build

v1-down:
	@echo "✅ v1-down"
	docker compose -f $(v1) down -v
	$(MAKE) clean

v2-up:clean
	@echo "🚀 Starting v2-up"
	docker compose -f $(v2) up --force-recreate -d --build

v2-down:
	@echo "✅ v2-down"
	docker compose -f $(v2) down -v
	$(MAKE) clean
