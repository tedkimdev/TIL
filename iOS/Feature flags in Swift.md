Feature Flags
=============


Conditional compilation
------------------------
```swift
class DataBaseFactory {
    func makeDatabase() -> Database {
        #if DATABASE_REALM
        return RealmDatabase()
        #else
        return CoreDataDatabase()
        #endif
    }
}
```

Static flags
------------
```swift
struct FeatureFlags {
    static let isDemo = false
    static let searchEnabled = false
    static let maximumNumberOfFavorites = 10
    static let allowLandscapeMode = true
}
```

```swift
extension ListViewController {
    func addSearchIfNeeded() {
        // If the search feature shouldn't be enabled, we simply return
        guard FeatureFlags.searchEnabled else {
            return
        }

        let resultsVC = SearchResultsViewController()
        let searchVC = UISearchController(
            searchResultsController: resultsVC
        )

        searchVC.searchResultsUpdater = resultsVC
        navigationItem.searchController = searchVC
    }
}
```


Runtime flags
-------------
```swift
struct FeatureFlags {
    let isDemo: Bool
    let searchEnabled: Bool
    let maximumNumberOfFavorites: Int
    let allowLandscapeMode: Bool
}

extension FeatureFlags {
    init(dictionary: [String : Any]) {
        searchEnabled = dictionary.value(for: "search", default: false)
        maximumNumberOfFavorites = dictionary.value(for: "favorites", default: 10)
        allowLandscapeMode = dictionary.value(for: "landscape", default: true)
    }
}

private extension Dictionary where Key == String {
    func value<V>(for key: Key,
                  default defaultExpression: @autoclosure () -> V) -> V {
        return (self[key] as? V) ?? defaultExpression()
    }
}
```

```swift
class FeatureManager {
    private let featureFlags: FeatureFlags

    init(featureFlags: FeatureFlags) {
        self.featureFlags = featureFlags
    }

    func canUserAddMoreFavorites(_ user: User) -> Bool {
        let maxCount = featureFlags.maximumNumberOfFavorites
        return user.favorites.count < maxCount
    }
}
```
