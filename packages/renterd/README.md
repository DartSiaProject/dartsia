# Renterd

**Renterd, is a package that was developed in dart code for flutter projects. Its purpose is to contain several return functions that can communicate with the Sia blockchain.**

*Note*: This package is still under development, and some functionnalities might not be available yet.


<!-- [github](https://github.com/flustora/flutter_flustora/tree/main/packages/flustora)

[Update log](https://github.com/flustora/flutter_flustora/blob/main/packages/flustora/CHANGELOG.md) -->

## **Features**

Renterd, is a package that operates in fours Modules such as:

#### Renterd
- [x] Bus
 - Accounts
 - Consensus
 - Contact 
 - hoster
 - object

- [x] Worker
 - worker_object

## **Usage**

### Add dependency

Please check the latest version before installation.
If there is any problem with the new version, please use the previous version

```yaml
dependencies:
  flutter:
    sdk: flutter
  # add renterd
  renterd: ^{latest version}
```

### Add the following imports to your Dart code

```dart
import 'package:renterd/renterd.dart';
```

### Initialize the main() function 

```dart
void main() async {
  renterdInit();
  runApp(const MyApp());
}
```

## **Examples**



<!-- je reviens ici pour mettre les exemples une fois le code validé -->

## **Packages Used**
* [x] **Dart Dependencies Used**
  - get_it: ^7.7.0
  - injectable: ^2.4.2
  - http: ^1.2.2
  
* [x] **Dart Dev_Dependencies Used**
  - mocktail: ^0.3.0
  - injectable_generator: ^2.6.1
  - build_runner: ^2.4.11

***
<p style="text-align: center"> Copyright &copy; 2024 DartSia All Rights Reserved</p>
