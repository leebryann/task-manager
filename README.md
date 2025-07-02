# 🔧 Task Manager (Spring Boot + MySQL)

A backend API for managing to-do tasks, built with **Spring Boot**, **Spring Data JPA**, **Spring Security (JWT)**, and **MySQL**.

## Features

- ✅ **CRUD** for tasks: create, retrieve, update, and delete
- ✅ **JWT-based authentication** (access tokens only)
- ✅ **Role-based access** (example: `USER` role)
- ✅ Database initialization with `schema.sql` & `data.sql`
- ✅ Docker Compose setup with MySQL and the Spring Boot service

---

## 🧱 Project Structure

```text
task-manager-web/
├── public/
├── src/
│   ├── components/
│   │   ├── LoginForm.js
│   │   ├── TaskList.js
│   │   └── TaskForm.js
│   ├── services/
│   │   ├── AuthService.js
│   │   └── TaskService.js
│   ├── App.js
│   └── index.js
```


---

## 🚀 Getting Started

### 1. Environment Setup

Ensure you have:

- JDK 17+
- Maven (or use embedded Maven wrapper)
- MySQL running (or via Docker)

### 2. Configuration

Update `src/main/resources/application.yml` or environment variables with:

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/task_db
    username: root
    password: root
  jpa:
    hibernate:
      ddl-auto: none
jwt:
  secret: <your_base64_secret>
```

### 3. Run Locally
```bash
mvn clean spring-boot:run
```

### 4. or with Docker Compose
```bash
docker-compose up --build
```

Access the API at: http://localhost:8080

---

🔐 Authentication Flow (JWT)
POST /api/v1/login
Body: { "username": "user", "password": "password" }

Receive response: { "token": "<JWT_TOKEN>" }

Include in header for protected endpoints:

```text
Authorization: Bearer <JWT_TOKEN>
```

---

## 📑 Task API Reference

| Endpoint             | Method | Description            | Auth Required |
|----------------------|--------|------------------------|---------------|
| `/api/v1/tasks`      | GET    | List all tasks         | ✅ Yes        |
| `/api/v1/tasks`      | POST   | Create a new task      | ✅ Yes        |
| `/api/v1/tasks/{id}` | PUT    | Update a specific task | ✅ Yes        |
| `/api/v1/tasks/{id}` | DELETE | Remove a specific task | ✅ Yes        |

---

## 🛠 Docker Compose
Services defined in docker-compose.yml:

mysql – MySQL 8 database

app – Java Spring Boot service

Useful commands:

``` bash
docker-compose up -d            # start all services
docker-compose build app        # rebuild only Java service
docker-compose up -d app        # restart Java service only
```

---

## 👤 Default Credentials (for testing)
| Username | Password | 
|----------|----------|
|   user   | password |

Configured in SecurityConfig.java. Replace with a database-backed auth in production.

---

## 🧩 Improvements & Next Steps
Add refresh token mechanism

Store real users in database

Add pagination/filtering for GET /tasks

Add more unit & integration tests

