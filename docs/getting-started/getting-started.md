---
id: getting-started
title: Getting Started
description: Documentation on How to get started with Backstage
---

## 개요

**참고**
-   [Backstage.io검토](https://osc-korea.atlassian.net/wiki/spaces/consulting/pages/955842620)
-   [GettingStarted](https://backstage.io/docs/getting-started/)
    

Kubernetes , Catalog 기능을 테스트 하기전에 BackStage App 을 만드는
과정이 필요합니다.

Backstage 의 Frontend 는 [**React**](https://react.dev) , Backend 는 [**Node.js**](https://nodejs.org/) 으로 개발돼있고 전부 [**Typescript**](https://www.typescriptlang.org/) 를 사용하고 있습니다.

 

## Create Backstage App

### 사전 설치 (Prerequisites)

-   **node**
    -   install
        -   [https://jin2rang.tistory.com/entry/Window-Nodejs-%EC%84%A4%EC%B9%982](https://jin2rang.tistory.com/entry/Window-Nodejs-%EC%84%A4%EC%B9%982)

    -   nvm 은 node.js 를 여러개의 버전으로 설치하고 관리할 수 있는 도구입니다.
        
    -   node.js 만 설치해도 되지만, Node Version 을 여러개 쓰고 있으므로 NVM 을 통해 node js 를 설치했습니다.
        

-   **yarn**

    -   install command

        -   `npm install --global yarn`

    -   yarn 은 npm 과 같은 Javascript Package Manager 입니다.

    -   [npm vs yarn](https://joshua1988.github.io/vue-camp/package-manager/npm-vs-yarn.html)
         : npm 과 yarn 의 차이점은 해당 URL 에서 확인할 수 있습니다.

## app 생성 

```shell
PS C:\_DEV> npx @backstage/create-app@latest

? Enter a name for the app [required] backstage-seul

Creating the app...

( 생략 )

 All set! Now you might want to:
  Run the app: cd backstage-seul && yarn dev
  Set up the software catalog: https://backstage.io/docs/features/software-catalog/configuration
  Add authentication: https://backstage.io/docs/auth/
```



## app 시작 (Run the Backstage app) 
 
```shell
# go to the application directory
PS C:\_DEV> cd backstage-seul

# Start the Backstage app
PS C:\_DEV\backstage-seul> yarn dev
```



`yarn dev` 명령은 프론트엔드와 백엔드를 동일한 창에서 별도의 프로세스(\[0\]과 \[1\]로 명명) 로 실행합니다.

## 브라우저에서 확인  

[http://localhost:3000](http://localhost:3000)
 으로 접속하면 아래와같은 Dashboard 를 확인할 수 있습니다.


![](assets/973373498/973373530.png?width=760)

## General folder structure 

아래는 앱을 만든 후 생성되는 파일과 폴더의 단순화된 layout 입니다.

 
```shell
app
├── app-config.yaml
├── catalog-info.yaml
├── lerna.json
├── package.json
└── packages
    ├── app
    └── backend
```



-   **app-config.yaml**
    -   앱의 기본 구성 파일
    -   자세한 내용은 [설정](https://backstage.io/docs/conf/) 을 참조
-   **catalog-info.yaml**
    -   Catalog Entities
-   **lerna.json**
    -   Mono-Repo 설정에 필요한 workspaces 및 기타 lerna 구성이
        포함돼있다.
    -   [[Lerna]{.underline}](https://lerna.js.org/)
        는 단일 저장소(Repository)에서 다양한 packages를
        구성하는 것을 도와주는 라이브러리이다.
-   **package.json**
    -   생성한 프로젝트의 메타정보 와 프로젝트가 의존하고 있는 모듈들에
        대한 정보
-   **packages/**
    -   Lerna 는 packages 폴더에 각각의 pakcage(프로젝트) 를 구성한다.
    -   packages 하위에 backend 와 app (frontend) 가 있다.
-   **packages/app/**
    -   Backstage frontend app
-   **packages/backend/**
    -   Backstage backend




## 저장소를 PostgreSQL 로 변경   

**참고**
[https://backstage.io/docs/getting-started/configuration](https://backstage.io/docs/getting-started/configuration)

기본적으로 SQLite 를 통해 저장하고 있는데, Backstage App 이 Restart 될
경우 ui 에서 설정한 모든 정보가 날아가게됩니다.

따라서 저장소를 Postgers 로 변경해줍니다.

```yaml
# postgres-docker-compose.yaml
version: '3.1'
services:
  db:
    image: postgres
    restart: always
    environment:
      POSTGRES_PASSWORD: example
    ports:
      - "5432:5432"
```



## setting 

### postgres package 추가 
 
```shell
 # From your Backstage root directory
 yarn add --cwd packages/backend pg
```

### app-config.yaml 수정  

 
 
```yaml
backend:
  database:
    # config options: https://node-postgres.com/apis/client
    client: pg
    connection:
      host: ${POSTGRES_HOST}
      port: ${POSTGRES_PORT}
      user: ${POSTGRES_USER}
      password: ${POSTGRES_PASSWORD}
```



postgres 로 변경후 database 목록을 확인해보면 아래 4개의 database 가 생성된 것을 확인해볼수 있습니다.

 
 
```shell
List of databases
            Name             |  Owner   | Encoding |  Collate   |   Ctype    | ICU Locale | Locale Provider | Access privileges 
-----------------------------+----------+----------+------------+------------+------------+-----------------+-------------------
 backstage_plugin_auth       | root     | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
 backstage_plugin_catalog    | root     | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
 backstage_plugin_scaffolder | root     | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            | 
 backstage_plugin_search     | root     | UTF8     | en_US.utf8 | en_US.utf8 |            | libc            |
```



## env 관리

env 를 운영환경 (dev,stg,prd) 마다 다르게 적용할 수도 있고, Github 에 public 으로 소스코드를 커밋할 경우 노출하고싶지 않은 정보를 하나의 파일에 작성후 .gitignore 에 등록하여 env 를 관리한다.

-   window 일경우 start.ps1 (for powershell)

 
 
```powershell
# vi start.ps1
Write-Host "Setting environment variables...";

$env:POSTGRES_HOST="localhost";
$env:POSTGRES_PORT="5432";
$env:POSTGRES_USER="root";
$env:POSTGRES_PASSWORD="root1234";

Write-Host "Initializing process..."
```



-   mac, linux 일경우 environment.sh
```shell
# vi environment.sh
export POSTGRES_HOST=localhost
export POSTGRES_PORT=5432
export POSTGRES_USER=root
export POSTGRES_PASSWORD=root1234
```





