---
title: CertificationController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getCertifications** | **GET** /certifications | Get certifications |



<hr/>
#### **getCertifications**
> CertificationResponse getCertifications(query)

Get certifications

![sequence diagram](/diagrams/CertificationController-getCertifications-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **CertificationQuery**| Filters for certifications | [optional] [default to null] |

##### Return type

**CertificationResponse**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>