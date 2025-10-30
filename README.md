# 🌸 Flower App

A complete Flutter application showcasing the use of **Forms, Lists, Navigation, and Image Widgets** — all built around a flower store concept 🌷.  
This project demonstrates essential Flutter concepts such as state management with `setState()`, form validation, dynamic lists, and custom UI components.

---

## 📱 Features

### 🏠 Home Page
- Central navigation hub with four main options:
  - **Form Page** → Add or edit flower information.
  - **List Page** → View all flowers in a scrollable list.
  - **Detail Page** → View full flower image and pricing with discount logic.
  - **Extra Page** → Displays flower statistics (total, available, average price, discount).

### 📝 Form Page
- Add new flowers or update existing ones.
- Includes input validation for all fields.
- Dropdown for color selection.
- Slider for discount percentage.
- Switch for availability.
- Beautiful blue theme with real-time validation.

### 📋 List Page
- Dynamic list of flowers with:
  - Name, description, category, color, availability.
  - Edit and delete buttons for each flower.
  - Price displayed neatly on the right.
- Floating Action Button to add new items.

### 🌼 Detail Page
- Displays full flower image with name overlay.
- Includes:
  - Slider to zoom in/out on the image.
  - Button to show or hide price info.
  - Countdown timer that resets automatically.
- Green theme matching the nature concept 🌿.

### 📊 Extra Page (Statistics Dashboard)
- Shows total flower count, availability count, average price, and average discount.
- Designed in **blue-grey** theme.
- Clean card-based design.

---

## 🧩 Project Structure

lib/
│
├─ main.dart
│
├─ models/
│ └─ flower_item.dart
│
├─ pages/
│ ├─ home_page.dart
│ ├─ list_page.dart
│ ├─ detail_page.dart
│ ├─ form_page.dart
│ └─ extra_page.dart
│
└─ widgets/
└─ home_button.dart

yaml
Copy code

This structure separates logic, UI, and data to make the code modular and maintainable.

---

## ⚙️ Technologies Used

- **Flutter** (Dart SDK 3.x)
- **Material Design 3**
- **State management** → `setState()`
- **Navigation** → `Navigator.push` / `Navigator.pop`
- **Form Validation** → `Form` + `GlobalKey<FormState>`
- **Assets** → Local image assets for flowers

---

## 🖼️ Assets Configuration

Make sure your `pubspec.yaml` includes:

```yaml
flutter:
  uses-material-design: true
  assets:
    - images/Flower1.jpg
    - images/Flower2.jpg
    - images/Flower3.jpg
    - images/Flower4.jpg
    - images/Flower5.jpg
Place your flower images inside the /images/ folder in the project root.
