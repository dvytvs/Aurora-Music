#!/bin/bash
set -e

echo "=== Aurora Music: Сборка APK ==="
echo "Запуск Gradle сборки..."

if [ -f "./gradlew" ]; then
    GRADLE_CMD="./gradlew"
else
    GRADLE_CMD="gradle"
fi

$GRADLE_CMD :app:assembleFossMobileUniversalDebug

echo ""
echo "=== Сборка успешно завершена! ==="
echo "Собранный APK файл:"
find app/build/outputs/apk -type f -name "*.apk"
