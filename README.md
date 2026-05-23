# Product Catalog Manager

A modern Flutter application for managing a product catalog with full CRUD (Create, Read, Update, Delete) functionality. The project emphasizes clean architecture, scalable state management, and a smooth user experience with responsive UI design.

---

## ✨ Features

### 📦 Product Management (CRUD)

* Create new products with name and price
* View all products in a structured list
* Edit existing product details
* Delete products with confirmation dialog

### 🎨 UI/UX Experience

* Modern Material 3 design system
* Card-based product layout for clarity
* Loading indicators during API calls
* Empty state UI when no products exist
* Snackbar feedback for user actions
* Smooth transitions and responsive layout

### ⚙️ State Management

* Built using **Provider** + **ChangeNotifier**
* Centralized product state handling
* Efficient UI rebuilds with minimal overhead

### 🌐 Networking

* REST API integration using HTTP package
* CRUD operations handled via service layer
* Structured API response handling

### 🛡️ Robustness

* Error handling for network failures
* Graceful fallback UI states
* Input validation for product forms

### 🔐 Environment Configuration

* Secure API configuration using `.env`
* Separation of sensitive data from source code

---

## 🛠 Tech Stack

* Flutter (SDK ^3.8.1)
* Dart
* Provider (State Management)
* HTTP (API Requests)
* flutter_dotenv (Environment Variables)
* Material Design 3

---



## 🚀 Getting Started

### 📋 Prerequisites

Before running the project, ensure you have:

* Flutter SDK installed (>= 3.8.1)
* Dart SDK
* Android Studio or VS Code
* A working REST API backend (e.g. crudcrud or custom backend)

---

### 📥 Installation

#### 1. Clone the repository

```bash
git clone https://github.com/AbdullahAli2005/product_catalog_manager.git
cd product_catalog_manager
```

#### 2. Install dependencies

```bash
flutter pub get
```

---

## 🔐 Environment Setup

This project uses environment variables to securely manage configuration such as API endpoints.

### Step 1: Create `.env` file

Create a file in the root directory:

```
.env
```

### Step 2: Add configuration

```env
# Base API URL for product CRUD operations
API_BASE_URL=https://your-api.com/api
```


## ▶️ Run the App

```bash
flutter run
```

---

## 📂 Project Structure

```
lib/
├── core/
│   └── theme/
│       └── app_theme.dart
│
├── models/
│   └── product.dart
│
├── providers/
│   └── product_provider.dart
│
├── services/
│   └── product_service.dart
│
├── views/
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── widgets/
│   └── product_form/
│       └── product_form_screen.dart
│
└── main.dart
```

---

## 🔌 API Contract

The application expects a REST API with the following endpoints:

### Products

* `GET /products` → Fetch all products
* `POST /products` → Create new product
* `PUT /products/:id` → Update product
* `DELETE /products/:id` → Delete product

---

### 📦 Product Model

```json
{
  "_id": "string",
  "name": "string",
  "price": "number"
}
```

---

## 🧠 Architecture Overview

The app follows a simple layered architecture:

* **UI Layer (Views)** → Screens & widgets
* **State Layer (Provider)** → Business logic + state
* **Service Layer** → API communication
* **Model Layer** → Data structures
* **Core Layer** → Theme and shared utilities

---

## 🤝 Contributing

Contributions are welcome.

* Fork the repository
* Create a feature branch
* Commit changes
* Open a pull request

---

## 📄 License

This project is licensed under the MIT License.

---

## ❤️ Acknowledgment

Built with Flutter for learning and practical demonstration of CRUD + Provider architecture.
