---
title: AnalyticsController
---

The AnalyticsController presents a set of operations for publishing and querying clickstream data.  ![class diagram](/diagrams/classDiagrams/Analytics.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getCertificationEngagement** | **GET** /analytics/certificationEngagement | Get report containing information about engagement for certifications. |
| **getClickData** | **GET** /analytics | Get raw clickstream data |
| **getJobPostingEngagement** | **GET** /analytics/jobPostingEngagement | Get report containing information about engagement for job postings. |
| **getLearningMaterialEngagement** | **GET** /analytics/learningMaterialEngagement | Get report containing information about engagement for learning material. |
| **getNewsEngagement** | **GET** /analytics/newsEngagement | Get report containing information about engagement for news. |
| **getUserCurrentOccupationReport** | **GET** /analytics/currentOccupation | Get report containing information about users&#39; current occupations and general locations. |
| **getUserGoalOccupationReport** | **GET** /analytics/goalOccupation | Get report containing information about users&#39; goal occupations. |
| **saveClickData** | **POST** /analytics | Submit clickstream data event |



<hr/>
#### **getCertificationEngagement**
> Report getCertificationEngagement(query)

Get report containing information about engagement for certifications.

![sequence diagram](/diagrams/AnalyticsController-getCertificationEngagement-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **AnalyticsQuery**| Filters for analytics | [default to null] |

##### Return type

**Report**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **getClickData**
> getClickData(query)

Get raw clickstream data

![sequence diagram](/diagrams/AnalyticsController-getClickData-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **ClickDataQuery**| Filters for analytics | [default to null] |

##### Return type

null (empty response body)

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **getJobPostingEngagement**
> Report getJobPostingEngagement(query)

Get report containing information about engagement for job postings.

![sequence diagram](/diagrams/AnalyticsController-getJobPostingEngagement-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **AnalyticsQuery**| Filters for analytics | [default to null] |

##### Return type

**Report**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **getLearningMaterialEngagement**
> Report getLearningMaterialEngagement(query)

Get report containing information about engagement for learning material.

![sequence diagram](/diagrams/AnalyticsController-getLearningMaterialEngagement-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **AnalyticsQuery**| Filters for analytics | [default to null] |

##### Return type

**Report**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **getNewsEngagement**
> Report getNewsEngagement(query)

Get report containing information about engagement for news.

![sequence diagram](/diagrams/AnalyticsController-getNewsEngagement-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **AnalyticsQuery**| Filters for analytics | [default to null] |

##### Return type

**Report**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **getUserCurrentOccupationReport**
> Report getUserCurrentOccupationReport(query)

Get report containing information about users' current occupations and general locations.

![sequence diagram](/diagrams/AnalyticsController-getUserCurrentOccupationReport-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **AnalyticsQuery**| Filters for analytics | [default to null] |

##### Return type

**Report**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **getUserGoalOccupationReport**
> Report getUserGoalOccupationReport(query)

Get report containing information about users' goal occupations.

![sequence diagram](/diagrams/AnalyticsController-getUserGoalOccupationReport-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **AnalyticsQuery**| Filters for analytics | [default to null] |

##### Return type

**Report**

##### Authorization


Type
: auth0

Scopes
: smart_city_manager


<hr/>
#### **saveClickData**
> saveClickData(ClickData)

Submit clickstream data event

![sequence diagram](/diagrams/AnalyticsController-saveClickData-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **ClickData** | **ClickData**| Click event | |

##### Return type

null (empty response body)

##### Authorization


Type
: auth0

Scopes
: citizen

<hr/>