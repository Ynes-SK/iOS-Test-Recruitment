**REFLECTION**

##Architecture: Clean Architecture

I chose Clean Architecture with 3 main layers: DataSource, Domaine, Presentation.

__The goal__ 

1- separate concerns and responsabilities
2- easier to maintain, test and make any changes by keeping the business logic independent

__Contains__

1- DataSource Layer 
2- Doamin Layer
3- Presentation Layer

__1. DataSource__

I created a Networking Layer that contains:
 _ APIClient : making the API Requests needed
 _ EndPoint: the commun API EndPoint
 _ ItemEndPoint: the endPoints related to listings
 _ APIError: define the possible errors to handle in networking


__2. Domain__


__3. Presentation__


