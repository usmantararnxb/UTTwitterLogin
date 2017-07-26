
[![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)](https://img.shields.io/badge/swift-3.0-orange.svg?style=flat.svg)
[![Support Dependecy Manager](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)](https://img.shields.io/badge/support-CocoaPods-red.svg?style=flat.svg)
[![Version](https://img.shields.io/cocoapods/v/UTSocialLogin.svg?style=flat)](http://cocoapods.org/pods/UTSocialLogin)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)](https://img.shields.io/badge/License-MIT-brightgreen.svg?style=flat.svg)
[![Platform](https://img.shields.io/cocoapods/p/UTSocialLogin.svg?style=flat)](http://cocoapods.org/pods/UTSocialLogin)


## Features
---

- [x] Social login with Facebook, Google+ and Twitter with single instance
- [x] Returns UTSocialUser object with all required fields
- [x] Calls one methods only for you desired login, easy to integrate



## Pod Installation
 

### CocoaPods
 
 [CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:
 
 ```bash
 $ gem install cocoapods
 ```
 
 
 To integrate UTSocialLogin into your Xcode project using CocoaPods, specify it in your `Podfile`:
 
 ```ruby
 source 'https://gitlab.vteamslabs.com/appdev360/iOS-Components.git'
 platform :ios, '9.0'
 use_frameworks!
 
 target '<Your Target Name>' do
 pod 'UTSocialLogin'
 end
 ```
 
 Then, run the following command:
 
 ```bash
 $ pod install
 ```


# Usage

## Facebook Login

* Please visit [Facebook Developer Site](https://developers.facebook.com) to create a new application and follow the instructions to get facebook App-ID setup in plist file of your Xcode project.



#### Step 1

* Install the UISocialManager pod.
* Add following code in your  ``` Appdelegate.swift ``` file,

```swift 

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

	return UTSocialManager.facebookSharedInstanceDelegate(application: application, launchOptions: launchOptions)
}

```

#### Note

* You don't need to add func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) in your AppDelegate, because I have already implemeted its extension in AppDelegate+UTSocialLogin file for your ease.


#### Step 2

* Create the UTSocialManager instance in your controller to authenticate user and get its facebook profile.

``` fileprivate let socialManager = UTSocialManager() ```

* Login the user using 'socialManager' as given below 

```swift 

 
socialManager.loginWithFacebookFrom(vc: self, success: { (user) in
    
    //UTSocialUser for required fields
    //You can get values etc user.socialID, user.authToken etc         
    print(user.email)
            
}) { (error) in
            
    print((error?.userInfo[NSLocalizedDescriptionKey])!)
            
}

```


* You will get a UTSocialUser in return which you will have socialID, authToken, authTokenSecret, name, firstName, lastName, email and imageUrl

* For Logout

```swift


socialManager.logoutFacebookUser()

 
```

 
* That's it. You integrated Facebook Login successfully. Enjoy!




## Twitter Login

* Please visit [Twitter Apps Site](https://apps.twitter.com) to create a new application and follow the instructions to get twitter Consumer Key and Consumer Secret.



#### Step 1

* Install the UISocialManager pod.
* Add following code in your  ``` Appdelegate.swift ``` file,

```swift 


let twitterConsumerKey = "YourConsumerKey"
let twitterConsumerSecret = "YourConsumerSecret"

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	
	UTSocialManager.twitterSharedInstanceDelegate(withConsumerKey: twitterConsumerKey, andConsumerSecret: twitterConsumerSecret)

	return true
}


```

#### Note

* You don't need to add func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) in your AppDelegate, because I have already implemeted its extension in AppDelegate+UTSocialLogin file for your ease.


#### Step 2

* Create the UTSocialManager instance in your controller to authenticate user and get its facebook profile.

``` fileprivate let socialManager = UTSocialManager() ```

* Login the user using 'socialManager' as given below 

```swift 

 
socialManager.loginWithTwitterFrom(vc: self, success: { (user) in
    
    //UTSocialUser for required fields
    //You can get values etc user.socialID, user.authToken etc         
    print(user.email)
            
}) { (error) in
            
    print((error?.userInfo[NSLocalizedDescriptionKey])!)
            
}


```

* You will get a UTSocialUser in return which you will have socialID, authToken, authTokenSecret, name, firstName, lastName, email and imageUrl

* For Logout

```swift


socialManager.logoutTwitterUser()
 

```

 
* That's it. You integrated Twitter Login successfully. Enjoy!

xcode-select --install

## Google Login

* Please visit [Google Developer Site](https://developers.google.com) to create a new application and follow the instructions to get GoogleService-Info and add it in your Xcode project.


#### Step 1

* Install the UISocialManager pod.
* Add following code in your  ``` Appdelegate.swift ``` file,

```swift 

let googleClientId = "Get Your Client ID from GoogleService-Info.plist you downloaded"

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

	UTSocialManager.UTSocialManager.setupGoogleClientId(clientId:googleClientId)

	return true
}


```

#### Note

* You don't need to add func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) in your AppDelegate, because I have already implemeted its extension in AppDelegate+UTSocialLogin file for your ease.


#### Step 2

* Conform UTSocialManagerDelegate and implements its method for getting user object

```swift


extension YourController: UTSocialManagerDelegate {
    
    
    func googleLoginSuccess(user: UTSocialUser) {
        
        print(user.email)
        
    }
    
    
    func googleLoginFailed(error: NSError?) {
        
        print((error?.userInfo[NSLocalizedDescriptionKey])!)
        
    }
}


```


#### Step 3

* Create the UTSocialManager instance in your controller to authenticate user and get its facebook profile.

``` fileprivate let socialManager = UTSocialManager() ```

* Login the user using 'socialManager' as given below 

```swift 

 
socialManager.delegate = self
socialManager.loginWithGoogle()


```


* You will get a UTSocialUser in return which you will have socialID, authToken, authTokenSecret, name, firstName, lastName, email and imageUrl

* For Logout

```swift


socialManager.logoutGoogleUser()
 

```

 
* That's it. You integrated Google+ Login successfully. Enjoy!


## Manual Installation


# Usage

* Include source folder in your project.

* Create Facebook, Twitter or Google+ as told above.

* Create the UTSocialManager instance in your controller to authenticate user and get its facebook profile.

``` fileprivate let socialManager = UTSocialManager() ```

* Use 'socialManager' to call required login method as told above.



## License

UTSocialLogin is available under the MIT license. See the LICENSE file for more info.

 

## Author

**Usman Tarar** - (https://gitlab.vteamslabs.com/usman.tarar)
