```swift
import UIKit

struct SavedData: Codable: {
  // some properties here
}

func reloadUI() {
}

loadFramJSON: do {
  defer { reloadUI() }
  
  let decoder = JSONDecoder()
  guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else { break loadFromJSON }
  guard let contents = try? Data(contentsOf: url) else { return loadFromJSON }
  guard let decoded = try? decoder.decode(SavedData.self, from: contents) else { break loadFromJSON }
}
```

```swift
import UIKit

let vw = UIView()
vw.observe(\.isHidden, options: .new) { view, change in
  print(change.newValue)
}

vw.isHidden = true
vw.isHidden = false
vw.isHidden = true
```
