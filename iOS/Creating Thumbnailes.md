Creating Thumbnailes
====================
```swift
UIGraphicsBeginImageContextWithOptions(size: CGSize, opaque: BOOL, scale: CGFloat)
```
- 드로잉 환경을 비트맵으로 랜더링하도록 구성.
- This creates a new canvas for drawing at a size specified.

Parameter 2: true to draw on a transparent background

Parameter 3: the scale factor you want to draw with, which is used to control retina graphics
- value 1:  to draw at exact sizes,
- 2 : to write a double sizes for retina resolution.
- 0 : use whichever scale the device uses. It will be 200x200 on non-retina devices, 400x400 on retina devices, and 600x600 on retina HD devices.

```swift
image.draw(in: CGSize)
```
- context 에 원본 이미지를 그린다.

```swift
UIGraphicsGetImageFromCurrentImageContext()
```
- 현재 비트맵 기반 context의 내용을 이미지로 반환

```swift
UIGraphicsEndImageContext()
```
- 현재 그래픽 context를 제거
