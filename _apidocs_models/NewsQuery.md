---
title: NewsQuery
---



A query object for news

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
| **source** | String | The organization or website publishing the news | [optional]  |
| **after** | Date | A date and time in UTC | [optional]  |
| **before** | Date | A date and time in UTC | [optional]  |
