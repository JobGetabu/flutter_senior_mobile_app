echo '--- build runner ---'
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
echo '--- finished build runner ---'