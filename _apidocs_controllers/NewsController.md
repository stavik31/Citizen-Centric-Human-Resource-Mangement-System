---
title: NewsController
---

The NewsController provides operations for querying news for a specific SOC code. Internally, this news is retrieved from a set of RSS feeds maintained in the application configuration and is internally mapped to one or more SOC codes using doc2vec and cosine similarity. See the News section of the application tier design for more information.  ![class diagram](/diagrams/classDiagrams/News.svg) 

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