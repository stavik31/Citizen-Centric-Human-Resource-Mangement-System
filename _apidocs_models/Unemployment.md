---
title: Unemployment
---



Unemployment value at a given time

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **id** | String | Unique identifier | [required]  |
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
| **date** | Date | A date and time in UTC | [required]  |
| **value** | BigDecimal | Value at that time | [required]  |
