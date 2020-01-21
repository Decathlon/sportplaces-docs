# Authentication

Currently `POST`, `PUT/PATCH`, and `DELETE` requests require authentication.

`GET` requests are exempt.

We use Auth0 to issue JWTs for third-party developers, and <a href="https://developers.decathlon.com/products" target="_blank">Decathlon Login</a> if you are part of the Decathlon partner program.

Third-party developers can also opt to get an application `client_id` and `client_secret` via our dedicated API endpoint. 

<aside class="warning">
  Note for <strong>Decathlon Partners</strong>: If you're a Decathlon Partner planning on using our API, make sure to
  request access to the following scopes when signing up for Decathlon Login:
  `openid, contacts, email, profile`. Our application requires these scopes in
  order to properly identify the user.
</aside>


## Method #1 - JWT 

### Obtain a JWT Token via Auth0

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

### Using a JWT (Auth0 / Decathlon Connect)

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places"
  -H "Authorization: Bearer XXXXXX"
```

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed. JWTs can be signed using a secret (with the HMAC algorithm) or a public/private key pair using RSA or ECDSA.

## Method #2 - Client ID / Client Secret

### Creating an API client application

```shell
curl --request POST \
  --url 'https://sportplaces.api.decathlon.com/api/v1/clients' \
  --header 'content-type: application/json' \
  --data '{"client_name":"My Client Application","redirect_uris": ["https://client.example.com/callback"]}'
```

Make sure you have you client_name and redirect_uris set correctly.

### Using a client_id / client_secret

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places"
  -H "Authorization: Basic XXXXXX"
```

The <a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication#Basic_authentication_scheme" target="_blank">Basic Authentication scheme</a> requires credentials to be encoded with base64 before they are sent along with the request.

We are working on building a console to help you track your credentials. In the meantime, do not lose your client credentials once they are issued.

