# Authentication

## 1. Get your API client application

Instructions to get your API credentials will be sent to you by email after you sign up <a href="https://mailchi.mp/decathlon/sportplacesapi" target="_blank">here</a>. If you lost them, sign up under a different email or contact us.

## 2. Obtain a JWT Token

A JWT token is required for all `POST`, `PUT/PATCH`, and `DELETE` requests. 
Currently we use Auth0 to issue JWTs for third-party developers, and <a href="https://developers.decathlon.com/products" target="_blank">Decathlon Login</a> if you are part of Decathlon partner program.

All third-party developers must obtain an application `client_id` and `client_secret` issued by Auth0 via our dedicated API endpoint. 

```
https://decathlon.auth0.com/authorize?
  audience=sportplaces-api.herokuapp.com&
  scope=openid%20profile%20email&
  response_type=id_token&
  client_id={CLIENT_ID}&
  redirect_uri={REDIRECT_URI}&
  nonce={CRYPTOGRAPHIC_NONCE}
  state={OPAQUE_VALUE}
```

To obtain a JWT, you must redirect your users to a specific URL containing:

* Your `client_id`
* Your desired `redirect_uri`
* A cryptographic `nonce` to prevent replay attacks
* Your application `state` to prevent CSRF attacks

Please see the 
<a href="https://auth0.com/docs/api-auth/dynamic-client-registration#configure-your-client" target="_blank">Auth0 Documentation</a>
for more information about these parameters.

Once the user has completed their login, they will be redirected back to your application with a JWT in the hash
fragment of the URI.

<aside class="warning">
For security reasons, please note the JWT Token is only valid for 15 minutes. You will need to refresh it regularly. 
</aside>

## 3. Using a JWT

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places"
  -H "Authorization: Bearer XXXXXX"
```

**`GET` requests do not require authentication**

You must authenticate all `POST`, `PUT/PATCH`, and `DELETE` requests with a JWT in the Authorization header.
