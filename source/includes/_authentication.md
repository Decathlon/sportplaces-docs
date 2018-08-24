<hr class="hr-section-sep">
# Authentication

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places"
  -H "Authorization: Bearer XXXXXX"
```

**`GET` requests do not require authentication.**

A JWT token is required for all `POST`, `PUT/PATCH`, and `DELETE` requests. 
To obtain a token please refer to the **Decathlon Connect API**

You must authenticate your requests with an API token in the header.
E.g.: `Authorization: Bearer XXXXXXXXXX`

<aside class="notice">
  You can obtain access to Decathlon Connect API by contacting the development team through our 
  <a href="https://plus.google.com/u/2/communities/110282251333522025242">Google Community</a>
</aside>
