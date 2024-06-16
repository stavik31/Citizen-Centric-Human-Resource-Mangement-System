---
title: Certification
---



A certification hosted by an external entity.

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **id** | String | Unique identifier for the certification | [required]  |
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
| **title** | String | The title of the certification | [required]  |
| **description** | String | A brief description of the certification contents | [optional]  |
| **organization** | String | The organization hosting the certification | [optional]  |
| **links** | List&lt;ExternalLink&gt; | URLs for external pages related to this certification | [optional]  |
