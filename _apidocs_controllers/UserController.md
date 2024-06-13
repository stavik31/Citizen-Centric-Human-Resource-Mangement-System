---
title: UserController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **deleteCurrentUserProfile** | **DELETE** /profile | Delete currently signed in user profile |
| **getCurrentUserProfile** | **GET** /profile | Get signed in user profile |
| **updateUserProfile** | **POST** /profile | Update signed in user profile |



<hr/>
#### **deleteCurrentUserProfile**
> deleteCurrentUserProfile()

Delete currently signed in user profile

![sequence diagram](/diagrams/UserController-deleteCurrentUserProfile-sequence.svg)

##### Parameters
This endpoint does not need any parameter.

##### Return type

null (empty response body)

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined


<hr/>
#### **getCurrentUserProfile**
> Profile getCurrentUserProfile()

Get signed in user profile

![sequence diagram](/diagrams/UserController-getCurrentUserProfile-sequence.svg)

##### Parameters
This endpoint does not need any parameter.

##### Return type

**Profile**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


<hr/>
#### **updateUserProfile**
> Profile updateUserProfile(Profile)

Update signed in user profile

![sequence diagram](/diagrams/UserController-updateUserProfile-sequence.svg)

##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **Profile** | **Profile**| Updated profile | |

##### Return type

**Profile**

##### Authorization

auth0

##### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

<hr/>