# Домашнее задание к занятию 1 «Disaster recovery и Keepalived» Зубенко Константин Викторович



### Задание 1
- Дана [схема](1/hsrp_advanced.pkt) для Cisco Packet Tracer, рассматриваемая в лекции.
- На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)
- Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).
- Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.
- На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.

Ответ:

![alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/69.png)

![Схема решения](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/1-hsrp_advanced_Netology.pkt)


### Задание 2
- Запустите две виртуальные машины Linux, установите и настройте сервис Keepalived как в лекции, используя пример конфигурационного [файла](1/keepalived-simple.conf).
- Настройте любой веб-сервер (например, nginx или simple python server) на двух виртуальных машинах
- Напишите Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html в root-директории данного веб-сервера.
- Настройте Keepalived так, чтобы он запускал данный скрипт каждые 3 секунды и переносил виртуальный IP на другой сервер, если bash-скрипт завершался с кодом, отличным от нуля (то есть порт веб-сервера был недоступен или отсутствовал index.html). Используйте для этого секцию vrrp_script
- На проверку отправьте получившейся bash-скрипт и конфигурационный файл keepalived, а также скриншот с демонстрацией переезда плавающего ip на другой сервер в случае недоступности порта или файла index.html


Ответ:

Запустим 2 виртуальные машины (192.168.0.14, 192.168.0.16), установим на них Keepalived, настроим конфигурационные файлы. Проверим работу сервисов и резервирование виртуального адреса (192.168.0.15) на ВМ - master.


![alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/75.png)

![alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/76.png)

![alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/77.png)

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/78.png)

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/79.png)

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/80.png)

Установим nginx на обеих ВМ, изменим текст страницы по умолчанию, чтобы было понятно к какому серверу получен доступ (ip).

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/81.png)

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/82.png)

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/83.png)
[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/84.png)


Создадим bash-скрипт, укажем его в конфигурационном файле Keepalived ,дополним конфигурационный файл блоком глобальных настроек с указанием пользователя скрипта, а также помменяем права на скрипт.

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/90.png)

Перезапустим Keepalived на обеих ВМ, проверим статус.

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/91.png)
[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/92.png)

Удалим файл index.nginx-debian.html с ВМ-Master (192.168.0.14), проверим работу скрипта, запустив его через терминал.
[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/93.png)
[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/94.png)

Проверим перенос виртуального IP (192.168.0.15) на другой сервер (192.168.0.16)

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/95.png)

Использованы следующие файлы стартовой страницы сервера, конфигурации и скрипта.

[alt text](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/img/95.png)

  [страница nginx ](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/index.nginx-debian.html) 
[конфигурационный файл  ](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/keepalived.conf) 
 [скрипт  ](https://github.com/konstanin-zubenko/Disaster-recovery-Keepalived/blob/main/ppcheck.sh) 