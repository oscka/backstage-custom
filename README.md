# [Backstage](https://backstage.io)

### Local 실행
```sh
# yarn 으로 dependency 설치
yarn install
# frontend , backend 실행
yarn dev
```

### Local PC 에서 사용한 파일 설명
- start.ps1/start.sh
    - Local PC에서 개발할때 app-config.yaml 파일의 ${} 처리된 변수를 치환해주는 역할
    - window powershell 용입니다. 
    - github api token 과 GitHub OAuth Apps secret 이 포함돼있으므로 커밋하지 마시고, .gitignore 에 등록후 로컬용도로 사용하세요.
    - (!) 현재 올라가있는 토큰은 revoke 돼있습니다.
    - mac 이나 linux 기반 환경은 start.sh 를 이용합니다.
- build-local.ps1
    - Docker Image 생성후, nexus-oscka.openmsa.monster 에 docker image 를 push 하는 용도로 사용했습니다.


### backstage 설치된 서버
```
# osckorea wifi 접속후
ssh oscka@192.168.41.50 -p 22

# vagrant 파일 위치
cd server-workspace/jinseul

# vagrant 접속
vagrant ssh
```