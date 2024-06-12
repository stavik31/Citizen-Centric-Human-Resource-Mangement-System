---
title: DemandController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getDemand** | **GET** /demand | Get demand for a given SOC code |



<hr/>
#### **getDemand**
> Demand getDemand(query)

Get demand for a given SOC code

![sequence diagram](/diagrams/DemandController-getDemand-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **DemandQuery**| Filters for demand | [optional] [default to null] |

##### Return type

**Demand**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>