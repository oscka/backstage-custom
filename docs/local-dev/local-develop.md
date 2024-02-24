---
id: local-develop
title: local-develop
description: local-develop
---

```
# 의존성 설치
yarn install

# power shell 에서 env 적용 및 확인
./start.ps1(sh)
```

## 개발 환경 구성

WSL2, Ubuntu 22.04 기반에서 다음과 같이 환경을 구성한다.(5번 제외)

1. node
- nvm 설치 : curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash  
- node 설치 
  : nvm install 18.19.0 # (특정버전 설치)
  : nvm use node 18.19.0 # (특정버전 사용)
2. yarn 설치
- npm install -g yarn
3. python 3.x 버전 설치 : Ubuntu에서는 디폴트로 설치되어 있음(python3 명령으로 확인)
4. [node-gyp](https://github.com/nodejs/node-gyp) 설치
- npm install -g node-gyp
5. Microsoft Visual Studio 2022 설치 (window 일경우)
- C:\Program Files\Microsoft Visual Studio\2022\Community

이후 backstage 프로젝트의 의존성을 다운로드(yarn install) 하고 실행한다.



### 로컬 개발 환경 구성 Trouble Shoot
1. 파이썬 path 가 시스템 환경변수에서 보이지 않을 경우 확인 방법
- [파이썬 path 확인](https://allhpy35.tistory.com/23)
```powershell
PS C:\Users\wlstm> python
Python 3.12.1 (tags/v3.12.1:2305ca5, Dec  7 2023, 22:03:25) [MSC v.1937 64 bit (AMD64)] on win32
Type "help", "copyright", "credits" or "license" for more information.
>>> import sys
>>> sys.executable
'C:\\Users\\wlstm\\AppData\\Local\\Microsoft\\WindowsApps\\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\\python.exe'
>>>
``` 

2. 아래 에러가 발생할 경우 [블로그](https://blog.aliencube.org/ko/2021/11/26/troubleshooting-node-gyp-package-on-windows11/) 확인하여 해결
```shell
PS C:\_git_evelyn\backstage-custom> node-gyp rebuild --python "C:\Users\wlstm\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe"
gyp info it worked if it ends with ok
gyp info using node-gyp@10.0.1
gyp info using node@18.19.0 | win32 | x64
gyp info find Python using Python version 3.12.1 found at "C:\Users\wlstm\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe"

gyp http GET https://nodejs.org/download/release/v18.19.0/node-v18.19.0-headers.tar.gz
gyp http 200 https://nodejs.org/download/release/v18.19.0/node-v18.19.0-headers.tar.gz
gyp http GET https://nodejs.org/download/release/v18.19.0/SHASUMS256.txt
gyp http GET https://nodejs.org/download/release/v18.19.0/win-x64/node.lib
gyp http 200 https://nodejs.org/download/release/v18.19.0/SHASUMS256.txt
gyp http 200 https://nodejs.org/download/release/v18.19.0/win-x64/node.lib
gyp ERR! find VS
gyp ERR! find VS msvs_version not set from command line or npm config
gyp ERR! find VS VCINSTALLDIR not set, not running in VS Command Prompt
gyp ERR! find VS checking VS2022 (17.8.34408.163) found at:
gyp ERR! find VS "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools"
gyp ERR! find VS - found "Visual Studio C++ core features"
gyp ERR! find VS - missing any VC++ toolset
gyp ERR! find VS could not find a version of Visual Studio 2017 or newer to use
gyp ERR! find VS looking for Visual Studio 2015
gyp ERR! find VS - not found
gyp ERR! find VS not looking for VS2013 as it is only supported up to Node.js 8
gyp ERR! find VS
gyp ERR! find VS **************************************************************
gyp ERR! find VS You need to install the latest version of Visual Studio
gyp ERR! find VS including the "Desktop development with C++" workload.
gyp ERR! find VS For more information consult the documentation at:
gyp ERR! find VS https://github.com/nodejs/node-gyp#on-windows
gyp ERR! find VS **************************************************************
gyp ERR! find VS
gyp ERR! configure error
gyp ERR! stack Error: Could not find any Visual Studio installation to use
gyp ERR! stack at VisualStudioFinder.fail (C:\Users\wlstm\AppData\Roaming\nvm\v18.19.0\node_modules\node-gyp\lib\find-visualstudio.js:113:11)
gyp ERR! stack at VisualStudioFinder.findVisualStudio (C:\Users\wlstm\AppData\Roaming\nvm\v18.19.0\node_modules\node-gyp\lib\find-visualstudio.js:69:17)
gyp ERR! stack at process.processTicksAndRejections (node:internal/process/task_queues:95:5)
gyp ERR! stack at async createBuildDir (C:\Users\wlstm\AppData\Roaming\nvm\v18.19.0\node_modules\node-gyp\lib\configure.js:69:26)
gyp ERR! stack at async run (C:\Users\wlstm\AppData\Roaming\nvm\v18.19.0\node_modules\node-gyp\bin\node-gyp.js:81:18)
gyp ERR! System Windows_NT 10.0.22621
gyp ERR! command "C:\\Program Files\\nodejs\\node.exe" "C:\\Program Files\\nodejs\\node_modules\\node-gyp\\bin\\node-gyp.js" "rebuild" "--python" "C:\\Users\\wlstm\\AppData\\Local\\Microsoft\\WindowsApps\\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\\python.exe"
gyp ERR! cwd C:\_git_evelyn\backstage-custom
gyp ERR! node -v v18.19.0
gyp ERR! node-gyp -v v10.0.1
gyp ERR! not ok
```


```shell
warning Error running install script for optional dependency: "C:\\_git_evelyn\\backstage-custom\\node_modules\\tree-sitter-yaml: Command failed.
Exit code: 1
Command: node-gyp rebuild
Arguments:
Directory: C:\\_git_evelyn\\backstage-custom\\node_modules\\tree-sitter-yaml
Output:
gyp info it worked if it ends with ok
gyp info using node-gyp@9.4.1
gyp info using node@18.19.0 | win32 | x64


gyp ERR! find Python
gyp ERR! find Python **********************************************************
gyp ERR! find Python You need to install the latest version of Python.
gyp ERR! find Python Node-gyp should be able to find and use Python. If not,
gyp ERR! find Python you can try one of the following options:
gyp ERR! find Python - Use the switch --python=\"C:\\Path\\To\\python.exe\"
gyp ERR! find Python   (accepted by both node-gyp and npm)
gyp ERR! find Python - Set the environment variable PYTHON
gyp ERR! find Python - Set the npm configuration variable python:
gyp ERR! find Python   npm config set python \"C:\\Path\\To\\python.exe\"
gyp ERR! find Python For more information consult the documentation at:
gyp ERR! find Python https://github.com/nodejs/node-gyp#installation
gyp ERR! find Python **********************************************************
gyp ERR! find Python
```

3. 초기 yarn install error
네트워크 환경이 원활하지않는 동시에 대량의 패키지를 다운받을경우 아래 에러가 발생합니다.
```sh
there appears to be trouble with your network connection. retrying
An unexpected error occurred: "https://registry.yarnpkg.com/rxjs/-/rxjs-5.5.12.tgz: ESOCKETTIMEDOUT".
```
네트워크가 느리거나 해당 패키지 파일이 너무 큰 경우 강제로 타임아웃되는 시간을 늘리는 방법이다.
```sh
yarn install --network-timeout 10000000
```
실제로 package.json의 의존성 설치는 위의 방법으로 해결하였다.

[참고](https://velog.io/@kmp1007s/yarn%EC%9C%BC%EB%A1%9C-expo-cli-%EC%84%A4%EC%B9%98-%EC%8B%9C-%EB%B0%9C%EC%83%9D%ED%95%98%EB%8A%94-%EC%97%90%EB%9F%AC-%ED%95%B4%EA%B2%B0)




## docker-compose.yaml

로컬환경에서 docker 로 띄울경우 아래 docker-compose.yaml 을 참고해주세요.

```yaml
version: '3.1'
services:
  db:
    image: postgres
    restart: always
    ports:
      - 5432:5432
    environment:
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}

  adminer:
    image: adminer
    restart: always
    ports:
      - 8080:8080

  backstage:
    image: jei0486/backstage
    restart: always
    ports:
      - 7007:7007
    environment:
      - POSTGRES_HOST=${POSTGRES_HOST}
      - POSTGRES_PORT=${POSTGRES_PORT}
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - AUTH_GITHUB_CLIENT_ID=${AUTH_GITHUB_CLIENT_ID}
      - AUTH_GITHUB_CLIENT_SECRET=${AUTH_GITHUB_CLIENT_SECRET}
      - GITHUB_TOKEN=${GITHUB_TOKEN}
      - JENKINS_URL=${JENKINS_URL}
      - JENKINS_TOKEN=${JENKINS_TOKEN}
      - SONARQUBE_URL=${SONARQUBE_URL}
      - SONARQUBE_TOKEN=${SONARQUBE_TOKEN}
      - NEXUS_REPOSITORY_MANAGER_URL=${NEXUS_REPOSITORY_MANAGER_URL}
      - NEXUS_REPOSITORY_MANAGER_AUTH=${NEXUS_REPOSITORY_MANAGER_AUTH}
      - ARGOCD_URL=${ARGOCD_URL}
      - ARGOCD_AUTH_TOKEN=${ARGOCD_AUTH_TOKEN}
      - K8S_MINIKUBE_URL=${K8S_MINIKUBE_URL}
      - K8S_MINIKUBE_TOKEN=${K8S_MINIKUBE_TOKEN}
      - K8S_KIND_URL=${K8S_KIND_URL}
      - K8S_KIND_TOKEN=${K8S_KIND_TOKEN}
      - K8S_K3S_URL=${K8S_K3S_URL}
      - K8S_K3S_TOKEN=${K8S_K3S_TOKEN}
      - NODE_ENV=development

```