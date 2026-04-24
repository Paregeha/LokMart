# LokMart

Mobile grocery store application built with Flutter and Strapi backend APIs.

## Short Description

`LokMart` is an e-commerce mobile app for grocery shopping. It includes authentication, product browsing, search and filtering, wishlist, cart, checkout (address + payment), order history, and courier tracking on a map.

The app communicates with a Strapi backend (`/api` endpoints) and uses Stripe for card setup and payment intents.

## Main Features

- Authentication: sign in, sign up, session restore from secure storage.
- Home catalog: categories, popular deals, product list with pagination (`load more`).
- Search and filtering: text search, advanced product filters, recent searches persisted in local storage.
- Product details and cart: add/remove items, quantity updates, total price calculation.
- Wishlist: optimistic add/remove with backend sync.
- Checkout flow: shipping address, saved cards, card/cash payment options.
- Stripe integration: setup intent, attach payment method, payment intent confirmation.
- Orders: list by statuses (`all`, `in_progress`, `completed`, `cancelled`).
- Track order: map route, courier drag simulation, confirm/decline delivery actions.
- Profile: edit user info, avatar upload, password change, logout, contact support.
- Local notifications: scheduled "courier arrived" notifications with deep-link handling.

## Technologies Used

- Flutter (Material UI)
- Dart
- BLoC (`flutter_bloc`)
- `go_router` for navigation (including shell/bottom-tab routing)
- `dio` for HTTP networking
- `flutter_secure_storage` + JWT parsing (`jwt_decode`) for auth persistence
- `flutter_stripe` for payments
- `flutter_map` + `latlong2` + `flutter_map_dragmarker` for map tracking
- `geolocator` for device location
- `flutter_local_notifications` + `timezone` for notifications
- `shared_preferences` for recent search history
- `image_picker` for avatar selection
- `flutter_svg` for SVG assets
- `freezed` + `json_serializable` for immutable models/states and JSON mapping
- `flutter_gen` for typed assets
- `widgetbook` for UI component catalog

## Tech Stack

- **Architecture:** feature-first structure + repository layer + BLoC state management.
- **Backend:** Strapi REST API (`/api/*`), custom endpoints for wishlist, orders, and payments.
- **Payments:** Stripe (setup/payment intents via backend).
- **Storage:** secure storage (auth token), shared preferences (recent searches).
- **Routing:** declarative routing with nested shell navigation.

## Project Structure Overview

```text
lib/
  core/                 # Env config, shared UI helpers
  services/             # Dio setup, auth interceptor, token provider
  features/             # Business logic by feature (auth, products, cart, ...)
	<feature>/
	  data/             # Repositories/API calls
	  blocs|bloc/       # BLoC events/states/logic
	  models/           # Domain/data models
  pages/                # Screens
  routes/               # Route names + GoRouter config
  resources/            # Colors/fonts/themes
  widgets/              # Reusable UI components
  gen/                  # Generated assets accessors (flutter_gen)
  widgetbook/           # Widgetbook setup and component cases
```

## Environment Requirements

- Flutter SDK: `>=3.7.2 <4.0.0` (from `pubspec.yaml`)
- Dart SDK: bundled with Flutter
- Xcode + CocoaPods (for iOS builds)
- Android Studio / Android SDK (for Android builds)
- Java 11 (Android Gradle config)
- Running Strapi backend reachable from the app

## How to Run the Project

1. Install dependencies:

```bash
flutter pub get
```

2. Start backend (Strapi) first.

If your backend is in a folder like `~/Strapi` (as in your terminal prompt), run:

```bash
cd ~/Strapi
npm install
npm run develop
```

If your Strapi project is in another location, use that path and its own `README` scripts.


## Optional Build Commands

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (requires macOS + Xcode + signing setup)
flutter build ios --release
```

## Code Generation

The project already contains generated files (`*.freezed.dart`, `*.g.dart`, and `lib/gen/*`), so **code generation is not required for a clean run**.

Run generation when you change Freezed/JSON models, BLoC unions, or assets configuration:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Optional watch mode:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## State Management and Error Handling Notes

- State management is implemented with BLoC (`flutter_bloc`), mostly event-driven feature blocs.
- `Freezed` is used for many events/states and immutable models, while some auth/profile states use `equatable`.
- Data access is encapsulated in repositories (`features/*/data`) using `dio`.
- Repositories throw exceptions; blocs catch them and expose user-facing error states/messages.
- UI handles failures with SnackBars, retry buttons, and loading indicators (instead of global crash behavior).

## Additional Notes

- Stripe publishable key is set in `lib/main.dart`; production projects should inject this via environment/build configs.
- There is `build.yaml` configuration for additional generators (including Swagger/Chopper), but current app flow relies on repository-based Dio calls from `lib/features/*/data`.
- Widgetbook is available for isolated UI component preview (`lib/widgetbook/widgetbook.dart`).
