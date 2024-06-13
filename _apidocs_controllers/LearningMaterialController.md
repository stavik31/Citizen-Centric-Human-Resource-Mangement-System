---
title: LearningMaterialController
---

Access learning material for an occupation  ![class diagram](/diagrams/classDiagrams/LearningMaterial.svg) 

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

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>