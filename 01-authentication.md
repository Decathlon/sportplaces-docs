# Authentication

## 1. Create an API client application

```shell
curl --request POST \
  --url 'https://sportplaces.api.decathlon.com/api/v1/clients' \
  --header 'content-type: application/json' \
  --data '{"client_name":"My Client Application","redirect_uris": ["https://client.example.com/callback"]}'
```

A JWT token is required for all `POST`, `PUT/PATCH`, and `DELETE` requests. 
Currently we use Auth0 to issue JWTs for third-party developers, and <a href="https://developers.decathlon.com/products">Decathlon Login</a> if you are part of Decathlon partner program.

All third-party developers must obtain an application `client_id` and `client_secret` issued by Auth0 via our dedicated API endpoint. 
You **MUST** set your name correctly, as there is currently no way to alter it after creation.

<aside class="warning">
	We are working on building a console to help you track your credentials. In the meantime, do not lose your client credentials once they are issued.
</aside>

## 2. Obtain a JWT Token

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
