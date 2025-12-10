# Expense Manager API

A comprehensive REST API for managing expenses with authentication, authorization, and analytics.

## Features

- 🔐 **Authentication & Authorization** - JWT-based user authentication
- 💰 **Expense Management** - Full CRUD operations for expenses
- 🏷️ **Category Management** - Organize expenses with custom categories
- 📊 **Dashboard Analytics** - Summary statistics, category breakdown, and trends
- 🗄️ **PostgreSQL Database** - Robust data storage with Prisma ORM
- 📝 **Structured Logging** - JSON-based logging with Winston for comprehensive request tracking
- 🐳 **Docker Support** - Easy deployment with Docker and Docker Compose

## Tech Stack

- **Node.js** & **Express.js** - Backend framework
- **Prisma** - Modern database ORM
- **PostgreSQL** - Database
- **JWT** - Authentication
- **Docker** - Containerization

## Getting Started

### Prerequisites

- Node.js 20+
- Docker & Docker Compose
- PostgreSQL (if running locally without Docker)

### Installation

1. Clone the repository

```bash
cd expense-manager-apis
```

2. Install dependencies

```bash
npm install
```

3. Set up environment variables

```bash
cp .env.example .env
```

Edit `.env` and update the values:

- `DATABASE_URL` - PostgreSQL connection string
- `JWT_SECRET` - Secret key for JWT tokens
- `PORT` - Server port (default: 3000)

4. Generate Prisma Client and run migrations

```bash
npm run prisma:generate
npm run prisma:migrate
```

5. Start the development server

```bash
npm run dev
```

## Docker Deployment

### Production

```bash
docker-compose up -d
```

### Development (with hot reload)

```bash
docker-compose -f docker-compose.dev.yml up
```

## API Endpoints

### Authentication

- `POST /api/v1/auth/register` - Register new user
- `POST /api/v1/auth/login` - Login user
- `GET /api/v1/auth/profile` - Get user profile (protected)

### Expenses

- `POST /api/v1/expenses` - Create expense
- `GET /api/v1/expenses` - Get all expenses (with pagination & filters)
- `GET /api/v1/expenses/:id` - Get expense by ID
- `PUT /api/v1/expenses/:id` - Update expense
- `DELETE /api/v1/expenses/:id` - Delete expense

### Dashboard

- `GET /api/v1/dashboard/summary` - Get expense summary
- `GET /api/v1/dashboard/category-analytics` - Get category breakdown
- `GET /api/v1/dashboard/monthly-trends` - Get monthly trends
- `GET /api/v1/dashboard/recent-expenses` - Get recent expenses

## API Documentation

### Register User

```bash
curl -X POST http://localhost:3000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "password123",
    "name": "John Doe"
  }'
```

### Login

```bash
curl -X POST http://localhost:3000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "password123"
  }'
```

### Create Expense (requires authentication)

```bash
curl -X POST http://localhost:3000/api/v1/expenses \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN" \
  -d '{
    "title": "Groceries",
    "amount": 45.50,
    "category": "Food",
    "description": "Weekly grocery shopping",
    "date": "2025-12-09"
  }'
```

### Get Expenses (with filters)

```bash
curl -X GET "http://localhost:3000/api/v1/expenses?page=1&limit=10&category=Food&startDate=2025-12-01&endDate=2025-12-31" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

### Get Dashboard Summary

```bash
curl -X GET "http://localhost:3000/api/v1/dashboard/summary?startDate=2025-12-01&endDate=2025-12-31" \
  -H "Authorization: Bearer YOUR_JWT_TOKEN"
```

## Environment Variables

| Variable            | Description                          | Default     |
| ------------------- | ------------------------------------ | ----------- |
| `DATABASE_URL`      | PostgreSQL connection string         | -           |
| `POSTGRES_USER`     | Database user                        | expenseuser |
| `POSTGRES_PASSWORD` | Database password                    | expensepass |
| `POSTGRES_DB`       | Database name                        | expensedb   |
| `POSTGRES_PORT`     | Database port                        | 5432        |
| `JWT_SECRET`        | Secret key for JWT                   | -           |
| `PORT`              | API server port                      | 3000        |
| `NODE_ENV`          | Environment (development/production) | development |

## Database Schema

### User

- `id` (UUID)
- `email` (unique)
- `password` (hashed)
- `name`
- `createdAt`
- `updatedAt`

### Expense

- `id` (UUID)
- `title`
- `amount`
- `category`
- `description`
- `date`
- `userId` (foreign key)
- `createdAt`
- `updatedAt`

## Scripts

- `npm run dev` - Start development server with hot reload
- `npm start` - Start production server
- `npm run prisma:generate` - Generate Prisma Client
- `npm run prisma:migrate` - Run database migrations
- `npm run prisma:deploy` - Deploy migrations in production
- `npm run prisma:studio` - Open Prisma Studio

## Documentation

- [Category API Documentation](./CATEGORY_API.md) - Category CRUD endpoints
- [Logging Documentation](./LOGGING.md) - Structured logging and monitoring

## License

MIT
