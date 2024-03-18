## Question 1

### Prerequisites

- Flutter 3.19.3

### Setup

#### Setup Android maps API key

Open `android/local.properties`, add maps API key `maps.api.key` like:

```
maps.api.key=XXXXXXXXXX
```

#### Setup iOS maps API key

Open `ios/Runner/Info.plist`, add maps API key `MAPS_API_KEY` like:

```
<key>MAPS_API_KEY</key>
<string>XXXXXXXXXX</string>
```

#### Setup data API key

Open `lib/constants.dart`, add data API key `apiKey` like:

```
const String apiKey = 'XXXXXXXXXX';
```

#### Install dependencies

Open terminal, run:

```
flutter pub get
```

### Run

Open an iOS simulator or an Android emulator, run:

```
flutter run
```

### Test

Open terminal, run:

```
flutter test
```
