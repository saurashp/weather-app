# 🌦️ Weather App with DevOps

A modern weather application built using **React.js** and **Vite** that provides real-time weather information using the **OpenWeather API**. The project also demonstrates **DevOps practices** by integrating **Docker** for containerization and **Jenkins** for Continuous Integration (CI).

---

## 🚀 Features

- 🌍 Search weather by city name
- 🌡️ Real-time temperature
- 💧 Humidity information
- 🌬️ Wind speed
- ☁️ Weather conditions with icons
- 📱 Responsive UI
- ⚡ Fast performance with Vite
- 🐳 Docker support for containerized deployment
- 🔄 Jenkins CI pipeline for automated build process

---

## 🛠️ Tech Stack

### Frontend
- React.js
- Vite
- JavaScript
- CSS

### API
- OpenWeather API

### DevOps
- Docker
- Jenkins
- Git
- GitHub

---

## 📂 Project Structure

```
weather-app/
├── public/
├── src/
├── Dockerfile
├── Jenkinsfile
├── .env
├── package.json
├── vite.config.js
└── README.md
```

---

## ⚙️ Installation

### Clone Repository

```bash
git clone https://github.com/saurashp/weather-app.git
cd weather-app
```

### Install Dependencies

```bash
npm install
```

### Configure Environment Variables

Create a `.env` file.

```env
VITE_WEATHER_API_KEY=your_api_key_here
```

### Run Development Server

```bash
npm run dev
```

---

# 🐳 Docker

Build Docker Image

```bash
docker build -t weather-app .
```

Run Docker Container

```bash
docker run -p 5173:5173 weather-app
```

---

# 🔄 Jenkins CI Pipeline

The project includes a **Jenkinsfile** to automate the build process.

Pipeline stages include:

- Clone Repository
- Install Dependencies
- Build Application
- Verify Build Status

This enables Continuous Integration (CI) by automatically building the application whenever new code is pushed to the repository.

---

## 🔑 API Used

OpenWeather API

https://openweathermap.org/api

---

## 📸 Screenshots

_Add application screenshots here._

---

## 🚀 Future Improvements

- 5-Day Forecast
- Current Location Weather
- Dark Mode
- Air Quality Index
- Weather Alerts

---

## 📄 License

MIT License

---

## 👨‍💻 Author

**Saurash Preet**

- GitHub: https://github.com/saurashp
- LinkedIn: https://www.linkedin.com/in/saurash-preet-9358a2227/
