#!/bin/bash

# Параметры веб-сервера
server="nginx" # сервер
port=80 # порт веб сервера

# Проверка доступрности порта
nc -z -w5 192.168.0.14 80
if [[ $? -eq 0 ]]; then
echo "Порт 80 веб-сервера $server на хосте 192.168.0.14 доступен"
else
echo "Порт 80 веб-сервера $server на хосте 192.168.0.14 недоступен"    
exit 1
fi

# Проверка существования файла стартовой страницы

html_file=/var/www/html/index.nginx-debian.html # путь к файлу стартовой страницы nginx
if [[ -f $html_file ]]; then
echo "Файл index.nginx-debian.html существует в root-директории сервера $server"
else
echo "Файл index.nginx-debian.html не существует в root-директории сервера $server"    
exit 1
fi
