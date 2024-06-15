---
title: UnemploymentController
---

Access unemployment statistics  ![class diagram](/diagrams/classDiagrams/Unemployment.svg) 

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