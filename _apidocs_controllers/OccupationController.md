---
title: OccupationController
---

The OccupationController provides operations for querying occupations based on a given SOC code. This data is managed in-memory and is sourced from the most recent SOC specification at application startup.  ![class diagram](/diagrams/classDiagrams/Occupation.svg) 

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


Type
: auth0

Scopes
: citizen
: smart_city_manager


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


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>