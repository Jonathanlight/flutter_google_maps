# Flutter Google Maps


# 1 Add this to your package's pubspec.yaml file:
```
dependencies:
   google_maps_flutter: ^0.4.0
```

# 2 Get an API key at :
https://cloud.google.com/maps-platform/.

# 3 Config API KEY

- Android 
Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:

```
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```

- iOS 
Specify your API key in the application delegate ios/Runner/AppDelegate.m:

```
#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GMSServices provideAPIKey:@"YOUR KEY HERE"];
  [GeneratedPluginRegistrant registerWithRegistry:self];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
@end
```

![img](https://github.com/jonathankablan/flutter_google_maps/blob/master/Screenshot.png)
