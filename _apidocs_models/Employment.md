---
title: Employment
---



Amount of employment at a given date

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **id** | String | Unique identifier | [required]  |
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
| **date** | Date | A date and time in UTC | [required]  |
| **value** | Long | The amount of employment at this point in time for this occupation | [required]  |
| **forecasted** | Boolean | True if predicted by time series forecasting, false if historical | [required]  |
