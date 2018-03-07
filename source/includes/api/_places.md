# Places

## Get All Places

```shell
curl "https://sportsplaces.herokuapp.com/api/v1/api/places"
  -H "Authorization: xxxxxxxxxxxxxx"
```

> The above command returns JSON structured like this:

```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "properties": {
                "uuid": "030b2542-9d12-4dd9-9066-56ec394cee2d",
                "name": "6545 Rue Drolet",
                "google_place_id": "ChIJI8qKj24ZyUwRUEOD0sHtUZs",
                "contact_details": {
                    "email": null,
                    "phone": null,
                    "website": null,
                    "booking_url": null,
                    "facebook_username": null
                },
                "address_components": {
                    "address": "6545 Rue Drolet",
                    "city": "Montréal",
                    "province": "Québec",
                    "country": "CA"
                },
                "activities": {
                    "150": {
                        "tags": [],
                        "surface": "concrete"
                    }
                }
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -73.6067104,
                    45.5338368
                ]
            }
        },
        {
            "type": "Feature",
            "properties": {
                "uuid": "28ce8c0f-527c-43bd-ab3a-5b9e2946d04a",
                "name": "Montreal",
                "google_place_id": "ChIJDbdkHFQayUwR7-8fITgxTmU",
                "contact_details": {
                    "email": null,
                    "phone": null,
                    "website": null,
                    "booking_url": null,
                    "facebook_username": null
                },
                "address_components": {
                    "address": "",
                    "city": "Montreal",
                    "province": "Quebec",
                    "country": "CA"
                },
                "activities": {
                    "150": {
                        "tags": [],
                        "surface": "concrete"
                    }
                }
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -73.567256,
                    45.5016889
                ]
            }
        }
    ]
}
```

This endpoint retrieves all places.

### HTTP Request

`GET https://sportsplaces.herokuapp.com/api/v1/api/places`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
sw | [] | Origin Bounds (South West)
ne | [] | Origin Bounds (North East)
sport_ids | [] | If passed in, filter places by Sport IDs

<!--<aside class="success">
Remember — a happy place is an authenticated place!
</aside> -->

## Get a Specific Place

```shell
curl "https://sportsplaces.herokuapp.com/api/v1/api/places/2"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific place.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET https://sportsplaces.herokuapp.com/api/v1/places/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the place to retrieve

## Delete a Specific Place

```shell
curl "https://sportsplaces.herokuapp.com/api/v1/api/places/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific place.

### HTTP Request

`DELETE https://sportsplaces.herokuapp.com/api/v1/places/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the place to delete
