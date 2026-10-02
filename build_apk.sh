#!/bin/bash
set -e

echo "=== Aurora Music: Сборка APK ==="

# Переходим в директорию, где лежит сам скрипт
cd "$(dirname "$0")"

# Делаем gradlew исполняемым (после распаковки ZIP на Linux права часто сбрасываются)
if [ -f "./gradlew" ]; then
    chmod +x ./gradlew 2>/dev/null || true
    GRADLE_CMD="bash ./gradlew"
elif command -v gradle >/dev/null 2>&1; then
    GRADLE_CMD="gradle"
else
    echo "Ошибка: Не найден gradlew или системный gradle!"
    exit 1
fi

echo "Запуск Gradle сборки через $GRADLE_CMD..."
$GRADLE_CMD :app:assembleFossMobileUniversalDebug

echo ""
echo "=== Сборка успешно завершена! ==="
echo "Собранный APK файл:"
find app/build/outputs/apk -type f -name "*.apk" 2>/dev/null || true
