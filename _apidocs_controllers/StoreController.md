---
title: StoreController
---



| Method | HTTP request | Description |
|------------- | ------------- | -------------|
| **deleteOrder** | **DELETE** /store/order/{orderId} | Delete purchase order by ID |
| **getInventory** | **GET** /store/inventory | Returns pet inventories by status |
| **getOrderById** | **GET** /store/order/{orderId} | Find purchase order by ID |
| **placeOrder** | **POST** /store/order | Place an order for a pet |


<hr/>
#### **deleteOrder**
> deleteOrder(orderId)

Delete purchase order by ID

For valid response try integer IDs with value &lt; 1000. Anything above 1000 or nonintegers will generate API errors


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **orderId** | **Long**| ID of the order that needs to be deleted | [default to null] |

##### Return type

null (empty response body)

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: Not defined

<hr/>
#### **getInventory**
> Map getInventory()

Returns pet inventories by status

Returns a map of status codes to quantities


##### Parameters
This endpoint does not need any parameter.

##### Return type

**Map**

##### Authorization

api_key

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

<hr/>
#### **getOrderById**
> Order getOrderById(orderId)

Find purchase order by ID

For valid response try integer IDs with value &lt;&#x3D; 5 or &gt; 10. Other values will generate exceptions.


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **orderId** | **Long**| ID of order that needs to be fetched | [default to null] |

##### Return type

**Order**

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/xml

<hr/>
#### **placeOrder**
> Order placeOrder(Order)

Place an order for a pet

Place a new order in the store


##### Parameters

|Name | Type | Description  | Notes |
|------------- | ------------- | ------------- | -------------|
| **Order** | **Order**|  | [optional] |

##### Return type

**Order**

##### Authorization

No authorization required

##### HTTP request headers

- **Content-Type**: application/json, application/xml, application/x-www-form-urlencoded
- **Accept**: application/json

<hr/>