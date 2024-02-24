# [Backstage](https://backstage.io)

## 소개

OSS인 Backstage를 이용하여 내부 개발자 플랫폼을 구축하기 위한 프로젝트입니다.

[BackStage란?](./docs/index.md)

Backstage는 IDP([내부 개발자 플랫폼,Internal Develper Platform](https://www.redhat.com/ko/topics/devops/what-is-an-internal-developer-platform))이며, 다양한 기능을 통해 개발자들에게 생산성 향상을 위한 도구를 제공하고 좀 더 개발에 집중할 수 있도록 도와줍니다.

## 시작하기

### 환경 구성하기

Backstage는 node(react)로 개발되어 있으며 다음과 같은 도구들이 먼저 설치되어 있어야 합니다. 

- node, npm, yarn, node-gyp (node 18.x)
- [로컬 환경 구성하기](./docs/local-dev/local-develop.md)

### Local 실행하기
```sh
# yarn 으로 dependency 설치
yarn install
# frontend , backend 실행
./start.sh
```

#### 실행파일 설명
- start.ps1/start.sh
    - Local PC에서 개발할때 app-config.yaml 파일의 ${} 처리된 변수를 치환해주는 역할
    - github api token 과 GitHub OAuth Apps secret 이 포함돼있으므로 커밋하지 마시고, .gitignore 에 등록후 로컬용도로 사용하세요.
    - (!) 현재 올라가있는 토큰은 revoke 돼있습니다.
    - mac 이나 linux 기반 환경은 start.sh 를 이용합니다.
- build-local.ps1/build-local.sh
    - Docker Image 생성후, nexus-oscka.openmsa.monster 에 docker image 를 push 하는 용도로 사용했습니다.

<!-- ### backstage 설치된 서버 -->
<!-- ```
# osckorea wifi 접속후
ssh oscka@192.168.41.50 -p 22

# vagrant 파일 위치
cd server-workspace/jinseul

# vagrant 접속
vagrant ssh
``` -->

## 사용하기

### 기능설명

Backstage는 기본적으로 카탈로그를 통해 개발자들에게 개발과 관련된 리소스에 접근할 수 있도록 하며, 템플릿을 통해 손쉽게 개발에 온보딩 할 수 있도록 준비된 구성을 만들어 줍니다.

- [카탈로그란?](./docs/software-catalog.md)
- [템플릿이란?](./docs/software-templates.md)

### 카탈로그 사용하기

### 템플릿 사용하기

(작성중)