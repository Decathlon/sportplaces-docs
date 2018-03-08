# Authentication

```shell
curl "https://sportsplaces.herokuapp.com/api/v1/places"
  -H "apikey: XXXXXX"
```

**`GET` requests do not require authentication.**

Until we are able to obtain usage of the Decathlon Connect API with OAuth2, a static API key is used for all `POST`,
`PUT`, and `DELETE` requests. This means that your code must not be published to the public internet. It is forbidden to
publish an application that contains this key. Remember: this is for internal use only.

You must present the API key in a header called: `apikey`

<aside class="notice">
  You can obtain the API key by contacting the development team through our 
  <a href="https://plus.google.com/u/2/communities/110282251333522025242">Google Community</a>
</aside>
