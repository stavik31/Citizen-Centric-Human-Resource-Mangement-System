---
title: AnalyticsQuery
---



Query object for analytics reports.

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **start** | Date | A date and time in UTC | [optional]  |
| **end** | Date | A date and time in UTC | [optional]  |
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
