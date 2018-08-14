Action Extension
================

- Create Action Extension as a ```New Target```
- Set App groups

.plist
------
- NSExtensionActivationSupportsImageWithMaxCount

```xml
<key>NSExtension</key>
<dict>
  <key>NSExtensionAttributes</key>
  <dict>
    <key>NSExtensionActivationRule</key>
    <dict>
      <key>NSExtensionActivationSupportsImageWithMaxCount</key>
      <integer>1</integer>
    </dict>
  </dict>
  <key>NSExtensionMainStoryboard</key>
  <string>MainInterface</string>
  <key>NSExtensionPointIdentifier</key>
  <string>com.apple.ui-services</string>
</dict>
```

Add Action Extension Icon
--------------------------
Action Extension Project Setting > Build Settings

```Asset Catalog App Icon Set Name```
Set AppIcon under Action Extension
