---
title: JobPostingController
---

The JobPostingController provides operations for querying job postings relating to a given occupation. Internally, this delegates out to one or more third-party job posting APIs.  ![class diagram](/diagrams/classDiagrams/JobPostings.svg) 

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


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>