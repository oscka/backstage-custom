---
id: make-app
title: make-app
description: make-app
---

실제로 개발이 필요한 상황을 가정하여 다음과 같은 상황하의 가이드 작성

(API템플릿 검색 -> 템플릿을 통해 신규 API생성 -> 각 구성요소 확인 및 개발 시작)

## 1. API 템플릿 검색
* catalog > create 버튼을 클릭하여 템플릿 리스트를 화면에서 확인
* 템플릿을 선택하여 템플릿 생성에 필요한 내용을 작성
    * (해당 과정은 template.yaml 에 단계별로 정의돼있습니다.)
    * https://github.com/oscka/software-templates/


## 2. 템플릿을 통해 신규 API 생성
* https://github.com/oscka/software-templates 에서 템플릿을 구성하는 yaml 파일과 실제 템플릿 소스코드를 확인할 수 있습니다.
* 템플릿을 생성하면 사용자는 미리 정의해놓은 소스코드로 새로운 github repository 를 사용할 수 있습니다.
* 템플릿은 사용자가 backstage ui 에서 입력한 값을 변수로 받아 생성가능합니다.

## 3. 각 구성요소 확인 및 개발 시작
* catalog graph 를 통해 각 구성요소를 확인할 수 있습니다.

* owner (소유자)
* system
* api
* resource

https://backstage.openmsa.monster/catalog-graph?rootEntityRefs%5B%5D=component%3Adefault%2Fopenmsa-idp&maxDepth=1&unidirectional=true&mergeRelations=true&direction=LR&showFilters=true
