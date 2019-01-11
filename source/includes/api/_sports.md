# Sports

## Get a list of sports

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports"
```

> JSON response:

```json
{
    {
        "id": 186,
        "name": "Diving",
        "tags": [
            "free",
            "outdoor",
            "lessons",
            "space_for_children"
        ],
        "filters": [
            "size",
            "quality"
        ]
    },
    ...
}
```
<aside class="warning">
  This endpoint will be deprecated in the next version of the Sport Places
  API, in favour of the <a href="https://developers.decathlon.com/sports">Sports
  API</a>
<br/>
  * Note the HTTP Header <strong>X-Deprecation-Warning</strong> on the response.
</aside>

Retrieves a list of all supported Decathlon sports (as defined by Decathlon), plus the allowed tags and filters for
each.

The sports are returned in an object consisting of several key/value groups - the keys of which are the Sport IDs in
string format.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/sports`

## Show details for one sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports/186"
```

> JSON response:

```json
{
    "id": 186,
    "name": "Diving",
    "tags": [
        "free",
        "outdoor",
        "lessons",
        "space_for_children"
    ],
    "filters": [
        "size",
        "quality"
    ]
}
```

Retrieves details for one specific sport. Included are the English name, and the allowed tags and filters.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID`
