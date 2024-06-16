---
title: JobPostingQuery
---



A query for job postings

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **socCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [required] [regex `/\\d{2}-\\d{4}/`]  |
| **userQuery** | String | A query string entered by the user | [optional]  |
| **yearlySalaryUpper** | Long | An upper limit on salary for the position | [optional]  |
| **yearlySalaryLower** | Long | A lower limit on salary for the position | [optional]  |
