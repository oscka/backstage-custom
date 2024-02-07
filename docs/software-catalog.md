---
id: software-catalog
title: Backstage Software Catalog
sidebar_label: Overview
# prettier-ignore
description: The Backstage Software Catalog
---


## 개요

**참고**

-   [Backstage.io 검토](https://osc-korea.atlassian.net/wiki/spaces/consulting/pages/955842620)
-   [https://backstage.io/docs/features/software-catalog/](https://backstage.io/docs/features/software-catalog/)

### What is a Software Catalog?

![](assets/973373541/973373619.png)

Backstage 의 Software Catalog (이하 카탈로그)는 ecosystem 의 모든 소프트웨어(services, websites, libraries, data pipelines, etc)의
소유권과 메타데이터를 추적하는 중앙 집중식 시스템입니다.

카탈로그는 코드와 함께 저장된 [메타데이터 YAML](https://backstage.io/docs/features/software-catalog/descriptor-format) 파일 의 개념을 중심으로 구축되며,이 파일은 Backstage 에서 수집되고 시각화됩니다.

### Catalog 가 가져오는 효과

Catalog 는 두 가지 주요 사용 사례를 지원합니다

-   **팀이 소유한 소프트웨어를 관리하고 유지하도록 지원합니다.**
    -   팀은 서비스, 라이브러리, 웹사이트, 머신러닝 모델 등 모든
        소프트웨어에 대한 일관된 뷰를 확보할 수 있으며, Backstage 에서
        모든 것을 파악할 수 있습니다.

-   **회사의 모든 소프트웨어와 소유자를 검색할 수 있습니다.**
    -   소프트웨어 에코시스템의 어두운 구석에 숨어 있는 고아
        소프트웨어가 더 이상 존재하지 않습니다.

### Finding software in the catalog

![bsc-search-51a9aa0cdb9eb883d2bcf2451bc81362.png](assets/973373541/973373595.png?width=760)

기본적으로 catalog 에는 로그인한 사용자의 팀이 소유한 components 가 표시됩니다.

하지만 전체 조회로 전환하여 회사의 소프트웨어 에코시스템에 있는 모든 components 를 볼 수도 있습니다.

기본 인라인 검색 및 열 필터링을 사용하면 대규모 components 집합을 쉽게 찾아볼 수 있습니다.

### Starring components

![bsc-starred-7c2f867de967e254b190aac28e55bd0b.png](assets/973373541/973373598.png?width=760)

자주 방문하는 컴포넌트에 쉽고 빠르게 액세스할 수 있도록 백스테이지에서는 컴포넌트 별표 기능을 지원합니다

## Plugins 을 통한 통합 도구

![image-20240117-010527.png](assets/973373541/973373601.png?width=760)

-   소프트웨어 카탈로그는 소프트웨어를 관리하는 데 사용하는 인프라 도구를 체계적으로 정리할 수 있는 좋은 방법입니다.

-   팀에게 서로 다른 인프라 UI 사이를 이동하도록 요청하는 대신 (컨텍스트 전환을 할 때마다 추가적인 인지 오버헤드가 발생함),
    대부분의 도구를 카탈로그의 엔티티를 중심으로 구성할 수 있습니다.
    

## Catalog 에 components 추가

카탈로그의 구성 요소에 대한 진실의 출처는 Source Control (GitHub, GitHub Enterprise, GitLab, ...)에 저장된 [메타데이터 YAML 파일](https://backstage.io/docs/features/software-catalog/descriptor-format) 입니다.


### GitHub 연동 설정 (GitHub Integration)

**참고**
[https://backstage.io/docs/integrations/github/locations](https://backstage.io/docs/integrations/github/locations)

카탈로그는 source control 에서 관리되므로 카탈로그 생성전 source control 과 연동이 필요하며, 본문에서는 GitHub 연동 방법을 설명합니다.

-   Entities 는 정적 카탈로그 구성에 추가하거나, catalog-import plugin
    에 등록하거나, GitHub 조직(organization) 에서 발견할 수 있습니다.

-   사용자와 그룹은 조직에서도 로드할 수 있습니다.

GitHub 연동을 설정하는 방법중 추천되는 방법은 [GitHub
Apps](https://backstage.io/docs/integrations/github/github-apps) 을 사용하는 것이지만, 테스트 단계이므로 본문에서는
Personal Access Token 을 발급받은 후 연동했습니다.

1.  Personal Access Token 생성 ([the GitHub token creation page](https://github.com/settings/tokens/new))

2.  이 토큰을 식별할 이름을 사용해 **Note** 필드에 입력합니다.

3.  만료 기간을 선택합니다.

4.  app-config.yaml 수정

 
 
```yaml
# vi app-config.yaml
integrations:
  github:
    - host: github.com
      token: ${GITHUB_TOKEN}
```



**그외 연동 설정**

-   [사용 가능한 기타 통합 기능](https://backstage.io/docs/integrations/)
-   [Personal Access Token 대신 GitHub Apps 사용](https://backstage.io/docs/integrations/github/github-apps/#docsNav)
    

**카탈로그 생성 방법은 3가지가 있습니다.**

1.  Components 수동 등록

2.  Backstage를 통해 새로운 Components 생성

3.  [외부 소스와 통합](https://backstage.io/docs/features/software-catalog/external-integrations/)

## 1. Components 수동 등록

### 1-1. REGISTER EXISTING COMPONENT

![](assets/973373541/973373616.png?width=763)

사용자는 `/create`로 이동하여 **REGISTER EXISTING COMPONENT** 버튼을 클릭하여 새 컴포넌트를 등록할 수 있습니다.


### 1-2. YAML의 전체 URL 입력

![image-20240117-004316.png](assets/973373541/973373610.png?width=760)

-   Source control 에 있는 YAML의 전체 URL을 입력해야합니다. (Example:
    [여기](https://github.com/backstage/backstage/blob/master/packages/catalog-model/examples/components/artist-lookup-component.yaml))

    -   [https://github.com/oscka/starter/blob/main/catalog-info.yaml](https://github.com/oscka/starter/blob/main/catalog-info.yaml)

-   *More examples can be found*
    [*here*](https://github.com/backstage/backstage/tree/master/packages/catalog-model/examples)*.*

### 1-3. BackStage App 에서 component 감지 및 등록

![image-20240117-004413.png](assets/973373541/973373607.png?width=760)
![image-20240117-004523.png](assets/973373541/973373604.png?width=760)

컴포넌트가 등록 된것을 확인 할 수 있습니다.

## 2. Backstage 를 통해 새로운 components 생성

[[Backstage Software Templates]{.underline}](https://backstage.io/docs/features/software-templates/) 을 통해 생성된 모든 소프트웨어는 카탈로그에 자동으로 등록됩니다.


Components 를 수동으로 등록하는 것 외에도 정적 구성 ([[static configuration]{.underline}](https://backstage.io/docs/conf/)) 을 통해 컴포넌트를 등록할 수도 있습니다.

예를 들어, 위의 예는 다음 구성을 사용하여 추가할 수 있습니다.
 
 
```yaml
# vi app-config.yaml
catalog:
  locations:
    - type: url
      target: https://github.com/oscka/starter/blob/main/catalog-info.yaml
```


## Catalog - Component

**참고** [Descriptor Format of Catalog Entities](https://backstage.io/docs/features/software-catalog/descriptor-format)


### catalog-info.yaml

```yaml
# vi catalog-info.yaml
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: starter
  description: starter.io
  annotations:
    github.com/project-slug: oscka/starter
    backstage.io/managed-by-location: url:https://github.com/oscka/starter/blob/main/catalog-info.yaml
  links:
    - url: https://github.com/oscka/starter
      title: GitHub Repo
      icon: github
spec:
  type: service
  lifecycle: experimental
  owner: user:guest
```

-   **[required]** `apiVersion` , `kind`

    -   `apiVersion` : `backstage.io/v1alpha1`

    -   `kind` : `Component`

-   **[required ]**`spec.type` : component
    유형

    -   `service` - API를 노출하는 백엔드 서비스입니다.

    -   `website` - website

    -   `library` - npm 모듈 또는 Java 라이브러리와 같은 소프트웨어
        라이브러리

-   **[required]** `spec.lifecycle` :
    component 의 수명 주기 상태

    -   `experimental` - 실험용 또는 초기 non-production 구성 요소로,
        사용자가 다른 확립된 구성 요소보다 해당 구성 요소를 선호하지
        않을 수 있거나 신뢰성이 낮거나 전혀 보장되지 않음을 나타냅니다.

    -   `production` - 실제 운영중이며 유지관리되는 component

    -   `deprecated` - 나중에 사라질 수 있는 component

-   **[required]** `spec.owner` : component
    소유자 (다른 엔티티 참조)

-   `spec.system`

    -   component 가 속한 시스템 (다른 엔티티 참조)

-   `spec.subcomponentOf`

    -   component 가 속해 있는 다른 컴포넌트 (다른 엔티티 참조)

-   `spec.dependsOn`

    -   component 가 의존하는 component 및 리소스 (다른 엔티티 참조)

-   `spec.providesApis`

    -   component 에서 제공하는 API (다른 엔티티 참조)

`metadata.annotations`

-   파일 위치 지정 (`backstage.io/managed-by-location`)

    -   아래 어노테이션으로 catalog-info.yaml 위치를 지정

    -   `backstage.io/managed-by-location: url:https://github.com/oscka/starter/blob/main/catalog-info.yaml `

## Catalog - System, Group

-   참고

    -   [Descriptor Format of Catalog
        Entities](https://backstage.io/docs/features/software-catalog/descriptor-format)

### app-config.yaml

```yaml
catalog:
  import:
    entityFilename: catalog-info.yaml
    pullRequestBranchName: backstage-integration
  rules:
    - allow: [Component, System, Group, Resource, Location, Template, API]
  locations:
    - type: url
      target: https://github.com/oscka/backstage-custom/blob/main/catalog-entities/all.yaml
    - type: url
      target: https://github.com/oscka/janus-software-templates/blob/main/showcase-templates.yaml
    - type: url
      target: https://github.com/oscka/backstage-custom/blob/main/catalog-entities/users.yaml
      rules:
        - allow: [User]
```



-   catalog 는 yaml 파일 형식으로 생성할 수 있습니다.

    -   **rules**

        -   catalog 에는 여러 종류가 있는데 그중 허용,비허용 설정을 할
            수 있습니다.

    -   **locations** : url 과 file 중 선택하여 사용할 수 있습니다.

        -   **url** : github url 과 같이 public url

        -   **file :** 파일 위치는 백엔드 프로세스내에 있어야합니다.
            `` `packages/backend` ``
            -    
                ```yaml
                    - type: file
                      target: ../../catalog-entities/all.yaml
                ```
### yaml file example

```yaml
---
# https://backstage.io/docs/features/software-catalog/descriptor-format#kind-system
apiVersion: backstage.io/v1alpha1
kind: System
metadata:
  name: examples
spec:
  owner: guests
---
# https://backstage.io/docs/features/software-catalog/descriptor-format#kind-component
apiVersion: backstage.io/v1alpha1
kind: Component
metadata:
  name: example-website
spec:
  type: website
  lifecycle: experimental
  owner: guests
  system: examples
  providesApis: [example-grpc-api]
---
# https://backstage.io/docs/features/software-catalog/descriptor-format#kind-user
apiVersion: backstage.io/v1alpha1
kind: User
metadata:
  name: guest
spec:
  memberOf: [guests]
---
# https://backstage.io/docs/features/software-catalog/descriptor-format#kind-group
apiVersion: backstage.io/v1alpha1
kind: Group
metadata:
  name: guests
spec:
  type: team
  children: []
```
## Group

Group 은 팀, 사업부 또는 관심사 그룹에 속한 사람들의 느슨한 모임과 같은
조직 엔티티를 설명합니다.

![그림1.png](assets/973373541/973373592.png?width=760)
![image-20240124-030659.png](assets/973373541/973373583.png?width=760)

### yaml file (group)

-   file location
    -   [https://github.com/oscka/backstage-custom/blob/main/catalog-entities/groups/team-devops.yaml](https://github.com/oscka/backstage-custom/blob/main/catalog-entities/groups/team-devops.yaml)

 
```yaml
---
# https://backstage.io/docs/features/software-catalog/descriptor-format#kind-group
apiVersion: backstage.io/v1alpha1
kind: Group
metadata:
  name: team-arch
  title: arch
spec:
  type: team
  children: []
---
apiVersion: backstage.io/v1alpha1
kind: Group
metadata:
  name: team-develop
  title: develop
spec:
  type: team
  children: []
---
apiVersion: backstage.io/v1alpha1
kind: Group
metadata:
  name: team-devops
  title: devops
spec:
  type: team
  children: []
```



-   `team-arch` , `team-develop` , `team-devops` 으로 Group 을 만든후
    type 을 team 으로 지정합니다.

-   **[required]** `apiVersion` , `kind`

    -   `apiVersion` : `backstage.io/v1alpha1`

    -   `kind` : `Group`

-   **[required]** `spec.type`

    -   현재 이 필드에 대해 강제적으로 적용되는 값 집합은 없으므로 조직
        계층 구조에 맞는 명명법을 선택하는 것은 채택하는 조직에 맡겨져
        있습니다.

    -   `team`

    -   `business-unit`

    -   `product-area`

    -   `root`

-   `spec.parent` : 표시 목적으로 그룹에 대한 선택적 프로필 정보입니다.

-   `spec.children` : 계층 구조에서 이 그룹의 바로 아래 하위 그룹(부모
    필드가 이 그룹을 가리킴)입니다.

-   `spec.members` : 이 그룹의 구성원인 사용자입니다.

## System

System 은 resources 와 components 의 집합입니다.

System 은 하나 또는 여러 개의 API를 노출하거나 사용할 수 있습니다.

이는 잠재적 소비자에게 모든 구성 요소의 세부 사항을 너무 자세히 볼 필요
없이 노출된 기능에 대한 인사이트를 제공하는 추상화 수준으로 간주됩니다.

이는 또한 소유 팀이 게시된 아티팩트와 API에 대해 결정할 수 있는 가능성을
제공합니다.

![image-20240124-025240.png](assets/973373541/973373589.png?width=760)

### yaml file (system)
-   file location
    -   [https://github.com/oscka/backstage-custom/blob/main/catalog-entities/systems/openmsa.yaml](https://github.com/oscka/backstage-custom/blob/main/catalog-entities/systems/openmsa.yaml)
 
 
```yaml
# https://backstage.io/docs/features/software-catalog/descriptor-format#kind-system
apiVersion: backstage.io/v1alpha1
kind: System
metadata:
  name: openmsa-idp
  title: OpenMSA-IDP
spec:
  owner: team-devops
```

-   **[required]** `apiVersion` , `kind`

    -   `apiVersion` : `backstage.io/v1alpha1`

    -   `kind` : `System`

-   **[required]**`spec.owner` : 시스템
    소유자 (엔터티 참조)

-   `spec.domain` : 시스템이 속한 도메인 (엔터티 참조)

------------------------------------------------------------------------

## env

### start.ps1 (window)
```powershell
# vi start.ps1
Write-Host "Setting environment variables...";
$env:POSTGRES_HOST="localhost";
$env:POSTGRES_PORT="5432";
$env:POSTGRES_USER="root";
$env:POSTGRES_PASSWORD="root1234";
$env:GITHUB_TOKEN="ghp_yQhD********************";
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
```
