# AGENTS.md --- FitNSTYLE Flutter Shopping App

## 1. Purpose of This File

This file contains project-specific instructions for AI coding agents
working on FitNSTYLE.

Before changing code: 1. Inspect the existing implementation and
relevant files. 2. Follow the current project structure and naming
conventions. 3. Explain the proposed approach briefly when a task is
complex. 4. Make the smallest complete change that solves the task. 5.
Add `// CHANGED:` comments near important modified sections so the
developer can understand what changed. 6. Run or recommend relevant
formatting, analysis, and tests. Never claim checks passed unless they
were actually run.

Do not treat this file as proof that a feature already exists. Verify
the code before relying on it.

------------------------------------------------------------------------

## 2. Project Overview

-   **Project name:** FitNSTYLE
-   **Type:** Clothing and fashion shopping mobile application
-   **Framework:** Flutter
-   **Language:** Dart
-   **State management, dependency injection, and navigation:** GetX
-   **Responsive sizing:** `flutter_screenutil`
-   **Current development data:** Some screens use local dummy product
    data. Confirm the current source of truth before implementing or
    changing data flows.
-   **Main goal:** Build a maintainable, responsive, user-friendly
    shopping app with reusable UI components and a clear path from local
    prototype data to a real backend.

Do not assume that Firebase, an API, authentication, payment processing,
or persistence is fully integrated just because a dependency or
placeholder exists. Inspect the current implementation first.

------------------------------------------------------------------------

## 3. Technology and Existing Conventions

Use the packages already present in `pubspec.yaml` when they fit the
task. The project has used:

-   `get` for GetX controllers, reactive state, bindings, and navigation
-   `flutter_screenutil` for responsive dimensions and text sizing
-   Shared UI components such as `CustomButton`, `CustomTextField`,
    `CustomListTile`, `CustomListView`, `CustomPopupMenu`,
    `SectionHeader`, and `ProductsGrid`

Before adding a dependency: 1. Check whether an existing package or
project utility already solves the problem. 2. Explain why a new
dependency is needed. 3. Check compatibility with the project's
Flutter/Dart SDK constraints. 4. Prefer actively maintained packages and
official documentation. 5. Do not add a package merely to avoid a small,
understandable implementation.

Use the existing app colors, sizes, text styles, image asset constants,
and route constants instead of hardcoding values when suitable project
constants exist.

------------------------------------------------------------------------

## 4. Architecture and Folder Structure

The project uses a feature-first structure with a singular `feature/`
directory. Preserve the actual structure already present in the
repository. A feature may follow this pattern where appropriate:

``` text
lib/
├── core/
│   ├── common_widgets/
│   ├── constants/
│   ├── initial_binding/
│   ├── models/
│   ├── networks/
│   ├── services/
│   ├── theme/
│   └── utils/
└── feature/
    ├── auth/
    │   ├── binding/
    │   ├── controller/
    │   ├── view/
    │   └── widgets/
    ├── home/
    │   ├── binding/
    │   ├── controller/
    │   ├── view/
    │   └── widgets/
    ├── category/
    ├── product_detail/
    ├── cart/
    ├── checkout/
    ├── order/
    ├── notifications/
    ├── profile/
    ├── wishlist/
    └── settings/
```

This is a target/reference layout, not a mandate to create every folder
immediately. Match existing names and paths when they already differ.
Avoid moving files or renaming folders unless the task requires it.

### Responsibility boundaries

-   **View:** Displays UI and connects user interactions to the
    controller.
-   **Controller:** Handles feature state and presentation-related
    actions.
-   **Binding:** Registers a controller and its dependencies with GetX.
-   **Model:** Represents structured app data, such as a product, cart
    item, address, or order.
-   **Service/repository:** Handles data access, persistence, APIs,
    Firebase, or other external systems as appropriate.
-   **Core/common widgets:** Contains reusable UI or utilities that
    genuinely apply across multiple features.

For a larger feature, prefer a clear flow such as:

`View → Controller → Repository/Service → Data source`

Do not add repository/service layers to tiny features without a
practical benefit. Keep business logic out of large widget build
methods.

