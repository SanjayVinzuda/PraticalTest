>> Added all related models and relationship with proper desiging using bootstrap.


>> I have added gem 'devise-token_authenticatable' into the gemfile for the authentication token API.

>> Added authentication_token field for store auth token.

>> If a user is not loggedIn. It'll give you the error as a response.
    
    {"error": "You need to sign in or sign up before continuing."}


>> If you want to login via auth token then try it using auth token like this: 
    auth_token must be dynamic.

    http://localhost:3000/?auth_token=Hwne5gL6TNDYzYf4UVzD



>> To List all Products
    Select 'GET' request from the postman and set below the URL.

    http://localhost:3000/products.json?auth_token=Hwne5gL6TNDYzYf4UVzD

- If you want to fetch all products of the current user then try below API which contains user's auth_token.




>> To Create product :

    Select 'POST' request from the postman and set below the URL.
    http://localhost:3000/products
    Go to the body part and select JSON and pass all fields.
    Select a row and insert a JSON object:
    {
        "name" : "Product 2",
        "description" : "Product description",
        "price" : "100"
    }


>> To Update Product
    Select 'PUT' request from the postman and set below URL:
    http://localhost:3000/products/10
        Go to the body part and select JSON and pass all fields.
    Select a row and insert a JSON object:
    {
        "name" : "Product 2.1",
        "description" : "Product description Edited",
        "price" : "111"
    }


>> To Show Product
    Select 'GET' request from the postman and set below URL:
    http://localhost:3000/products/2

    It'll provide you the below response.

    {
    "id": 2,
    "name": "New Product",
    "description": "API product description",
    "price": "40.0",
    "user_id": 1,
    "created_at": "2019-07-27T05:38:14.480Z",
    "updated_at": "2019-07-27T05:38:14.480Z",
    "url": "http://localhost:3000/products/2.json"
    }


>> To Delete Product
    Select 'DELETE' request from the postman and set below URL:
    http://localhost:3000/products/8
    And click on the Send button to delete request API.
    It'll provide you below response after successfully delete.
    {
    "success": true
    }



http://localhost:3000/users/edit



>> If you want to reset auth token manually then go to below link after login and click on reset token:

	http://localhost:3000/users/edit



http://localhost:3000/sidekiq/busy