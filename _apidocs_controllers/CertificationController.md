---
title: CertificationController
---

Access certifications  ![class diagram](/diagrams/classDiagrams/Certifications.svg) 

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


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>