------------------------------------------------------------------------

## 5. GetX and UI Rules

1.  Use GetX consistently with the existing project. Do not introduce
    Provider, Riverpod, Bloc, or another state-management framework
    without explicit approval.
2.  Use `GetView<YourController>` when it fits the feature; otherwise
    use the established view pattern.
3.  Register controllers through feature bindings or the existing
    dependency-injection setup. Avoid creating duplicate controller
    instances.
4.  Use `Obx` or `GetBuilder` appropriately. Reactive UI must read the
    reactive state inside the reactive builder.
5.  Avoid unnecessary `StatefulWidget` conversions. Prefer
    `StatelessWidget` plus GetX state when that matches the existing
    design.
6.  Keep navigation route names in the central route constants and
    register pages in the existing route configuration.
7.  Use `Get.toNamed`, `Get.back`, and other established GetX navigation
    APIs consistently.
8.  Validate route arguments and handle missing or malformed data when a
    screen can be opened without valid arguments.
9.  Keep loading, empty, success, and error states clear.
10. Avoid deeply nested UI logic when a small reusable widget would make
    the code easier to understand.

------------------------------------------------------------------------

## 6. Responsive UI and Design System

-   The project's established ScreenUtil design baseline is
    `Size(390, 844)`. Verify `main.dart` before changing it.
-   Use `.w`, `.h`, `.r`, and `.sp` consistently with the existing
    codebase.
-   Reuse `AppColors`, `AppSizes`, `AppTextStyles`, and asset constants
    where available.
-   The app has used the Geist font family with weights 300, 400, 500,
    600, and 700. Verify the current theme and font setup before
    modifying it.
-   Keep spacing, corner radii, typography, and button styles consistent
    across screens.
-   Use `SafeArea` where content could overlap system UI.
-   Give scrollable widgets valid constraints. In a `Column`, a vertical
    list usually needs `Expanded` or a defined height. Do not put
    `Expanded` inside an unbounded scrollable parent.
-   For horizontal lists, use horizontal separators/spacing; for
    vertical lists, use vertical separators/spacing.
-   For network images, provide appropriate loading/error behavior where
    needed.
-   Ensure interactive areas are usable and do not rely only on color to
    convey status.

### Reusable widgets

Reuse existing components before creating duplicates. Keep reusable
widgets focused: - `CustomButton`: button presentation and interaction -
`CustomTextField`: consistent text input styling - `CustomListTile`:
reusable leading/content/trailing row - `CustomListView`: reusable list
behavior - `ProductsGrid`: product-grid presentation and callbacks -
`SectionHeader`: section title and optional See All action

Do not make a reusable widget responsible for navigation or business
operations unless that is already its explicit responsibility. Prefer
callbacks such as `onTap` to keep it reusable.

------------------------------------------------------------------------

## 7. Product and Shopping Cart Requirements

The shopping flow should eventually support the following. Verify what
exists before implementing each item.

### Product catalogue

-   Product model with stable product ID, title, description, price,
    image(s), category, stock/availability, and other needed fields.
-   Product grid and list layouts using reusable product cards.
-   Product detail screen showing the selected product.
-   Product selection should pass a stable product ID or validated
    product data; avoid relying on a fragile list index across screens.
-   Search and category filtering.
-   Loading, empty, and error states when data comes from a backend.

### Cart

-   Add a product to the cart from product cards or product detail.
-   Add the same product again by increasing its quantity instead of
    creating unintended duplicate lines.
-   Increase/decrease quantity with a defined minimum quantity.
-   Remove an item.
-   Display line totals and subtotal correctly.
-   Display cart item count consistently.
-   Define how unavailable/out-of-stock products are handled.
-   Show an empty-cart state with a way to continue shopping.
-   Preserve cart state across app restarts if persistence is required.
-   Avoid silently assuming a third-party cart package is compatible.
    Check its API, maintenance status, SDK compatibility, and
    persistence behavior first.
-   Keep cart UI in the cart feature and cart state/operations in a
    controller or dedicated cart service/repository, following the
    existing project.

### Pricing

-   Store prices as a suitable numeric representation, not formatted
    strings used for arithmetic.
