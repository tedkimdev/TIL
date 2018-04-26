Naming of boolean variables
===========================

is
--
is + Noun
```swift
func isDescendant(of view: UIView) -> Bool  //UIView: "view의 자식인가?" 
```

is + ~ing
```swift
var isExecuting: Bool { get } //Operation: "오퍼레이션의 작업이 현재 실행 중인가?"
var isPending: Bool { get } //MSMessage: "메시지가 보내지기 전 대기 중인가?"
```

is + Adj
```swift
var isOpaque: Bool { get set }
var isSelected: Bool { get set }
var isHighlighted: Bool { get set }
var isHidden: Bool { get set } 

var isEdit: Bool // X

var isEditable: Bool //편집할 수 있는가?
var isEditing: Bool  //편집 중인가?
var canEdit: Bool    //편집할 수 있는가?
```

can, should, will ...
---------------------
```swift
var canBecomeFirstResponder: Bool { get } //UIResponder: first responder가 될 수 있는가?
var shouldRefreshRefetchedObjects: Bool { get set } //NSFetchRequest: 가져온 값을 refresh 할 것인가?
```

Has
---
has + Noun
```swift 
var hasiCloudAccount: Bool { get } //CKUserIdentity: 관련된 iCloud 계정을 가지고 있는가?
var hasVideo: Bool { get set } //CXCallUpdate: 콜에 비디오가 포함되어 있는가?
```

has + p.p
```swift
var hasConnected: Bool { get } //CXCall: 콜이 연결되어 있는가?
var hasEnded: Bool { get } //CXCall: 콜이 끝났는가?
```

Verb Root
---------
- supports: ~을 지원하는가?
- includes: ~을 포함하는가?
- shows: ~을 보여줄 것인가?
- allows: ~을 허용할 것인가?
- accepts: ~을 받아 주는가?
- contains: ~을 포함하고 있는가?

```swift
var supportsVideo: Bool                    //CXProviderConfiguration: 비디오를 지원하는가?
var includesCallsInRecents: Bool           //CXProviderConfiguration
var showsBackgroundLocationIndicator: Bool //CLLocationManager
var allowsEditing: Bool                    //CNContactViewController: 편집을 허용하는가?
var acceptsFirstResponder: Bool            //NSResponder

var preservesSuperviewLayoutMargins: Bool //UIView
var returnsObjectsAsFaults: Bool          //NSFetchRequest
```

mutating uses verb root
```swift
mutating func sort() -> Void //in-place sort
```

nonmutating uses verb root + ed/ing
```swift
func sorted() -> [Element] //정렬된 새 배열을 리턴
```

ex)
bool, mutating, nonmutating
```swift
let overlaps: Bool = region1.overlaps(region2) //region1과 region2가 겹치는가?
region1.overlap(region2)                       //region1을 region2와 겹치는 부분으로 mutate
let region3 = region1.overlapping(region2)     //region1과 region2가 겹치는 부분만 새로운 region 인스턴스로 리턴
```

ref
---
https://soojin.ro/
