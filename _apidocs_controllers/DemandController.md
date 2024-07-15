---
title: DemandController
---

The DemandController provides a minimal set of read/write operations for managing demand targets for a given occupation.  ![class diagram](/diagrams/classDiagrams/Demand.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getDemand** | **GET** /demand | Get demand for a given SOC code |
| **setDemand** | **POST** /demand | Update demand for a given SOC code |



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


Type
: auth0

Scopes
: citizen
: smart_city_manager


<hr/>
#### **setDemand**
> Demand setDemand(Demand)

Update demand for a given SOC code

![sequence diagram](/diagrams/DemandController-setDemand-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **Demand** | **Demand**| Updated demand value | |

##### Return type

**Demand**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager

<hr/>