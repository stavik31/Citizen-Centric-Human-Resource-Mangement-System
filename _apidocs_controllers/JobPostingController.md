---
title: JobPostingController
---

Access a list of available jobs by occupation

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **getJobPosting** | **GET** /jobs | Get job postings |



<hr/>
#### **getJobPosting**
> JobPostingResponse getJobPosting(query)

Get job postings

![sequence diagram](/diagrams/JobPostingController-getJobPosting-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **query** | **JobPostingQuery**| Filters for job postings | [optional] [default to null] |

##### Return type

**JobPostingResponse**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>