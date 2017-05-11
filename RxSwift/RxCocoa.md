RxCocoa
=======

- Work on the main thread
- Can't emit errors


Driver
------
- Bind an observable to a UI element
- Replays latest element
- ```as Driver()```

ControlProperty
---------------
- Reactive wrapper around UI Property
- ```rx``` namespace
- Replays latest element
- Automatically emits ```completed``` and ```deinit```

ControlEvent
------------
- Rx wrapper around UI event
- ```rx``` namespace
- Does not replay latest element
- Automatically emits ```completed``` and ```deinit```
