---
title: UnemploymentController
---

The UnemploymentController provides operations for querying unemployment based on a given SOC code (or globally if the root SOC code 00-0000 is provided). Internally, this utilized the BLS Public Data API series LNU04000000.  ![class diagram](/diagrams/classDiagrams/Unemployment.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getUnemploymentBySocCode** | **GET** /unemployment | Get unemployment |



<hr/>
#### **getUnemploymentBySocCode**
> UnemploymentResponse getUnemploymentBySocCode(socCode)

Get unemployment

![sequence diagram](/diagrams/UnemploymentController-getUnemploymentBySocCode-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **socCode** | **String**| Desired soc code | [optional] [default to null] |

##### Return type

**UnemploymentResponse**

##### Authorization


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>