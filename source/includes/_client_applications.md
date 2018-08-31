<hr class="hr-section-sep">
# Client Applications

## Creating an API client application

```shell
curl --request POST \
  --url 'https://decathlon.auth0.com/oidc/register' \
  --header 'content-type: application/json' \
  --data '{"client_name":"My Dynamic Client","redirect_uris": ["https://client.example.com/callback"]}'
```

A JWT token is required for all `POST`, `PUT/PATCH`, and `DELETE` requests. 
Currently we use Auth0 to issue JWTs for third-party developers, and Decathlon Connect for internal apps.

All third-party developers must obtain an application `client_id` and `client_secret` from Auth0. Currently we do not
have a dashboard to allow you to do this, so you must use their API directly. Do not lose your client credentials once
they are issued, so you will have no way to obtain them again.

<aside class="notice">
  Decathlon staff can obtain access to Decathlon Connect API by contacting the development team through our Google+ Community
</aside>

## Obtaining a JWT

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
