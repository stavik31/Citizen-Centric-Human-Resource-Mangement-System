---
title: NewsController
---

Access news related to an occupation  ![class diagram](/diagrams/classDiagrams/News.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getNews** | **GET** /news | Get news |



<hr/>
#### **getNews**
> NewsResponse getNews(query)

Get news

![sequence diagram](/diagrams/NewsController-getNews-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **NewsQuery**| Filters for news | [optional] [default to null] |

##### Return type

**NewsResponse**

##### Authorization


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>