# Quick Start Guide

## Предварительные требования

1. Docker и Docker Compose установлены
2. JDBC драйверы загружены в `jars/`:
   - `postgresql-42.7.9.jar`
   - `clickhouse-jdbc-0.9.8-all.jar`

## Быстрый старт

### Шаг 1: Запустить контейнеры
```bash
docker-compose up -d

# Проверить статус
docker-compose ps
```

Ожидайте, пока все сервисы запустятся (обычно 30-60 секунд).

### Шаг 2: Загрузить исходные данные в PostgreSQL
Данные автоматически загружаются при запуске контейнера PostgreSQL благодаря скриптам в `init/` папке.

### Шаг 3: Запустить Spark ETL

1. Откройте браузер: `http://localhost:8889`
2. Пароля нет, просто нажмите Enter или пропустите
3. Откройте файл: `work/01_init_data_to_star.ipynb`
4. Запустите все ячейки по порядку (Cell → Run All)
5. Ждите завершения (займет несколько минут)

### Шаг 4: Создать отчеты

1. Откройте файл: `work/02_star_to_reports.ipynb`
2. Запустите все ячейки (Cell → Run All)
3. Отчеты будут созданы в ClickHouse

### Шаг 5: Проверить результаты

**Проверка в ClickHouse:**
```bash
docker exec solution_clickhouse clickhouse-client -u warehouse -p ch_pass_2025 << 'EOF'
SELECT name FROM system.tables WHERE database = 'warehouse';
EOF
```

## Контакты сервисов

- **PostgreSQL**: `localhost:5434`
  - БД: `bigdata_warehouse`
  - Пользователь: `warehouse_user`
  - Пароль: `secure_pass_2026`

- **Spark Jupyter**: `localhost:8889`

- **ClickHouse HTTP**: `localhost:8124`
  - Пользователь: `warehouse`
  - Пароль: `ch_pass_2026`

## Очистка

```bash
# Остановить контейнеры
docker-compose down

# Удалить все данные
docker-compose down -v

# Перезагрузить всё с нуля
docker-compose down -v && docker-compose up -d
```
