# otus-linux-pam
Скопировать файл admin_weekend.sh в  /usr/local/bin/admin_weekend.sh
В /etc/pam.d/sshd добавить строку:
```
account    required     pam_exec.so /usr/local/bin/admin_weekend.sh
```
Обязательно добавить права на исполнение, иначе будем получать ошибку с кодом 13:
```
chmod +x /usr/local/bin/admin_weekend.sh
```

Нужных пользователей добавить в группу с названием admin (например - day):
```
groupadd admin
usermod -a -G admin day
```

Всё, вход в субботу и вскоресенье будет работать только если пользователь состоит в группе, включаеющей в название слово "admin".

Чтобы проверить можно отключить chronyd и выставить нужное время:

```
systemctl stop chronyd.service
date --set="Jan  7 20:24:33 UTC 2023"
```
