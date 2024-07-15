---
title: LearningMaterial
---



A piece of external learning material for a given occupation

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **id** | String | A unique identifier for the content | [required]  |
| **title** | String | The title of the content | [optional]  |
| **description** | String | A brief description of the content | [optional]  |
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
| **organization** | String | The organization managing the content | [optional]  |
| **contentType** | LearningContentType |  | [required]  |
| **links** | List&lt;ExternalLink&gt; | A list of external pages the content can be accessed on | [optional]  |
