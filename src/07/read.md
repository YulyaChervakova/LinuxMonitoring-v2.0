# LinuxMonitoring v2.0

## Part 7. **Prometheus** и **Grafana**
**Prometheus** port 9090 (http://localhost:9090)
**Grafana** port 3000 (http://localhost:3000)
##### Добавить на дашборд **Grafana** отображение ЦПУ, доступной оперативной памяти, свободное место и кол-во операций ввода/вывода на жестком диске
![linux_monitoringv2.0](img/1.png)

##### Запустить ваш bash-скрипт (#part-2-засорение-файловой-системы)
##### Посмотреть на нагрузку жесткого диска (место на диске и операции чтения/записи)
![linux_monitoringv2.0](img/2.png)


##### Посмотреть на нагрузку жесткого диска, оперативной памяти и ЦПУ `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`
![linux_monitoringv2.0](img3.png)


