---
title: OccupationController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getChildOccupations** | **GET** /occupations/children | Get child occupations |
| **getOccupation** | **GET** /occupations | Get single occupation |



<hr/>
#### **getChildOccupations**
> OccupationResponse getChildOccupations(socCode)

Get child occupations

![sequence diagram](/diagrams/OccupationController-getChildOccupations-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **socCode** | **String**| Desired soc code | [optional] [default to null] |

##### Return type

**OccupationResponse**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


<hr/>
#### **getOccupation**
> Occupation getOccupation(socCode)

Get single occupation

![sequence diagram](/diagrams/OccupationController-getOccupation-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **socCode** | **String**| Desired soc code | [optional] [default to null] |

##### Return type

**Occupation**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>