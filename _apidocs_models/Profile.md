---
title: Profile
---



A user profile

| Name | Type | Description | Notes |
|------------ | ------------- | ------------- | -------------|
| **id** | String | Unique identifier | [required]  |
| **name** | String | Legal name of the user | [optional]  |
| **email** | String | Email address of the user | [optional]  |
| **postalCode** | String | Postal code of the user | [optional]  |
| **currentSocCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [optional] [regex `/\\d{2}-\\d{4}/`]  |
| **goalSocCode** | String | SOC code (see [SOC definition dataset](#soc-definition-dataset)) | [optional] [regex `/\\d{2}-\\d{4}/`]  |
| **termsOfUseConsent** | Boolean | If the user consented to the system terms of use | [required]  |
