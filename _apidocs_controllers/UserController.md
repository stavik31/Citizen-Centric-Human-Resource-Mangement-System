---
title: UserController
---

The UserController provides operations for querying and managing the current user profile. This is determined by the sid value in the bearer token provided by the client on each operation request. For more information, see the Authorization section of this document or the Auth0 integration details.  ![class diagram](/diagrams/classDiagrams/User.svg) 

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


Type
: auth0

Scopes
: smart_city_manager


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


Type
: auth0

Scopes
: citizen
: smart_city_manager


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


Type
: auth0

Scopes
: citizen
: smart_city_manager

<hr/>