-   Format prices only when displaying them.
-   Define how discounts, shipping, tax, and final totals are calculated
    before implementing checkout.
-   Do not trust client-calculated prices as authoritative for real
    payments; verify prices server-side in a production backend.

------------------------------------------------------------------------

## 8. Authentication, Checkout, and Orders

Implement only after inspecting the current code and agreed
requirements.

### Authentication

-   Login, registration, logout, and password reset as required.
-   Input validation and clear errors.
-   Loading states and duplicate-submit protection.
-   Secure handling of credentials and tokens.
-   Do not store passwords in plain text or hardcode secrets in source
    code.

### Checkout

-   Address selection or entry.
-   Order summary and quantity validation.
-   Shipping/tax/discount calculations with a clearly defined source of
    truth.
-   Payment integration only after provider and backend requirements are
    specified.
-   Do not claim that a payment succeeded based only on a local UI
    state.

### Orders

-   Order history and order details.
-   Clear order statuses and timestamps.
-   Backend validation and reliable order creation before treating an
    order as confirmed.
-   Appropriate empty, loading, and error states.

------------------------------------------------------------------------

## 9. Profile and Supporting Features

Potential feature scope, based on the shopping-app design: - Profile
details and edit profile - Address management - Wishlist/favorites -
Notifications - Settings - Help and support - Payment methods, where
applicable

Do not create placeholder screens for every item automatically.
Implement them in priority order and confirm their behavior and data
source.

------------------------------------------------------------------------

## 10. Data, APIs, Firebase, and Security

-   Inspect existing network/service code before choosing where new API
    calls belong.
-   Keep API calls out of widget build methods.
-   Handle network errors, timeouts, empty responses, and malformed
    data.
-   Use models or validated mapping for non-trivial API responses.
-   Keep secrets and private API keys out of committed source code.
-   Never embed privileged database credentials in the Flutter client.
-   A Flutter app should normally communicate with a backend API rather
    than connect directly to a protected database with privileged
    credentials.
-   Apply server-side authorization and validation for user-owned
    cart/order data.
-   Do not log passwords, access tokens, payment details, or other
    sensitive data.
-   For local persistence, document what is stored and whether it must
    survive app restarts.
-   Do not replace existing data sources or delete dummy data until the
    new source has been verified and the migration is intentional.

------------------------------------------------------------------------

## 11. Code Quality Rules

-   Use clear, descriptive names in `lowerCamelCase` for variables and
    methods and `UpperCamelCase` for types.
-   Follow Dart formatting conventions; format changed Dart files with
    `dart format`.
-   Prefer small methods and widgets with one clear responsibility.
-   Avoid duplicate implementations of the same component or business
    rule.
-   Remove unused imports and dead code introduced by a change.
-   Avoid force-unwrapping nullable values (`!`) when data may genuinely
    be missing; validate or provide a safe fallback.
-   Use strongly typed models for important data rather than spreading
    `Map<String, dynamic>` across the entire app. Dummy maps may remain
    temporarily during prototyping.
-   Keep comments useful and current. Add `// CHANGED:` comments at
    modified areas when working with this developer, but do not fill
    every line with redundant comments.
-   Do not perform unrelated refactors during a focused task.
-   Never overwrite a file wholesale without checking its current
    contents and preserving existing behavior that is still needed.

------------------------------------------------------------------------

## 12. Accessibility and Interaction

-   Use readable text sizes and sufficient contrast.
-   Provide clear labels and meaningful icons for interactive actions.
-   Avoid using color as the only indicator of selection, success, or
    errors.
-   Ensure touch targets are practical for mobile use.
-   Provide feedback for important actions, including add-to-cart,
    favorite, remove, and checkout errors.
-   Prevent rapid repeated submission where it could create duplicate
    operations.

------------------------------------------------------------------------

## 13. Testing and Verification

After making changes, use the checks that are available in the project:

``` bash
dart format lib
flutter analyze
flutter test
```

Run the commands from the project root. If the repository has no tests
or a command cannot be run, state that clearly rather than claiming
success.

