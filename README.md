# shared_preferences_ios_sn
Wraps Flutter shared_preferences plugin and provides an iOS Suite Name support, it's helpful for sharing data from App to iOS Widget.

# Why Need "Suite Name" Feature?

When you need to share your data from your App to iOS Widget

## Usage

### in pubspec.yaml:
```
shared_preferences_ios_sn: ^1.0.3

#shared_preferences: x.x.x //should comment 'shared_preferences' 
```
and just run the follow command to install the plugin:
```
flutter pub get
```

### in Flutter code:
```
//final prefs = SharedPreferences.getInstance();

//Instead, use SPUtil.withSuitName and prefs will works like a normal SharedPreferences instance in many different platforms.
final prefs = await SPUtil.withSuitName("<Your iOS GROUP NAME>");
prefs.setString("test_key", "test_value");

```


### in iOS Widget swift code:
```
//now you can get the SharedPreferences data from App in your widget code, for example:
//dont forget to add prefix "flutter." to the key:
print("test_key:",UserDefaults(suiteName: "<Your iOS GROUP NAME>")?.string(forKey: "flutter.test_key"))

```
