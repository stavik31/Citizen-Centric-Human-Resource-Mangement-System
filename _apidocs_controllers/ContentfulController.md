---
title: ContentfulController
---

The ContentfulController implements the webhook format defined by Contentful for receiving notifications of newly published or unpublished entries in the CMS. Internally, this populates the tables used by the LearningMaterialController.  ![class diagram](/diagrams/classDiagrams/Contentful.svg) 

| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **notifyEntryPublished** | **POST** /contentful/publish | Webhook for new learning material notification from contentful |
| **notifyEntryUnpublished** | **POST** /contentful/unpublish | Webhook for deleted learning material notification from contentful |



<hr/>
#### **notifyEntryPublished**
> notifyEntryPublished(ContentfulPublishEntry)

Webhook for new learning material notification from contentful

![sequence diagram](/diagrams/ContentfulController-notifyEntryPublished-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **ContentfulPublishEntry** | **ContentfulPublishEntry**| Event | |

##### Return type

null (empty response body)

##### Authorization


Type
: basic



<hr/>
#### **notifyEntryUnpublished**
> notifyEntryUnpublished(ContentfulUnpublishEntry)

Webhook for deleted learning material notification from contentful

![sequence diagram](/diagrams/ContentfulController-notifyEntryUnpublished-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **ContentfulUnpublishEntry** | **ContentfulUnpublishEntry**| Event | |

##### Return type

null (empty response body)

##### Authorization


Type
: basic


<hr/>