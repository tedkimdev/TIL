Multiple Managed Object Contexts with Core Data
==========================

대부분의 애플리케이션에는 Managed Object Context가 하나만 있으면 된다.

대부분의 Core Data 앱에서 기본 구성은 Main Queue과 연결된 single managed object context 이다.


Multiple managed object contexts 쓰는 경우
---------------------------------
- long-running tasks, such as exporting data, will block the main thread of apps
that use only a single main-queue managed object context and cause the UI to stutter.

- when edits are being made to user data,
it’s helpful to treat a managed object context as a set of changes that the app can discard
if it no longer needs them. Using child contexts makes this possible.
