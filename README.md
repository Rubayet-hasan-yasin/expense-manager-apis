# Expense Manager API

A comprehensive REST API for managing expenses, with support for authentication, authorization, multi-currency, and analytics. This backend serves the Expense Manager application.

## Repository

The server code is hosted at:
[https://github.com/Rubayet-hasan-yasin/expense-manager-apis](https://github.com/Rubayet-hasan-yasin/expense-manager-apis)

## Tech Stack

- **Node.js** & **Express**
- **Prisma** (ORM)
- **PostgreSQL** (Database)
- **JWT** (Authentication)

## Getting Started

### Prerequisites

- **Node.js** (v16 or higher recommended)
- **npm**
- **PostgreSQL** (A running PostgreSQL database instance)

### Installation

1. **Clone the repository and install dependencies:**
   ```bash
   git clone https://github.com/Rubayet-hasan-yasin/expense-manager-apis.git
   cd expense-manager-express
   npm install
   ```

2. **Environment Variables:**
   Copy the example environment file and configure it with your settings (especially your database URL and JWT secret):
   ```bash
   cp .env.example .env
   ```

3. **Database Setup:**
   Run the Prisma migrations to create the required tables in your PostgreSQL database:
   ```bash
   npm run prisma:migrate
   ```

   *(Optional) You can migrate default categories using:*
   ```bash
   npm run migrate:categories
   ```

4. **Start the Development Server:**
   ```bash
   npm run dev
   ```
   The server will typically start on `http://localhost:3000` (depending on your `.env` configuration).

## Available Scripts

- `npm run dev`: Starts the server in development mode using `nodemon`.
- `npm start`: Starts the server in production mode.
- `npm run lint` / `npm run lint:fix`: Runs ESLint to check or fix code quality.
- `npm run format` / `npm run format:check`: Formats the code using Prettier.
- `npm run prisma:migrate`: Runs database migrations.
- `npm run prisma:studio`: Opens Prisma Studio to view and edit your database visually.
- `npm run validate`: Runs linting, formatting checks, and validates the Prisma schema.

