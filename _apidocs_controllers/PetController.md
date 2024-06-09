---
title: PetController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **addPet** | **POST** /pet | Add a new pet to the store |
| **deletePet** | **DELETE** /pet/{petId} | Deletes a pet |
| **findPetsByStatus** | **GET** /pet/findByStatus | Finds Pets by status |
| **findPetsByTags** | **GET** /pet/findByTags | Finds Pets by tags |
| **getPetById** | **GET** /pet/{petId} | Find pet by ID |
| **updatePet** | **PUT** /pet | Update an existing pet |
| **updatePetWithForm** | **POST** /pet/{petId} | Updates a pet in the store with form data |
| **uploadFile** | **POST** /pet/{petId}/uploadImage | uploads an image |


<hr/>
#### **addPet**
> Pet addPet(Pet)

Add a new pet to the store

Add a new pet to the store


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **Pet** | **Pet**| Create a new pet in the store | |

##### Return type

**Pet**

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: application/json, application/xml, application/x-www-form-urlencoded
- **Accept**: application/json, application/xml

<hr/>
#### **deletePet**
> deletePet(petId, api\_key)

Deletes a pet

delete a pet


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **petId** | **Long**| Pet id to delete | [default to null] |
| **api\_key** | **String**|  | [optional] [default to null] |

##### Return type

null (empty response body)

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<hr/>
#### **findPetsByStatus**
> List findPetsByStatus(status)

Finds Pets by status

Multiple status values can be provided with comma separated strings


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **status** | **String**| Status values that need to be considered for filter | [optional] [default to available] [enum: available, pending, sold] |

##### Return type

**List**

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/xml

<hr/>
#### **findPetsByTags**
> List findPetsByTags(tags)

Finds Pets by tags

Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **tags** | **List**| Tags to filter by | [optional] [default to null] |

##### Return type

**List**

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/xml

<hr/>
#### **getPetById**
> Pet getPetById(petId)

Find pet by ID

Returns a single pet


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **petId** | **Long**| ID of pet to return | [default to null] |

##### Return type

**Pet**

##### Authorization

petstore_auth, api_key

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/xml

<hr/>
#### **updatePet**
> Pet updatePet(Pet)

Update an existing pet

Update an existing pet by Id


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **Pet** | **Pet**| Update an existent pet in the store | |

##### Return type

**Pet**

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: application/json, application/xml, application/x-www-form-urlencoded
- **Accept**: application/json, application/xml

<hr/>
#### **updatePetWithForm**
> updatePetWithForm(petId, name, status)

Updates a pet in the store with form data




##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **petId** | **Long**| ID of pet that needs to be updated | [default to null] |
| **name** | **String**| Name of pet that needs to be updated | [optional] [default to null] |
| **status** | **String**| Status of pet that needs to be updated | [optional] [default to null] |

##### Return type

null (empty response body)

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<hr/>
#### **uploadFile**
> ApiResponse uploadFile(petId, additionalMetadata, body)

uploads an image




##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **petId** | **Long**| ID of pet to update | [default to null] |
| **additionalMetadata** | **String**| Additional Metadata | [optional] [default to null] |
| **body** | **File**|  | [optional] |

##### Return type

**ApiResponse**

##### Authorization

petstore_auth

##### HTTP request headers

- **Content-Type**: application/octet-stream
- **Accept**: application/json

<hr/>