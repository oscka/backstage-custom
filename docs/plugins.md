---
id: plugins
title: Plugins
description: Documentation on Introduction to Plugins
---



## 개요

- **참고**
  - [Backstage.io 검토](https://osc-korea.atlassian.net/wiki/spaces/consulting/pages/955842620)
  - [**Plugin List**](https://backstage.io/plugins)
  - [**Backstage Demo site**](https://demo.backstage.io/catalog?filters%5Bkind%5D=component&filters%5Buser%5D=all)
  - [**RedHat Showcase site**](https://showcase.janus-idp.io/catalog/default/component/backstage-showcase/kubernetes)
        

Backstage 에 플러그인을 추가하여 다양한 오픈소스 솔루션과 연동할 수있습니다.

Plugin 추가 작업은 대부분 아래와 같은 순서로 진행됩니다.

1.  yarn 을 이용하여 플러그인의 **npm 패키지 추가** (Frontend, Backend)

2.  Backstage 의 Frontend , Backend **코드 수정**

3.  **app-config.yaml** 에 설정 추가

4.  **catalog-info.yaml** 에 annotation 추가

## TODO Plugin 

**참고**
[TODO 플러그인 참고](https://github.com/backstage/backstage/tree/master/plugins/todo)

소스 코드에서 TODO 주석을 찾아볼 수 있는 Backstage Plugin

### TODO 주석 

![](assets/973373654/973373805.png?width=760)

기능구현을 하다보면 시간에 쫓기거나 우선순위때문에 잠깐 미뤄둬야 할
일들이 있습니다.

좀더 최적화시키고 리팩토링시킬 수 있을만한 구석이 있거나 추후 뭔가
의미있는 작업을 더 해야 할 필요성을 느낄때 해당 사항에 대해 TODO
주석으로 남겨놓습니다.

### Backstage TODO tab 

![](assets/973373654/973373808.png?width=760)

Backstage 에서는 소스 코드 상에 TODO 로 남긴 것을 Catalog > TODO 탭에서
확인할 수 있으며, File 을 클릭하면 Github 에 커밋된 파일로 이동할수 있습니다.


## Jenkins Plugin 

-   **참고**
    -   [Jenkins Plugin (Frontend)](https://github.com/backstage/backstage/tree/master/plugins/jenkins)
    -   [Jenkins Plugin (BackEnd)](https://github.com/backstage/backstage/tree/master/plugins/jenkins-backend)
        

Jenkins Plugin 은 Jenkins 에서 제공하는 ([Jenkins 공식문서](https://www.jenkins.io/doc/book/using/remote-access-api/)) REST API 를 호출하는 코드를 라이브러리로 만든 것입니다.

### Jenkins 접속 정보

-   [http://192.168.41.50:8080/](http://192.168.41.50:8080/)
-   admin
-   osckorea!

### Jenkins Build, Job Info 확인 

#### Latest Build 

![image-20240111-003324.png](assets/973373654/973373763.png?width=581)

#### Jenkins project list

![jenkins-1.png](assets/973373654/973373766.png?width=760)

#### View summary of a build 
![jenkins-2.png](assets/973373654/973373760.png?width=531)

#### Jenkins job list 

![jenkins-3.png](assets/973373654/973373757.png?width=760)

### Jenkins API Token 발급 

![](assets/973373654/973373802.png?width=760)

### setting 

-   app-config.yaml
 
```yaml
jenkins:
  baseUrl: ${JENKINS_URL}
  username: admin
  apiKey: ${JENKINS_TOKEN}
  instances:
    - name: departmentFoo
      baseUrl: ${JENKINS_URL}
      username: admin
      apiKey: ${JENKINS_TOKEN}
  # optionally add extra headers
  # extraRequestHeaders:
  #   extra-header: my-value
```



위에서 발급받은 Jenkins API Token 을 `JENKINS_TOKEN` env 를 생성하면됩니다.

-   `departmentFoo:`부분을 생략하면 기본 인스턴스로 간주됩니다.
    -   User 마다 Jenkins API Token 을 다르게 사용하도록 구분할경우 instances 하위에 배열형태로 추가하면 됩니다.

```yaml
# catalog-info.yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: starter
  annotations:
    jenkins.io/job-full-name: departmentFoo:starter
```

-   annotation 추가

    -   `jenkins.io/job-full-name: admin:starter`

    -   {jenkins instance name}:{job name}

## Nexus Repository Manager Plugin (**Image**) 

-   **참고**

    -   View information about the build artifacts in your Nexus Repository Manager in Backstage.

    -   [https://janus-idp.io/plugins/nexus-repository-manager/](https://janus-idp.io/plugins/nexus-repository-manager/)

Nexus Repository Manager Plugin 은 Nexus 에서 제공하는 ([Nexus
공식문서](https://help.sonatype.com/repomanager3/integrations/rest-and-integration-api/repositories-api)) REST API 를 호출하는 코드를 라이브러리로 만든 것입니다.

### Nexus 접속정보 
-   [https://nexus-oscka.openmsa.monster](https://nexus-oscka.openmsa.monster)
-   admin
-   osckorea!

### build artifacts 조회 

![](assets/973373654/973373787.png?width=760)

BUILD ARTIFACTS 탭에는 **VERSION** , **REPOSITORY** , **REPOSITORY TYPE** , **MANIFEST** , **MODIFIED** 및 **SIZE** 와 같은 빌드 아티팩트 및 관련 정보 목록이 포함되어 있습니다 .

### setting



```yaml
# app-config.yaml
proxy:
  endpoints:
    '/nexus-repository-manager':
      target: ${NEXUS_REPOSITORY_MANAGER_URL}
      headers:
        X-Requested-With: 'XMLHttpRequest'
        # Uncomment the following line to access a private Nexus Repository Manager using a token
        Authorization: Basic ${NEXUS_REPOSITORY_MANAGER_AUTH}
      changeOrigin: true
      # Change to "false" in case of using self hosted Nexus Repository Manager instance with a self-signed certificate
      secure: true
```



Private Nexus 로 구성돼있을 경우 인증과정이 필요합니다.

Nexus 에서 API 인증은 **username:password**를 **Base64**로 인코딩된 값을 사용하고 있습니다. 
base64 커맨드를 사용하여 값을 생성해 줍니다.

> *username이 admin 이고 password가 osckorea! 이면
>  *`admin:osckorea!` 를 인코딩한 `YWRtaW46b3Nja29yZWEh` 가 `env` 값이
> 됩니다.

 
 
```shell
$ echo -n 'admin:osckorea!' | base64
YWRtaW46b3Nja29yZWEh

----
export NEXUS_REPOSITORY_MANAGER_AUTH="YWRtaW46b3Nja29yZWEh"
```

-   catalog-info.yaml

```yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: starter
  annotations:
    nexus-repository-manager/docker.image-name: starter
```

-   annotation 추가

    -   `nexus-repository-manager/docker.image-name: starter`

starter 프로젝트의 경우 빌드결과물이 docker image 이므로 dokcer 어노테이션을 사용했습니다.

빌드 결과물이 maven - jar 이거나 npm - package 일경우 **사용가능한
annotation 확인
(**[**여기**](https://github.com/janus-idp/backstage-plugins/blob/main/plugins/nexus-repository-manager/ANNOTATIONS.md)**)** 한 후 빌드 결과물과 일치하는 annotation 을 사용하면
됩니다.

## SonarQube Plugin

**참고**
[https://github.com/backstage/backstage/blob/master/plugins/sonarqube/README.md](https://github.com/backstage/backstage/blob/master/plugins/sonarqube/README.md)

SonarQube Plugin 은 SonarQube 에서 제공하는 ([SonarQube
공식문서](https://docs.sonarsource.com/sonarqube/9.9/extension-guide/web-api/)) REST API 를 호출하는 코드를 라이브러리로 만든 것입니다.

### SonarQube 접속 정보

-   [http://192.168.41.50:9000/projects](http://192.168.41.50:9000/projects)
-   admin
-   osckorea!

### Code Quality 확인 

![image-20240111-003805.png](assets/973373654/973373754.png?width=771)

### setting 

-   SonarQube Token 발급

![image-20240111-002306.png](assets/973373654/973373772.png?width=717)

-   app-config.yaml
```yaml
sonarqube:
  baseUrl: ${SONARQUBE_URL}
  apiKey: ${SONARQUBE_TOKEN}
  instances:
    - name: specialProject
      baseUrl: ${SONARQUBE_URL}
      apiKey: ${SONARQUBE_TOKEN}
```



-   catalog-info.yaml
```yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: starter
  annotations:
    sonarqube.org/project-key: default/oscka_starter
```


-   annotation 추가

    -   `sonarqube.org/project-key: default/oscka_starter`

## Argo CD Plugin

-   참고

    -   [roadie.io argocd plugin](https://roadie.io/backstage/plugins/argo-cd/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=argo-cd)

    -   [**Optional**  ArgoCD BackEnd
        Plugin](https://www.npmjs.com/package/@roadiehq/backstage-plugin-argo-cd-backend)

ArgoCD Plugin 은 ArgoCD 에서 제공하는([ArgoCD 공식문서](https://argo-cd.readthedocs.io/en/stable/developer-guide/api-docs/)) REST API 를 호출하는 코드를 라이브러리로 만든 것입니다.
Backstage 카탈로그에 Application 의 현재 상태를 표시할 수 있습니다.

### ArgoCD 접속 정보

-   [https://argocd-oscka.openmsa.monster/](https://argocd-oscka.openmsa.monster/)
-   admin
-   osckorea!

### ArgoCD over view

![image-20240111-021258.png](assets/973373654/973373742.png?width=760)
![](assets/973373654/973373781.png?width=727)

아래 정보를 확인할 수 있다.

-   Repo Url
-   Repo Path
-   Destination Server
-   Destination Namespace
-   Sync Status
-   Images

![image-20240111-020629.png](assets/973373654/973373745.png?width=760)

Application 의 history 를 조회할 수 있고, history revision Limit 설정도 가능하다.

### ArgoCD - User, RBAC, Token

-   **참고**

    -   [https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#create-new-user](https://argo-cd.readthedocs.io/en/stable/operator-manual/user-management/#create-new-user)

**Argo CD API 를 사용하려면 토큰이 필요하며, 토큰은 Argo CD CLI 또는 UI를 통해 생성할 수 있습니다.**

![image-20240111-005435.png](assets/973373654/973373751.png?width=736)

Unable to generate new token: account \'admin\' does not have apiKey capability
admin 계정은 token 발급이 불가능하므로 별도의 계정을 생성하여 token 을 발급합니다.

**참고**
[https://github.com/argoproj/argo-cd/issues/14679](https://github.com/argoproj/argo-cd/issues/14679)

API access 에 관리자를 사용하는 것은 전혀 권장되지 않으며, 기본적으로
admin 사용자에게 apiKey 기능이 없는 이유라는 점을 명심하세요.
[[#6687(댓글)]](https://github.com/argoproj/argo-cd/issues/6687#issuecomment-878887020)


#### argocd user 생성
 
```shell
kubectl edit configmap argocd-cm -n argocd
```
 
 
```yaml
# vi argocd-cm.yaml
apiVersion: v1
data:
  accounts.oscka: apiKey,login
kind: ConfigMap
  labels:
    app.kubernetes.io/name: argocd-cm
    app.kubernetes.io/part-of: argocd
  name: argocd-cm
  namespace: argocd                                       
```

-   `argocd-cm.yaml` configmap 을 수정한다.

    -   data 하위에 `accounts.oscka: apiKey,login` 추가

#### 생성한 user role 수정
 
```yaml
# vi argocd-rbac-cm.yaml
apiVersion: v1
data:
  policy.csv: |
    g, oscka, role:admin
  policy.default: role:''
kind: ConfigMap
  labels:
    app.kubernetes.io/name: argocd-rbac-cm
    app.kubernetes.io/part-of: argocd
  name: argocd-rbac-cm
  namespace: argocd
```

-   argocd 계정의 권한은 policy.csv파일로 관리하며, policy.csv는 argocd-rbac-cm configmap에서 관리합니다
    
-   `argocd-rbac-cm.yaml` 을 수정한다.
    -   data 하위에 oscka 계정의 role 을 admin 으로 지정
    -   `g, oscka, role:admin`
        -   Role definitions and bindings are in the form:
            `g, subject, inherited-subject`
 

운영 환경에서는 사용자에 특정 ROLE 을 지정해야하지만, 테스트 단계이므로 본문에서는 admin ROLE 을 부여합니다.

#### user password 생성
```shell
# -- Get full users list
➜  argocd account list
NAME   ENABLED  CAPABILITIES
admin  true     login
oscka  true     apiKey, login

# -- Set user password (for oscka)
➜ argocd account update-password --account oscka --new-password osckorea!
*** Enter password of currently logged in user (admin):
Password updated
```

-   configmap 을 수정하여 생성한 user 의 password 를 생성해야합니다.

    -   admin 계정의 password 필요

#### argocd token 발급

 
```shell
# -- Generate auth token
# if flag --account is omitted then Argo CD generates token for current user
➜ argocd account generate-token --account oscka
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJvc2NrYTphcGlLZXkiLCJuYmYiOjE3MDQ5MzU0NzEsImlhdCI6MTcwNDkzNTQ3MSwianRpIjoiZDUyZGI5OGMtZWU3ZS00MDI1LWEyMzEtN2RjNjNjOWVlMzcwIn0.GlJSw7PRMTyaXjNA9WPDQuH26xHoTvMNUJ9fSzN_oCE
```



-   해당 shell 에서 발급한 토큰을 `ARGOCD_AUTH_TOKEN` env 에 세팅해주면 됩니다.

또는 Argo CD UI의 `/settings/accounts/<your-account>` "Tokens" 섹션에서 "Generate New"을 클릭하면 됩니다.

#### argocd account 확인

 
 
```shell
# -- Get specific user details
➜  argocd account get --account oscka
Name:               oscka
Enabled:            true
Capabilities:       apiKey, login

Tokens:
ID                                    ISSUED AT                  EXPIRING AT
0add791e-fcac-4ac6-bc89-82580a156c35  2024-01-11T10:11:34+09:00  never
```



Capabiliteis 에 apiKey 가 있고, Token 이 발급되어 있는것을 확인할 수 있습니다. (만료일 없음)


### setting

-   app-config.yaml
```yaml
proxy:
  endpoints:
    '/argocd/api':
      target: ${ARGOCD_URL}/api/v1/
      changeOrigin: true
      # only if your argocd api has self-signed cert
      secure: false
      headers:
        Cookie:
          $env: ARGOCD_AUTH_TOKEN
```



-   catalog-info.yaml
```yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: starter
  annotations:
    argocd/app-name: starter
```



-   annotation 추가

    -   `argocd/app-name: starter`

# GitHub Actions Plugin

-   **참고**
    -   [GitHub Action Plugin](https://github.com/backstage/backstage/tree/master/plugins/github-actions)

### GitHub Actions 확인

![image-20240111-024922.png](assets/973373654/973373739.png?width=760)

### **Provide OAuth credentials** 

![github-action-1.png](assets/973373654/973373736.png?width=760)
![image-20240111-043530.png](assets/973373654/973373733.png?width=760)

1.  **[Organizations > Setting]** [**[OAuth App]**](https://developer.github.com/apps/building-oauth-apps/creating-an-oauth-app/) **[생성]**

    1.  callback URL :
        `http://localhost:7007/api/auth/github/handler/frame`

![github-oauth-2.png](assets/973373654/973373730.png?width=757)

1.  새로 생성된 앱의 설정 페이지에서 Clinet ID 와 Clinet Secret 을
    가져와 AUTH_GITHUB_CLIENT_ID 및 AUTH_GITHUB_CLIENT_SECRET
    environment 에 입력합니다.

### Setting

-   Install the plugin dependency in your Backstage app package

```shell
# From your Backstage root directory
yarn add --cwd packages/app @backstage/plugin-github-actions
```

-   app-config.yaml
```yaml
# vi app-config.yaml
integrations:
  github:
    - host: github.com
      token: ${GITHUB_TOKEN}

auth:
  # see https://backstage.io/docs/auth/ to learn about auth providers
  environment: development
  providers:
    github:
      development:
        clientId: ${AUTH_GITHUB_CLIENT_ID}
        clientSecret: ${AUTH_GITHUB_CLIENT_SECRET}
```

-   catalog-info.yaml
```yaml
# vi catalog-info.yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: starter
  annotations:
    github.com/project-slug: oscka/starter
```


-   annotation

    -   `github.com/project-slug`

## env

### start.ps1 (window PowerShell) 
 
```powershell
# vi start.ps1
Write-Host "Setting environment variables...";

$env:POSTGRES_HOST="localhost";
$env:POSTGRES_PORT="5432";
$env:POSTGRES_USER="root";
$env:POSTGRES_PASSWORD="root1234";

$env:GITHUB_TOKEN="ghp_yQhD********************";
$env:AUTH_GITHUB_CLIENT_ID="ef95b5f********";
$env:AUTH_GITHUB_CLIENT_SECRET="151e5f3ffa6********************************";

$env:SONARQUBE_URL="http://192.168.41.50:9000";
$env:SONARQUBE_TOKEN="887b886cf003bfcbb37363bc041cbd7358184a2c";

$env:JENKINS_URL="http://192.168.41.50:8080";
$env:JENKINS_TOKEN="1170e822a22c501738638ae9f2252fc77";

$env:NEXUS_REPOSITORY_MANAGER_URL="http://192.168.41.50:8081";
$env:NEXUS_REPOSITORY_MANAGER_AUTH="YWRtaW46b3Nja29yZWEh";

$env:ARGOCD_URL="http://192.168.41.50:9000";
$env:ARGOCD_AUTH_TOKEN="argocd.token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJhbGljZTphcGlLZXkiLCJuYmYiOjE3MDQ4NzgzNDksImlhdCI6MTcwNDg3ODM0OSwianRpIjoiZmQ5NDVkMzgtMTM0OS00MGMzLWEyM2QtZmRlODkxNjQ2OWVlIn0.KfHxHBtuUl4dNpmamj_57XdeDG4U2IRiO18DeVpLE0o";

Write-Host "Initializing process..."
```

 

### environment.sh (mac, linux) 
```shell
# vi environment.sh
export POSTGRES_HOST="localhost"
export POSTGRES_PORT="5432"
export POSTGRES_USER="root"
export POSTGRES_PASSWORD="root1234"

export GITHUB_TOKEN="ghp_yQhD********************"
export AUTH_GITHUB_CLIENT_ID="ef95b5f********"
export AUTH_GITHUB_CLIENT_SECRET="151e5f3ffa6********************************"

export SONARQUBE_URL="http://192.168.41.50:9000"
export SONARQUBE_TOKEN="887b886cf003bfcbb37363bc041cbd7358184a2c"

export JENKINS_URL="http://192.168.41.50:8080"
export JENKINS_TOKEN="1170e822a22c501738638ae9f2252fc77"

export NEXUS_REPOSITORY_MANAGER_URL="http://192.168.41.50:8081"
export NEXUS_REPOSITORY_MANAGER_AUTH="YWRtaW46b3Nja29yZWEh"

export ARGOCD_URL="http://192.168.41.50:9000"
export ARGOCD_AUTH_TOKEN="argocd.token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJhbGljZTphcGlLZXkiLCJuYmYiOjE3MDQ4NzgzNDksImlhdCI6MTcwNDg3ODM0OSwianRpIjoiZmQ5NDVkMzgtMTM0OS00MGMzLWEyM2QtZmRlODkxNjQ2OWVlIn0.KfHxHBtuUl4dNpmamj_57XdeDG4U2IRiO18DeVpLE0o"
```

 

## 추가 Plugins? 

### **Source Control Mgmt**

-   GitHub Insights Plugin
    -   [https://roadie.io/backstage/plugins/github-insights/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=github-insights](https://roadie.io/backstage/plugins/github-insights/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=github-insights)

-   GitHub Pull Requests Plugin
    -   [https://roadie.io/backstage/plugins/github-pull-requests/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=github-pull-requests](https://roadie.io/backstage/plugins/github-pull-requests/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=github-pull-requests)

### CI/CD 

-   GitLab
    -   [https://github.com/immobiliare/backstage-plugin-gitlab](https://github.com/immobiliare/backstage-plugin-gitlab)

-   Harbor

    -   [https://github.com/container-registry/backstage-plugin-harbor](https://github.com/container-registry/backstage-plugin-harbor)

### **Agile Planning**

-   Jira

    -   View Jira summary for your projects in Backstage.

    -   [https://roadie.io/backstage/plugins/jira/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=jira](https://roadie.io/backstage/plugins/jira/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=jira)

-   Jira Dashboard

    -   **Issue (incoming issues, open issues and assigned to you.)**

    -   [https://github.com/AxisCommunications/backstage-plugins/blob/main/plugins/jira-dashboard/README.md](https://github.com/AxisCommunications/backstage-plugins/blob/main/plugins/jira-dashboard/README.md)

### Monitoring

-   Prometheus

    -   Prometheus plugin provides visualization of Prometheus metrics
        and alerts

    -   [https://roadie.io/backstage/plugins/prometheus/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=prometheus](https://roadie.io/backstage/plugins/prometheus/?utm_source=backstage.io&utm_medium=marketplace&utm_campaign=prometheus)

-   Grafana

    -   [https://github.com/K-Phoen/backstage-plugin-grafana/](https://github.com/K-Phoen/backstage-plugin-grafana/)

### **Security** 

-   Valut

    -   Visualize a list of the secrets stored in your HashiCorp Vault
        instance.

    -   [https://github.com/backstage/backstage/tree/master/plugins/vault](https://github.com/backstage/backstage/tree/master/plugins/vault)

