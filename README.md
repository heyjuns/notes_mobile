# Notes App — Flutter

A simple note-taking app built with Flutter and Firebase as part of a technical test for **PT. Oddbit Software Development**.

---

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Framework | Flutter 3.x (Dart) |
| State Management | flutter_bloc + Freezed |
| Navigation | go_router |
| Backend | Firebase Auth + Cloud Firestore |
| Architecture | Clean Architecture (Domain / Data / Presentation) |
| DI | get_it |
| UI Components | Forui |

---

## Features

- Register & Login with Firebase Auth
- Create, read, update, delete notes
- Notes are private — each user only sees their own
- Auth session persists across app restarts
- Inline form validation with error messages
- Skeleton loading state on notes list
- Swipe-to-delete notes
- Tap note to edit

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.11.0`
- A Firebase project with **Authentication** (Email/Password) and **Firestore** enabled
- `flutterfire_cli` (optional, only if reconfiguring Firebase)

### 1. Clone & install dependencies

```bash
git clone <repo-url>
cd notes_mobile
flutter pub get
```

### 2. Firebase setup

The app already ships with `firebase_options.dart`, `google-services.json` (Android), and `GoogleService-Info.plist` (iOS) configured for the project Firebase instance.

If you need to connect your own Firebase project:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

Then enable **Email/Password** sign-in in Firebase Console → Authentication → Sign-in method.

### 3. Firestore Security Rules

Go to Firebase Console → Firestore → Rules and apply the following:

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {

    // Users collection — only the owner can read/write their own profile
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // Notes collection — only the owner can CRUD their own notes
    match /notes/{noteId} {
      // Helper: check if the authenticated user owns this note
      function isOwner() {
        return request.auth != null &&
               request.auth.uid == resource.data.userId;
      }

      // Helper: validate note fields on create/update
      function isValidNote() {
        let data = request.resource.data;
        return data.keys().hasAll(['title', 'content', 'userId', 'createdAt', 'updatedAt'])
          && data.title is string && data.title.size() > 0
          && data.content is string && data.content.size() > 0
          && data.userId == request.auth.uid;
      }

      allow read:   if request.auth != null && isOwner();
      allow create: if request.auth != null && isValidNote();
      allow update: if request.auth != null && isOwner() && isValidNote();
      allow delete: if request.auth != null && isOwner();
    }
  }
}

```

### 4. Run the app

```bash
flutter run
```

---

## Sample Login Account

A test account is available to try the app without registering:

| Field | Value |
|-------|-------|
| Email | `test@oddbit.com` |
| Password | `test123456` |

> If the account doesn't exist yet, you can register it directly through the app's Register screen.

---

## Firestore Collection Structure

### `users/{uid}`

| Field | Type | Description |
|-------|------|-------------|
| `email` | String | User email address |
| `name` | String | Display name |
| `createdAt` | Timestamp | Account creation time |

### `notes/{noteId}`

| Field | Type | Description |
|-------|------|-------------|
| `userId` | String | UID of the note owner |
| `title` | String | Note title |
| `content` | String | Note body |
| `createdAt` | Timestamp | Creation time |
| `updatedAt` | Timestamp | Last update time |

---

## Project Structure

Folder structure follows **feature-first** with **Clean Architecture** layers inside each feature.

```
lib/
├── core/                    # Shared utilities, error handling, DI base
│   ├── error/               # Failures, exceptions, mappers
│   ├── firebase/            # Firebase service registration
│   ├── network/             # Dio client
│   └── utils/               # Typedefs (BaseResponse)
│
├── features/
│   ├── auth/                # Authentication feature
│   │   ├── data/            # Models, datasource & repository impl
│   │   ├── domain/          # Entities, interfaces, usecases
│   │   ├── presentation/    # BLoCs (authentication, login, register, logout), screens, widgets
│   │   ├── router/          # Auth routes & GoRouter config
│   │   └── auth_container.dart   # DI setup
│   │
│   └── note/                # Notes feature
│       ├── data/            # Models, datasource & repository impl
│       ├── domain/          # Entities, interfaces, usecases (CRUD)
│       ├── presentation/    # BLoCs (notes, note_form), screens
│       ├── router/          # Note routes & GoRouter config
│       └── note_container.dart   # DI setup
│
├── app_router.dart          # Global GoRouter combining all feature routes
├── app_shell.dart           # Root widget wrapper
├── bootstrap_app.dart       # Firebase init + DI bootstrap
└── main.dart                # Entry point
```

---

## AI Tools

This project was developed with assistance from **Claude (Anthropic)**. See [`AI_PROMPT_README.md`](./AI_PROMPT_README.md) for the prompts used.