For UI or navigation changes, verify: - The app builds. - Routes are
registered correctly. - Back navigation works. - Small and large screen
layouts remain usable. - Scrollable widgets have valid constraints. -
Empty/loading/error states render correctly. - Buttons perform their
advertised action.

For cart changes, test: - Adding one product. - Adding the same product
again. - Increasing and decreasing quantity. - Preventing quantity from
going below the minimum. - Removing a product. - Correct subtotal and
item count. - Empty cart behavior. - Persistence after restart if
required.

------------------------------------------------------------------------

## 14. Recommended Development Roadmap

Use this as a planning checklist. Update the checklist as work is
verified; do not mark items complete just because code has been drafted.

### Phase 1 --- Audit and stabilize

-   [ ] Inspect `pubspec.yaml`, `main.dart`, bindings, route
    configuration, theme, and existing folder structure.
-   [ ] Confirm the app runs on the target device/emulator.
-   [ ] Fix existing analyzer/build errors before adding major features.
-   [ ] Confirm asset paths and reusable widgets.
-   [ ] Document which features currently use dummy data versus real
    services.

### Phase 2 --- Product catalogue

-   [ ] Create or refine a typed product model.
-   [ ] Confirm product card and product grid/list behavior.
-   [ ] Implement product detail navigation and validate the selected
    product.
-   [ ] Implement category filtering and search.
-   [ ] Add loading/error/empty states where applicable.

### Phase 3 --- Cart

-   [ ] Decide between a small GetX-based cart controller or a
    third-party package after checking compatibility.
-   [ ] Define a cart item model and stable product identity.
-   [ ] Implement add, remove, quantity changes, item count, and
    subtotal.
-   [ ] Connect product cards and product detail to the cart.
-   [ ] Implement cart empty and populated states.
-   [ ] Add local persistence if required and test restart behavior.

### Phase 4 --- Authentication and user data

-   [ ] Confirm the intended auth provider/backend.
-   [ ] Implement and validate login, registration, logout, and password
    reset as required.
-   [ ] Define how profile and address data are stored.
-   [ ] Add proper loading and error handling.

### Phase 5 --- Checkout and orders

-   [ ] Define address, shipping, tax, discount, and payment
    requirements.
-   [ ] Implement checkout validation and order summary.
-   [ ] Connect to a secure backend/payment provider if applicable.
-   [ ] Implement order confirmation and order history.
-   [ ] Verify server-side validation before considering the flow
    production-ready.

### Phase 6 --- Supporting features

-   [ ] Wishlist/favorites
-   [ ] Notifications
-   [ ] Profile editing and addresses
-   [ ] Settings
-   [ ] Help and support

### Phase 7 --- Quality and release readiness

-   [ ] Add tests for critical controller and pricing logic.
-   [ ] Run formatting, analyzer, and tests.
-   [ ] Verify responsive layouts and error states.
-   [ ] Remove debug-only behavior and sample secrets.
-   [ ] Check app permissions, release configuration, and privacy
    requirements.
-   [ ] Test a release build on a real device.

------------------------------------------------------------------------

## 15. How AI Agents Should Report Work

At the end of a task, summarize: 1. What was changed. 2. Which files
were created or modified. 3. How the implementation works. 4. Any setup
or migration steps required. 5. What checks were run and their actual
results. 6. Known limitations or follow-up tasks.

If requirements are ambiguous and the choice materially affects
architecture, data integrity, security, or user experience, ask a
concise clarifying question. Otherwise, make a conservative choice
consistent with the existing project and explain it.

------------------------------------------------------------------------

## 16. Important Project-Specific Reminders

-   Preserve FitNSTYLE's existing GetX-based approach.
-   Follow the existing `core/` and singular `feature/` folder
    conventions.
-   Reuse the existing app design system and shared widgets.
-   Prefer `StatelessWidget` with GetX reactive state when appropriate.
-   Add `// CHANGED:` comments near meaningful code modifications for
    learning.
-   Explain concepts in straightforward English or Roman Urdu when
    communicating with the developer.
-   Teach the reasoning when requested; do not only provide unexplained
    code.
-   Never claim that a feature, test, route, API, or integration works
    until it has been verified.
