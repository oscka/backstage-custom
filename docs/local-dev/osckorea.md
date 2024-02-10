---
id: osckorea
title: osckorea
description: osckorea
---

- starter
https://github.com/oscka/starter/blob/main/catalog-info.yaml

- backstage-custom
https://github.com/oscka/backstage-custom/blob/main/catalog-info.yaml

1. 개요
내부적으로 Backstage 를 사용후 도입 검토를 위해 개발서버에 backstage 를 배포했습니다.

외부 (osckorea wifi 에 접속되지않은 상태) 에서 backstage 접속을 원하는경우 개발서버 접속 정보 [개발서버 접속 정보](https://osc-korea.atlassian.net/wiki/spaces/consulting/pages/822476822) 페이지를 참조 바랍니다.



```sh
192.168.41.50, oscka / osckorea!

## 서버 접근
ssh oscka@192.168.41.50 -p 22

## vagrant 서버 접근
ssh vagrant@192.168.41.51 -p 22 -i /Users/osckorea/DEV/vagrant-work/private-key/dev2-51-private-key
```

hosts 파일 추가후 https://backstage.openmsa.monster 로 접속하면 backstage web ui 를 확인할 수 있습니다.

for window

```sh
# vim C:\Windows\System32\drivers\etc\hosts
192.168.41.52  backstage.openmsa.monster argocd-oscka.openmsa.monster nexus-oscka.openmsa.monster docker.openmsa.monster
```

for mac

```sh
# sudo vim /private/etc/hosts
192.168.41.52  backstage.openmsa.monster argocd-oscka.openmsa.monster nexus-oscka.openmsa.monster docker.openmsa.monster
```
 
backstage custom 코드는 [GitHub](https://github.com/oscka/backstage-custom) 에서 확인할 수 있습니다.

## 연동 정보
Backstage 는 아래 솔루션과 연동돼있으며 각 접속정보는 아래에서 확인하시면 됩니다.

**SonarQube**
URL          | http://192.168.41.50:9000
ID             | admin
Password | osckorea!

**Jenkins**
URL          | http://192.168.41.50:8080/
ID             | admin
Password | osckorea!

**ArgoCD**
URL          | https://argocd-oscka.openmsa.monster/
ID             | admin
Password | osckorea!

**Nexus**
URL | https://nexus-oscka.openmsa.monster/
ID | admin
Password | osckorea!



