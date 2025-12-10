.PHONY: help dev-up dev-down dev-logs dev-restart prod-up prod-down prod-logs prod-restart clean prisma-generate prisma-migrate prisma-studio install

# Default target
help:
	@echo "Expense Manager API - Makefile Commands"
	@echo ""
	@echo "Development Commands:"
	@echo "  make dev-up          - Start development environment with hot reload"
	@echo "  make dev-down        - Stop development environment"
	@echo "  make dev-logs        - View development logs"
	@echo "  make dev-restart     - Restart development environment"
	@echo ""
	@echo "Production Commands:"
	@echo "  make prod-up         - Start production environment"
	@echo "  make prod-down       - Stop production environment"
	@echo "  make prod-logs       - View production logs"
	@echo "  make prod-restart    - Restart production environment"
	@echo ""
	@echo "Database Commands:"
	@echo "  make prisma-generate - Generate Prisma Client"
	@echo "  make prisma-migrate  - Run database migrations"
	@echo "  make prisma-studio   - Open Prisma Studio"
	@echo ""
	@echo "Utility Commands:"
	@echo "  make install         - Install npm dependencies"
	@echo "  make clean           - Remove all containers, volumes, and images"
	@echo ""

# Development environment
dev-up:
	@echo "🚀 Starting development environment..."
	docker-compose -f docker-compose.dev.yml up -d
	@echo "✅ Development environment is running!"
	@echo "API: http://localhost:3000"

dev-down:
	@echo "🛑 Stopping development environment..."
	docker-compose -f docker-compose.dev.yml down
	@echo "✅ Development environment stopped!"

dev-logs:
	docker-compose -f docker-compose.dev.yml logs -f

dev-restart:
	@echo "🔄 Restarting development environment..."
	docker-compose -f docker-compose.dev.yml restart
	@echo "✅ Development environment restarted!"

# Production environment
prod-up:
	@echo "🚀 Starting production environment..."
	docker-compose up -d
	@echo "✅ Production environment is running!"
	@echo "API: http://localhost:3000"

prod-down:
	@echo "🛑 Stopping production environment..."
	docker-compose down
	@echo "✅ Production environment stopped!"

prod-logs:
	docker-compose logs -f

prod-restart:
	@echo "🔄 Restarting production environment..."
	docker-compose restart
	@echo "✅ Production environment restarted!"

# Database commands
prisma-generate:
	@echo "🔧 Generating Prisma Client..."
	npm run prisma:generate
	@echo "✅ Prisma Client generated!"

prisma-migrate:
	@echo "🔧 Running database migrations..."
	npm run prisma:migrate
	@echo "✅ Migrations completed!"

prisma-studio:
	@echo "🎨 Opening Prisma Studio..."
	npm run prisma:studio

# Utility commands
install:
	@echo "📦 Installing dependencies..."
	npm install
	@echo "✅ Dependencies installed!"

clean:
	@echo "🧹 Cleaning up Docker resources..."
	docker-compose -f docker-compose.dev.yml down -v --rmi all 2>/dev/null || true
	docker-compose down -v --rmi all 2>/dev/null || true
	@echo "✅ Cleanup complete!"
