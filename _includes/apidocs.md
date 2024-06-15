The HTTP Application Programming Interface (API) provides a collection of services (referred to as operations
in this document) that can be utilized by the presentation tier to power its various user experiences and views.
The API is broken up into \"Controllers\", each of which bundles together all of the operations for its
respective bounded context (with additional controllers for third-party integrations as needed).

For reference, each controller section includes a UML class diagram demonstrating the internal structure of
the controller and its dependencies. Additionally, each operation provides a UML sequence diagram showing how
those dependencies interact in the flow of that specific request type.


### Authorization


auth0
: **Type**: OAuth
: **Flow**: accessCode
: **Authorization URL**: https://dev-2rwfim8h3qzkydvj.us.auth0.com/authorize
: **Scopes**: 
  - citizen: A regular citizen user of the application
  - smart_city_manager: A smart city manager

basic
: **Type**: HTTP basic authentication
