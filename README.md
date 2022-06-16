# Inception-of-Things
_System Administration related exercise_

###
### p1: K3s and Vagrant
`vagrant up` creates and configures guest machines

`vagrant halt` shuts down the running machine

`vagrant reload`  halt + up

`vagrant destroy` stops the running machine and destroys all resources that were created

`vagrant status` tells the state of the machines

`vagrant ssh [name]` will SSH into a machine and give you access to a shell

`kubectl get nodes` получить все рабочие узлы

###
### p2: K3s and three simple applications

`kubectl get all` вывести все сущности

`kubectl apply -f [файл.yaml]` создать ресурсы из файла

`kubectl delete -f [файл.yaml]` удалить ресурсы из файла

`kubectl exec -it [имя_пода] -- /bin/sh` зайти в контейнер

`kubectl describe ingress`

###
### p3: K3d and Argo CD

###
### References:

- [Cтатья на Notion](https://zigzag-talon-29c.notion.site/Vagrant-a569198bd62e462daa9fd1dc09db0d97) + [Видео по ней](https://www.youtube.com/watch?v=0HVukklzCQg)
- [Скачиваем Vargant](https://www.vagrantup.com/downloads)
- [Vagrant Boxes](https://app.vagrantup.com/boxes/search)
- [Vagrant Documentation](https://www.vagrantup.com/docs)
- [Vagrantfile Documentation](vagrantup.com/docs/vagrantfile)
- [VBoxManage - утилита для внесения изменений в виртуальную машину из командной строки](https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/vboxmanage-modifyvm.html)
- [system()](https://ruby-doc.org/core-2.2.2/Kernel.html#method-i-system)
- [Как исправить ошибку с диапазоном IP-адресов](https://www.virtualbox.org/manual/ch06.html#network_hostonly)
- [Установить net-tools в CentOS (для команды ifconfig)](https://www.itzgeek.com/how-tos/linux/centos-how-tos/ifconfig-command-not-found-on-centos-8-rhel-8-quick-fix.html)
- [K8s documentation](https://kubernetes.io/ru/docs/home/)
- [Про мини-кластеры в Kubernetes в целом](https://habr.com/ru/company/flant/blog/572188/)
- [K3s](https://k3s.io/)
- [K3d](https://k3d.io/v5.4.2/)
- [K3s documentation](https://rancher.com/docs/k3s/latest/en/)
- [K3s tuto](https://www.youtube.com/watch?v=1hwGdey7iUU)
- [Rancher K3s first steps](https://gitlab.com/cloud-versity/rancher-k3s-first-steps)
- [Шпаргалка по kubectl](https://kubernetes.io/ru/docs/reference/kubectl/cheatsheet/)
- []()
- []()
- []()
- []()
- []()


