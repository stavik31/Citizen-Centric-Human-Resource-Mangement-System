---
title: NewsController
---



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

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>