
# Rails Project - Problem 01

This is a Ruby on Rails project, set up with Docker for containerized development, including the application code and database services.

## Directory Structure

- **app/**: Contains the main Rails application files, configuration, and dependencies.
- **db/**: Contains database-related files, including `docker-compose.yml` for database configuration.

## Getting Started

### Prerequisites

- Docker
- Docker Compose

Ensure Docker and Docker Compose are installed on your machine before proceeding.

### Setup

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   cd problem_01
   ```

2. **Build and Run the Docker Containers:**

   Inside the project root, run the following command to start the application and database:

   ```bash
   docker-compose up --build
   ```

   This command will build the necessary images and start the containers.

3. **Install Gems:**

   If not already installed via Docker, install the necessary gems:

   ```bash
   docker-compose run app bundle install
   ```

4. **Database Setup:**

   Run the migrations to set up the database schema:

   ```bash
   docker-compose run app rails db:create db:migrate
   ```

### Development

The application can be accessed at `http://localhost:3000` after the Docker containers are up.

- To run the Rails console:

  ```bash
  docker-compose run app rails console
  ```

- To run tests:

  ```bash
  docker-compose run app rails test
  ```

### Configuration

The application uses environment variables configured in the Docker Compose file for setting up services like the database.

### Docker Compose Files

- **app/docker-compose.yml**: Defines services for the Rails application and database.
- **db/docker-compose.yml**: Contains the database service configuration.

## Additional Resources

- **Gemfile**: Lists the dependencies for the Rails application.
- **Dockerfile & Dockerfile.dev**: Defines how to build the Docker images for development and production.
- **README.md**: This file.
