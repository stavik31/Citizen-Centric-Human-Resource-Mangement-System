---
title: News
---



A news article

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **id** | String | Unique identifier for the news article, typically the source url | [required]  |
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [optional] [regex `/\\d{2}-\\d{4}/`]  |
| **title** | String | Title of the news article | [required]  |
| **source** | String | The organization or website publishing the news | [optional]  |
| **published** | Date | A date and time in UTC | [optional]  |
| **link** | ExternalLink |  | [required]  |
