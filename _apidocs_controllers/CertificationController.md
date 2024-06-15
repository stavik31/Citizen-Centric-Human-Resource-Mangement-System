---
title: CertificationController
---

The CertificationController presents a set of operations for querying certifications. Certification management is handled by system administrators through direct database injection; that process is described in the application tier documentation.  ![class diagram](/diagrams/classDiagrams/Certifications.svg) 

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