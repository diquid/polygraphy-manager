@echo off
chcp 65001 > nul

REM Если нет venv — создаем и ставим зависимости
if not exist venv (
    echo Создаем виртуальное окружение...
    wsl python3 -m venv venv

    echo Устанавливаем зависимости...
    wsl ./venv/bin/python -m pip install --upgrade pip
    wsl ./venv/bin/pip install -r requirements.txt flask-sqlalchemy flask-bcrypt psycopg2 flask-login flask-wtf
) else (
    echo Виртуальное окружение уже существует
)

REM Запуск Flask
echo Запуск Flask...
wsl ./venv/bin/python -m flask run --host=127.0.0.1

pause