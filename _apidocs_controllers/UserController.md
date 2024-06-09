---
title: UserController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **createUser** | **POST** /user | Create user |
| **createUsersWithListInput** | **POST** /user/createWithList | Creates list of users with given input array |
| **deleteUser** | **DELETE** /user/{username} | Delete user |
| **getUserByName** | **GET** /user/{username} | Get user by user name |
| **loginUser** | **GET** /user/login | Logs user into the system |
| **logoutUser** | **GET** /user/logout | Logs out current logged in user session |
| **updateUser** | **PUT** /user/{username} | Update user |


<hr/>
#### **createUser**
> User createUser(User)

Create user

This can only be done by the logged in user.


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **User** | **User**| Created user object | [optional] |

##### Return type

**User**

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: application/json, application/xml, application/x-www-form-urlencoded
- **Accept**: application/json, application/xml

<hr/>
#### **createUsersWithListInput**
> User createUsersWithListInput(User)

Creates list of users with given input array

![getCertifications sequence diagram](/diagrams/CertificationController-getCertifications-sequence.svg)


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **User** | **List**|  | [optional] |

##### Return type

**User**

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json, application/xml

<hr/>
#### **deleteUser**
> deleteUser(username)

Delete user

This can only be done by the logged in user.


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **username** | **String**| The name that needs to be deleted | [default to null] |

##### Return type

null (empty response body)

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<hr/>
#### **getUserByName**
> User getUserByName(username)

Get user by user name




##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **username** | **String**| The name that needs to be fetched. Use user1 for testing.  | [default to null] |

##### Return type

**User**

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/xml

<hr/>
#### **loginUser**
> String loginUser(username, password)

Logs user into the system




##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **username** | **String**| The user name for login | [optional] [default to null] |
| **password** | **String**| The password for login in clear text | [optional] [default to null] |

##### Return type

**String**

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/xml, application/json

<hr/>
#### **logoutUser**
> logoutUser()

Logs out current logged in user session




##### Parameters
This endpoint does not need any parameter.

##### Return type

null (empty response body)

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<hr/>
#### **updateUser**
> updateUser(username, User)

Update user

This can only be done by the logged in user.


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **username** | **String**| name that need to be deleted | [default to null] |
| **User** | **User**| Update an existent user in the store | [optional] |

##### Return type

null (empty response body)

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: application/json, application/xml, application/x-www-form-urlencoded
- **Accept**: Not defined

<hr/>