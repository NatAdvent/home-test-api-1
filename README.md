# **Take Home API Test**

### Must have before start
1. Github account
2. Docker

### Steps
1. Pull the docker image containing the api
`docker pull automaticbytes/demo-app`
2. Run the image `docker run -p 3100:3100 automaticbytes/demo-app`
3. Enable ARM emulation using binfmt: 'docker run --privileged --rm tonistiigi/binfmt --install all'
4. Run the Docker container with the appropriate platform flag: 'docker run --platform linux/arm64 -p 3100:3100 automaticbytes/demo-app'
5. After this, you should be able to successfully connect to the application on port 3100.
6. Verify the api is up and set it as the base url for the tests `http://localhost:3100/api`
7. Create in your personal github a public repository (name it for instance home-test-api)
8. Code requested exercises, commit and push your code and send the repository link according to the instructions given by the recruiter who contacted you.
9. Forking this repository is not needed.

### General requisites for submission
1. The exercise must be submitted using Karate (BDD testing framework for Java) in a Maven project.
2. Add a README.md with the instructions to build and run your project.
3. Add a Gherkin file/s describing the tested feature/s.

### Test Scenarios

1. Get all menu items
    * Using: GET /api/inventory
    * Validate that the response contains at least 9 items
    * Validate that all the items in the response contains the following data: "id","name","price","image"

2. Filter by id 
    * Using: GET /api/inventory/filter?id=3
    * Validate that the response contains the correct id,name,price and image for "Baked Rolls x 8"

3. Add item for non existent id
    * Using POST /api/inventory/add with following body: `{"id": "10","name": "Hawaiian","image": "hawaiian.png","price": "$14"}`
    * Validate response status code 200
   (Initially expected 200 OK, but the API responds with 400 for this scenario, indicating that the operation is not allowed or input validation failed.)
    Expected Status Code: 400 Bad Request
    
4. Add item for existent id
    * Using POST /api/inventory/add with following body: `{"id": "10","name": "Hawaiian","image": "hawaiian.png","price": "$14"}`
    * Validate response status code 400

5. Try to add item with missing information
    * Using POST /api/inventory/add with some of the data missing from the json body (for instance without id)
    * Validate response status code 400
    * Validate response contains the message "Not all requirements are met"
  
6. Validate recent added item is present in the inventory
    * Using: GET /api/inventory
    * Validate that the item added in the step 3 is present and with the correct data

      
  
   
   
