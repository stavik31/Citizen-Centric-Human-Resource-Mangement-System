---
title: LearningMaterialController
---

The LearningMaterialController provides operations for querying learning material for a specific SOC code. For  details on how the learning material is managed, see ContentfulController.  ![class diagram](/diagrams/classDiagrams/LearningMaterial.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getLearningMaterial** | **GET** /learning | Get learning material |



<hr/>
#### **getLearningMaterial**
> LearningMaterialResponse getLearningMaterial(query)

Get learning material

![sequence diagram](/diagrams/LearningMaterialController-getLearningMaterial-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **LearningMaterialQuery**| Filters for learning material | [optional] [default to null] |

##### Return type

**LearningMaterialResponse**

##### Authorization


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>