---
id: software-templates
title: Backstage Software Templates
sidebar_label: Overview
# prettier-ignore
description: The Software Templates part of Backstage is a tool that can help you create Components inside Backstage
---

## 디버깅
Template Editor
Edit, preview, and try out templates and template forms

### 템플릿 수정 및 테스트 URL
#### /create/edit
#### https://backstage.openmsa.monster/create/edit

#### /import/entity
#### https://backstage.openmsa.monster/import/entity


### 참고 https://roadie.io/docs/scaffolder/troubleshooting/

## 테스트
현재 Backstage에서는 템플릿 테스트가 잘 지원되지 않습니다. 
그 이유는 주로 많은 스캐폴더 작업이 부작용을 수행한다는 사실 때문입니다.

샌드박스 및 테스트 실행 템플릿(변형을 수행하는 단계 건너뛰기) 에서 매개변수를 미리 보고 편집할 수 있는 제한된 기능 세트가 존재합니다.

이러한 기능은 에서 찾을 수 있습니다 /import/entity-preview.

/import/entity미리 보기 또는 테스트 버전임을 나타내기 위해 템플릿의 이름과 네임스페이스를 변경한 다음 게시된 기능 분기의 버전을 사용하여 카탈로그에 추가하여 템플릿을 테스트할 수도 있습니다.

이 미리보기 템플릿은 템플릿 목록에 표시되지만 중복을 피하기 위해 테스트 후에 엔터티를 제거하고 제목/설명이 임시 테스트임을 나타내는지 확인하는 것이 중요합니다.




## 문제 해결
템플릿 작성은 때때로 약간 번거로울 수 있습니다. 
문제의 원인을 파악하는 데 도움이 될 수 있도록 과거에 본 오류 목록을 정리했습니다.

/templates/edit템플릿 YAML 입력 양식은 테스트 주기를 가속화하는 라이브 템플릿 미리보기 뷰어를 사용하여 테스트할 수도 있습니다.



### Load Template Directory
#### Load a local template directory, allowing you to both edit and try executing your own template.



### Edit Template Form
#### Preview and edit a template form, either using a sample template or by loading a template from the catalog.
템플릿 양식 편집을 클릭하면 템플릿을 작성할 수 있는 위치에 액세스하고 템플릿이 작동하는지 즉시 확인할 수 있습니다.

### Custom Field Explorer
#### View and play around with available installed custom field extensions.
Backstage 설명서를 의역하자면, 사용자의 의견을 수집하는 것은 scaffolding process 와 Software Templates 전체에서 매우 큰 부분을 차지합니다. 

이러한 입력은 리포지토리 선택기와 같은 사용자 지정 필드를 사용해 software templates 에서 이루어집니다.

때로는 이러한 개체의 모든 가능성을 이해하는 것이 쉽지 않습니다.

The Software Templates part of Backstage is a tool that can help you create Components inside Backstage. 
By default, it has the ability to load skeletons of code, template in some variables, and then publish the template to some locations like GitHub or GitLab.

백스테이지의 소프트웨어 템플릿 부분은 다음을 만드는 데 도움이 되는 도구입니다. 컴포넌트를 만드는 데 도움이 되는 도구입니다. 
기본적으로 이 도구는 일부 변수에 코드, 템플릿의 코드, 일부 변수의 템플릿을 로드한 다음 템플릿을 일부 위치에 게시할 수 있습니다.
위치에 게시할 수 있습니다.