---
title: EmploymentController
---

Access employment statistics by occupation  ![class diagram](/diagrams/classDiagrams/Employment.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getEmploymentBySocCode** | **GET** /employment | Get employment for a given SOC code |



<hr/>
#### **getEmploymentBySocCode**
> EmploymentResponse getEmploymentBySocCode(socCode)

Get employment for a given SOC code

![sequence diagram](/diagrams/EmploymentController-getEmploymentBySocCode-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **socCode** | **String**| Desired soc code | [optional] [default to null] |

##### Return type

**EmploymentResponse**

##### Authorization


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>