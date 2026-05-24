# Product Catalog Manager

A Flutter mobile app for managing a product catalog with full CRUD operations. Built with Provider for state management and crudcrud.com as the live REST API backend.

---

## Screenshots

| Loading | Home | Empty State |
|---------|------|-------------|
| Animated skeleton cards while fetching | Product list with edit/delete actions | Shown when no products exist |

| Add Product | Edit Product | Error State |
|-------------|-------------|-------------|
| Form with validation | Pre-filled form | Retry button on failure |

---

## Features

- View all products fetched from a live REST API
- Add new products with name and price validation
- Edit existing products with pre-filled form
- Delete products with a confirmation dialog
- Loading skeleton animation while fetching
- Empty state with a prompt to add the first product
- Error state with a retry button
- Pull-to-refresh on the product list
- Snackbar feedback after every CRUD operation
- Friendly error messages (API limit, no internet, not found)

---

## Tech Stack

| Layer | Package |
|-------|---------|
| State Management | [provider ^6.1.2](https://pub.dev/packages/provider) |
| HTTP Requests | [http ^1.2.1](https://pub.dev/packages/http) |
| Backend | [crudcrud.com](https://crudcrud.com) |
| Language | Dart 3 / Flutter |

---

## Project Structure

```
lib/
├── main.dart                          # Entry point + MultiProvider setup
│
├── core/
│   ├── constants/
│   │   └── api_constants.dart         # Base URL and endpoint
│   └── theme/
│       └── app_theme.dart             # Colors, text styles, component themes
│
├── models/
│   └── product.dart                   # Product data class + fromJson / toJson
│
├── services/
│   └── product_service.dart           # All HTTP calls — GET POST PUT DELETE
│
├── providers/
│   └── product_provider.dart          # ChangeNotifier — state + CRUD logic
│
└── views/
    ├── home/
    │   ├── home_screen.dart            # Main screen with all UI states
    │   └── widgets/
    │       ├── product_card.dart       # Individual product card
    │       ├── loading_state.dart      # Skeleton loading animation
    │       └── empty_state.dart        # Zero products illustration
    └── product_form/
        └── product_form_screen.dart    # Shared Add / Edit form screen
```

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- An active internet connection
- A valid [crudcrud.com](https://crudcrud.com) endpoint

### 1. Clone the repository

```bash
git clone https://github.com/umerDev30/crud_flutter_application.git
cd product-catalog-flutter
```

### 2. Set your crudcrud endpoint

Open `lib/core/constants/api_constants.dart` and replace the URL with your own:

```dart
class ApiConstants {
  static const String baseUrl =
      'https://crudcrud.com/api/YOUR_UNIQUE_ID';

  static const String productsEndpoint = '$baseUrl/products';
}
```

You can get a free endpoint at [https://crudcrud.com](https://crudcrud.com) — no sign-up needed.

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Run the app

```bash
flutter run
```

---

## API Reference

The app communicates with crudcrud.com using standard REST calls.

| Operation | Method | Endpoint | Body |
|-----------|--------|----------|------|
| Get all products | `GET` | `/products` | — |
| Create a product | `POST` | `/products` | `{ name, price }` |
| Update a product | `PUT` | `/products/:id` | `{ name, price }` |
| Delete a product | `DELETE` | `/products/:id` | — |

### Sample product JSON

```json
{
  "_id": "64f3a1b2c7e8d9001a2b3c4d",
  "name": "Wireless Headphones",
  "price": 149.99
}
```

> **Note:** `_id` is assigned automatically by crudcrud. Never include it in POST or PUT request bodies.

---

## State Management

The app uses the Provider pattern with `ChangeNotifier`.

```
UI (widgets)
    │
    ▼
ProductProvider          ← holds _products, _isLoading, _errorMessage
    │
    ▼
ProductService           ← makes HTTP calls, returns Dart objects
    │
    ▼
crudcrud.com REST API
```

### Provider API used in this project

| API | Where used | Why |
|-----|-----------|-----|
| `context.read<T>()` | `initState`, button callbacks, `_save()` | One-time method call, no rebuild needed |
| `Consumer<T>` | Home screen body | Rebuilds only the list area, not the whole Scaffold |

---

## Known Limitations

- **crudcrud free tier allows 100 requests per 24-hour window.** If you hit this limit you will see a friendly error message. Wait 24 hours or get a new endpoint.
- **Data does not persist across endpoint resets.** crudcrud resets your data every 24 hours. This is expected behavior for the assignment.
- The `_id` field is a `String` (not `int`) because crudcrud uses MongoDB-style ObjectIDs.

---

## Common Issues

**App shows "Something went wrong" immediately**
- Your crudcrud endpoint has expired (24-hour reset). Go to [crudcrud.com](https://crudcrud.com), copy the new URL, and update `api_constants.dart`.

**App shows "Daily API limit reached"**
- You have used all 100 free requests. Wait 24 hours or use a fresh endpoint.

**`flutter pub get` fails**
- Make sure your Flutter SDK version is `>=3.0.0`. Run `flutter --version` to check.

**Changes not reflecting after edit**
- Make sure you are not caching the old endpoint URL. Hot restart (`Shift + R` in terminal) rather than hot reload.

---

## Assignment Info

- **Course:** Flutter Development — UBIT Batch 23
- **Assignment:** 9 — Product Catalog Manager
- **Topics:** Provider State Management, HTTP API Integration, CRUD Operations
- **Marks:** 100 pts

---

## License

This project was built for academic purposes.
