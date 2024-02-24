---
id: techdocs
title: techdocs
description: techdocs
---

## step
1. 문서 작성
docs/index.md 작성

2. mkdocs.yaml 생성

프로젝트 ROOT 위치에 mkdocs.yaml 파일을 생성합니다.


- mkdocs 작성 참고 : 
  - https://github.com/backstage/backstage/blob/master/mkdocs.yml
  
```yaml
# vi mkdocs.yaml
site_name: starter-techdocs
site_description: Contains the techdocs for starter
repo_url: https://github.com/oscka/starter
edit_uri: edit/main/docs

plugins:
  - techdocs-core
```

3. catalog-info.yaml 작성 (annotation 추가)
```yaml
  annotations:
    backstage.io/techdocs-ref: dir:.
    #starter.backstage.io/techdocs-builder: local
```

4. app-config.yaml 작성
참고 : https://backstage.io/docs/features/techdocs/configuration
```yaml
# Reference documentation http://backstage.io/docs/features/techdocs/configuration
# Note: After experimenting with basic setup, use CI/CD to generate docs
# and an external cloud storage when deploying TechDocs for production use-case.
# https://backstage.io/docs/features/techdocs/how-to-guides#how-to-migrate-from-techdocs-basic-to-recommended-deployment-approach
techdocs:
  builder: 'local' # Alternatives - 'external'
  generator:
    runIn: 'docker' # Alternatives - 'local'
  publisher:
    type: 'local' # Alternatives - 'googleGcs' or 'awsS3'. Read documentation for using alternatives.
```

![](assets/techdocs/techdocs-buildlog.png?width=760)


## Trouble Shoot
### Tech Docs 생성에 실패했을 경우 빌드 로그를 볼 수 있으며, 로그를 보고 에러 부분을 추적할 수 있다.

```sh
info: Step 1 of 3: Preparing docs for entity component:default/starter {"timestamp":"2024-02-06T08:43:24.803Z"}

info: Prepare step completed for entity component:default/starter, stored at C:\Users\wlstm\AppData\Local\Temp\backstage-58XWgy {"timestamp":"2024-02-06T08:43:26.307Z"}

info: Step 2 of 3: Generating docs for entity component:default/starter {"timestamp":"2024-02-06T08:43:26.307Z"}

info: Set {"repo_url":"https://github.com/oscka/backstage-custom/tree/main/catalog-entities/components/","edit_uri":"https://github.com/oscka/backstage-custom/edit/main/catalog-entities/components/docs"}. 

You can disable this feature by manually setting 'repo_url' or 'edit_uri' according to the MkDocs documentation at https://www.mkdocs.org/user-guide/configuration/#repo_url

{"timestamp":"2024-02-06T08:43:26.329Z"}

{"status":"Pulling from spotify/techdocs","id":"v1.2.3"}

{"status":"Digest: sha256:fe8314afaefad900dfe61b1ca81bf7ddd47f68c2b1872a7f34547ca297f7d6b9"}

{"status":"Status: Image is up to date for spotify/techdocs:v1.2.3"}

INFO -  DeprecationWarning: warning_filter doesn't do anything since MkDocs 1.2 and will be removed soon. 
        All messages on the `mkdocs` logger get counted automatically.
  File "/usr/local/lib/python3.8/site-packages/src/core.py", line 22, in <module>
    from mkdocs.utils import warning_filter
  File "/usr/local/lib/python3.8/site-packages/mkdocs/utils/__init__.py", line 453, in __getattr__
    warnings.warn(

ERROR   -  Config value 'docs_dir': The path '/input/docs' isn't an existing directory.
Aborted with 1 configuration errors!
```
