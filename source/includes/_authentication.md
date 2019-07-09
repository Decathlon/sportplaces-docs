<hr class="hr-section-sep">
# Authentication

## 1. Create an API client application

```shell
curl --request POST \
  --url 'https://decathlon.auth0.com/oidc/register' \
  --header 'content-type: application/json' \
  --data '{"client_name":"My Dynamic Client","redirect_uris": ["https://client.example.com/callback"]}'
```

A JWT token is required for all `POST`, `PUT/PATCH`, and `DELETE` requests. 
Currently we use Auth0 to issue JWTs for third-party developers, and [Decathlon Login](https://developers.decathlon.com/products) if you are part of Decathlon partner program.

All third-party developers must obtain an application `client_id` and `client_secret` from Auth0. 

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places"
  -H "Authorization: Bearer XXXXXX"
```

You must authenticate your requests with an API token in the header.
E.g.: `Authorization: Bearer XXXXXXXXXX`

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
<a href="https://auth0.com/docs/api-auth/dynamic-client-registration#configure-your-client">Auth0 documentation</a>
for more information about these params.

Once the user has completed their login, they will be redirected back to your application with a JWT in the hash
fragment of the URI.

<aside class="warning">
For security reasons, please note the JWT Token is only valid for 15 minutes. You will need to refresh it regularly. 
</aside>