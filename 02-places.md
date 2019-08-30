# Sport Places

This endpoint retrieves all the sport places meeting specific criterias. 

## Concrete example

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places?origin=-73.582,45.511&radius=99&sports=175"
```

> JSON response:

```json
{
    "links": {
        "self": "https://sportplaces.api.decathlon.com/api/v1/places?origin=-73.5826985%2C45.5119864&page=1&radius=99",
        "next": "https://sportplaces.api.decathlon.com/api/v1/places?origin=-73.5826985%2C45.5119864&page=2&radius=99"
    },
    "count": 100,
    "data": {
      "type": "FeatureCollection",
      "features": [
          {
            "type": "Feature",
            "properties": {
                "uuid": "8b1e3027-e438-42c2-92ab-5ebd23f68d54",
                "name": "McConnell Arena",
                "slug": "mcconnell-arena",
                "google_place_id": "ChIJ5XD-5zAayUwRIK7t7t89ZJ0",
                "contact_details": {
                    "email": null,
                    "phone": "+1 514-398-7017",
                    "website": null,
                    "booking_url": null,
                    "facebook_username": null
                },
                "address_components": {
                    "address": "3883 Rue University",
                    "city": "Montréal",
                    "province": "Québec",
                    "country": "CA"
                },
                "activities": [
                  {
                    "sport_id": 160,
                    "tags": [],
                    "attributes": {
                      "difficulty": 2,
                      "distance": 10
                    }
                  }
                ]
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -73.5826985,
                    45.5119864
                ]
            }
        }
    ]
  }
}

```


### Return all ice hockey sport places within 99km around McGill University in Montréal, Canada.


Parameter             | Value                     | Description
---------             | -------                   | -----------
sports                | 175                       | 175 is the **sport id** for **ice hockey** as per our <a href="https://developers.decathlon.com/products/sports">Sports API</a>
origin                | -73.582,45.511            | longitude,latitude of your location
radius                | 99                        | 99km around my latitude and longtitude

Go ahead and copy and paste this request in your browser to test it.

`https://sportplaces.api.decathlon.com/api/v1/places?origin=-73.582,45.511&radius=99&sports=175`

Works? Great! 

Keep reading the documentation to build your own queries. If you have any questions, head to the [support section](#support).

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places`

### Query Parameters

Most parameters are optional, but certain logical combinations (such as `sw` and `ne`, or `origin` and `radius`)
must both be sent together if one is.

Coordinates (`sw`, `ne`, `origin`, `user_origin`) are comma separated string representations of geographic locations. As
per the GeoJSON standard, these are formatted as: `lng,lat` - the reverse of several other standards.

Results are ordered by proximity to the `user_origin` or `origin` if the former
isn't provided.

A bounding box (set by `sw` & `ne`), or the `radius` must not exceed 100km in length.

Min/max value pairs do not both need to be specified. For example, use only `min_distance=300` to find activities with
a distance of over 300 metres, with no upper limit. 

The fields `difficulty`, `cellphone_service`, and `quality` are integer values `[0, 1, 2]` representing 
`['Beginner', 'Intermediate', 'Advanced']`, or `['poor', 'acceptable', 'good']`.

The number of results per page is limited to a max of 100. 
E.g.: `&page=2` should give you the remaining set of results.

Search query errors will be responded to with specific error information, and an `HTTP 422` status code.

Parameter             | Example                   | Description
---------             | -------                   | -----------
sw                    | `'-73.58,45.51'`          | Bounding box corner (South West)
ne                    | `'-73.08,45.91'`          | Bounding box corner (North East)
origin                | `'-73.58,45.51'`          | Central point from which to search for places
radius                | `10`                      | Number of kilometres around the origin to search
user_origin           | `'-73.08,45.91'`          | The current location of the end-user making the request. Used to calculate proximity.
sports                | `'175,160'`               | Filters results based on Decathlon Sport ID
tags                  | `'free,equipment_rental'` | Restricts search results to only those matching all set tags
surface               | `clay,concrete`           | Restricts search results to only those matching specified surface types
min_difficulty        | `0`                       | Integer [0, 1, 2] representing the minimum difficulty level
max_difficulty        | `2`                       | Integer [0, 1, 2] representing the maximum difficulty level
min_duration          | `60`                      | Minimum number of minutes for the sporting activities
max_duration          | `3660`                    | Maximum number of minutes allowed for the sporting activities
min_distance          | `10`                      | Minimum required distance in metres for the activities
max_distance          | `100`                     | Maximum allowed distance in metres for the activities
min_elevation_gain    | `50`                      | Minimum required vertical elevation change in metres for the activities
max_elevation_gain    | `250`                     | Maximum allowed vertical elevation change in metres for the activities
min_cellphone_service | `0`                       | Minimum required cell reception level in the area
max_cellphone_service | `2`                       | Maximum allowed cell reception level in the area
min_quality           | `0`                       | Minimum required playing surface quality for the sporting activity
max_quality           | `2`                       | Minimum required playing surface quality for the sporting activity
limit                 | `10`                      | Number of records to be returned per call
created_at            | `desc`                    | Order of results by creation date (asc or desc)
days                  | `7`                       | Number of days from now from which places have been created
page                  | `2`                       | Number of pagination of results
partner               | `amilia`                  | Restrict results to only the specified partner (slug)
featured              | `true`                    | Restrict results to only handpicked featured places (boolean)


## Retrieving Place Information

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID"
# OR
curl "https://sportplaces.api.decathlon.com/api/v1/places/PLACE_SLUG"
```

> JSON response:

```json
{
    "type": "Feature",
    "properties": {
        "uuid": "488c45cf-2d7c-4903-9477-01249966adcf",
        "name": "Studio Bizz Mount Royal",
        "slug": "studio-bizz-mount-royal",
        "proximity": null,
        "user": {
            "identifier": "0",
            "first_name": "Decathlon",
            "last_name": "IT",
            "staff": true
        },
        "partner": null,
        "featured": false,
        "created_at": "2018-04-16 03:19:21 UTC",
        "google_place_id": "ChIJJSVAUdAbyUwRKvTXuACHnqg",
        "contact_details": {
            "email": null,
            "phone": "+1 514-526-2499",
            "website": null,
            "booking_url": null,
            "facebook_username": null
        },
        "address_components": {
            "address": "551 Avenue du Mont-Royal Est",
            "city": "Montréal",
            "province": "Québec",
            "country": "CA"
        },
        "activities": [
            {
                "sport_id": 100,
                "tags": [
                    "lessons"
                ],
                "photo_reference": "CmRaAAAA7zB04n0YClB-QsAYy5ajwJvw4FbGoPovFwsU0rnvzyXAPbhIrFIgBbD3YP4ktUiLAt08G_Ij0reuSkICg62ycKregB-bG93z9VBZlsKaQQ6_W3oxwSLi4z7m-3GP1NiIEhDIR732x9Vy3hlwiC2Wg4OhGhRGJ9RYl8yhYunKA5HBktDqWj1XRw",
                "user": {
                    "identifier": "0",
                    "first_name": "Decathlon",
                    "last_name": "IT",
                    "staff": true
                },
                "attributes": {
                    "difficulty": 0
                },
                "image": {}
            },
            {
                "sport_id": 292,
                "tags": [
                    "lessons"
                ],
                "photo_reference": "CmRaAAAA7zB04n0YClB-QsAYy5ajwJvw4FbGoPovFwsU0rnvzyXAPbhIrFIgBbD3YP4ktUiLAt08G_Ij0reuSkICg62ycKregB-bG93z9VBZlsKaQQ6_W3oxwSLi4z7m-3GP1NiIEhDIR732x9Vy3hlwiC2Wg4OhGhRGJ9RYl8yhYunKA5HBktDqWj1XRw",
                "user": {
                    "identifier": "0",
                    "first_name": "Decathlon",
                    "last_name": "IT",
                    "staff": true
                },
                "attributes": {
                    "difficulty": 0
                },
                "image": {}
            }
        ],
        "notes": "Cours de différents styles de danse, tous niveaux ( débutant à avancé). Cours pour enfants"
    },
    "geometry": {
        "type": "Point",
        "coordinates": [
            -73.581967,
            45.525197
        ]
    }
}
```

This endpoint retrieves data about a single place rather than a collection of
places in a specific geolocation.

Places can be retrieved by their `UUID` or `slug` properties.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/PLACE_SLUG`

### Query Parameters

The only accepted (and required) parameter for this endpoint is the place UUID.
<br/>

## Adding Places

```shell
curl 
  -X POST 
  -H "Content-Type: application/json" 
  -H 'Authorization: Bearer XXXXXX'
  -d "@data.json" 
  https://sportplaces.api.decathlon.com/api/v1/places
```

> Using a Google Place ID

```json
{
  "google_place_id":"ChIJm7QDm0Y36IkRbbD20K2fC24",
  "activities": [
    {
      "sport_id": "175",
      "tags": ["free"],
      "distance": 10,
      "difficulty": 2
    },
    {
      "sport_id": "160",
      "tags": ["free"],
      "distance": 10,
      "difficulty": 2,
      "duration": 10,
      "elevation_gain": 0,
      "cellphone_service": 1
    }
  ],
  "notes": "Lorem Ipsum dolor amet sit..."
}
```

> Using GeoJSON geometry

```json
{
	"name": "Example Path",
	"country": "CA",
	"activities": [
    {
      "sport_id": "175",
      "tags": ["free"]
    }
  ],
	"notes": "Lorem Ipsum dolor amet sit",
	"geometry": {
		"type": "Linestring",
		"coordinates": [
			[-73.5826985, 45.5119864],
			[-73.581, 45.512]
		]
	}
}
```

This endpoint creates places based on a Google Place ID and an Activity (Sport
ID)

<aside class="warning">
All places added via the Sport Places API go through moderation by someone from our team to make sure we have quality data stored.
</aside>

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/places`

### Request Parameters (using a Google Place ID)

Parameter             | Value                          | Description
---------             | -------                        | -----------
google_place_id       | `ChIJm7QDm0Y36IkRbbD20K2fC24`  | A Google Place ID
activities            | See below                      | A list of sporting activities to add to this place
notes                 | `Any text you like`            | Optional freeform text notes to add to a place

`Google Place ID` and the `activities` array are mandatory.
Within the Activities array are hashes that represent each activity and its filters

### Request Parameters (using geometry and name data)

Parameter             | Value                          | Description
---------             | -------                        | -----------
geometry              | GeoJSON geometry feature       | A GeoJSON formatted geometry feature, either a `Point`, `Linestring`, or `Polygon`
activities            | See below                      | A list of sporting activities to add to this place
country               | `CA`                           | Two letter ISO country code
notes                 | `Any text you like`            | Optional freeform text notes to add to a place

`geometry`, `name`, `country`, and the `activities` array are mandatory.
Within the Activities array are hashes that represent each activity and its filters

### Activity Properties

Required properties: 

Parameter | Example               | Description
--------- | -------               | -----------
sport_id  | `175`                 | Reference to the Sport this activity belongs to.
tags      | `['equipment_rental', 'lessons']` | (optional) Array of tags(strings). See [Sport Tags](#sport_tags) for more info.

Filters are not required by default, but are highly recommended for a better
user experience.
Most filters will have a numeric value.

<aside class="notice">
If a google_place_id has already been added, that Place will be
updated with the new Activities provided in the JSON request. This is a
non-destructive method, however. Activities are not reset upon each request.
</aside>

## Updating/Editing Places
```shell
curl
  -X PUT
  -H "Content-Type: application/json"
  -H 'Authorization: Bearer XXXXXX'
  -d "@data.json"
  https://sportplaces.api.decathlon.com/api/v1/places/:place_id
```

> JSON request [@data.json]

```json
{
  "name": "McGee Park",
  "email": "johndoe@decathlon.ca", 
  "phone": "+1 555 555 5555", 
  "website": "https://example.com", 
  "booking_url": "http://example.com/book-now",
  "facebook_username": "johndoe",
  "address": "123 Easy St",
  "city": "Montreal",
  "province": "QC",
  "country": "CA",
  "featured": true,
  "notes": "Lorem Ipsum dolor amet sit..."
}
```
This endpoint updates places parameters.

> NOTE: Activities should be updated using the Activities endpoint

### HTTP Request

`PUT https://sportplaces.api.decathlon.com/api/v1/places/:place_id`

### Request Parameters

Parameter         | Example                          | Description
---------         | -------                          | -----------
name              | `'McGee Park'`                   | Name of the place
email             | `'john.doe@example.com'`         | Contact Email
phone             | `'1 555 555 5555 ext 123'`       | Phone number
website           | `'https://example.com'`          | Venue Website
booking_url       | `'https://example.com/book-now'` | Booking Website
facebook_username | `'mcgee-park'`                   | Username on Facebook
address           | `'123 Easy St.'`                 | Street address
city              | `'Montreal'`                     | City where place is located
province          | `'QC'`                           | Province where place is located
country           | `'CA'`                           | Country code where place is located
notes             | `'Lorem Ipsum ...'`              | Localized arbitrary notes provided by the user.
featured          | `false|true`                     | Whether place is featured by a partner (only available for Decathlon Partners)


> JSON response

```json
{
    "type": "Feature",
    "properties": {
        "uuid": "750cbd99-a9b1-4d2f-a271-ba8866296cf6",
        "name": "660 Terry Rd",
        "google_place_id": "ChIJm7QDm0Y36IkRbbD20K2fC24",
        "featured": true,
        "user": [
            {
                "user_id": "1235781113",
                "first_name": "John",
                "last_name": "Doe",
                "staff": true
            }
        ],
        "contact_details": {
            "email": null,
            "phone": null,
            "website": null,
            "booking_url": null,
            "facebook_username": null
        },
        "address_components": {
            "address": "660 Terry Road",
            "city": "Hauppauge",
            "province": "New York",
            "country": "US"
        },
        "activities": [
            {
                "sport_id": 175,
                "tags": [
                    "free"
                ],
                "attributes": {
                  "difficulty": 2,
                  "distance": 10
                }
            },
            {
                "sport_id": 160,
                "tags": [
                    "free"
                ],
                "attributes": {
                  "difficulty": 2,
                  "duration": 10,
                  "distance": 10,
                  "elevation_gain": 0,
                  "cellphone_service": 1
                }
            }
        ]
    },
    "geometry": {
        "type": "Point",
        "coordinates": [
            -73.167277,
            40.8188078
        ]
    }
}
```

## Marking a place as featured

```shell
curl
  -X PUT
  -H "Content-Type: application/json"
  -H "Authorization: Bearer XXXXX"
  -d "@data.json"
  https://sportplaces.api.decathlon.com/api/v1/places/:place_id
```

Decathlon Partners are able to mark select places as featured in our API, to do
so simply authenticate as a partner and make a PUT request to a place much like
updating a place (See above), in fact the process is identical.

> JSON request [@data.json]

```json
{
  "featured": true
}
```

> JSON response

```json
{
    "type": "Feature",
    "properties": {
        "uuid": "750cbd99-a9b1-4d2f-a271-ba8866296cf6",
        "name": "660 Terry Rd",
        "google_place_id": "ChIJm7QDm0Y36IkRbbD20K2fC24",
        "featured": true,
    },
    ...
}
```

## Updating/Editing Activities of a Place
```shell
curl
  -X PUT
  -H "Content-Type: application/json"
  -H 'Authorization: Bearer XXXXXX'
  -d "@data.json"
  https://sportplaces.api.decathlon.com/api/v1/places/:place_id/activities/:activity_id
```

> JSON request [@data.json]

```json
{
  "tags": ["free"],
  "photo_reference": "1235ygfrt6547u4trgew23rfv[ew455",
  "difficulty": 2,
  "distance": 1
}
```
This endpoint updates activities of a particular place

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/places/:place_id/activities/:activity_id`

### Request Parameters

All activity parameters are accepted, with exception of `sport_id` and `user`
which are immutable.

> Errors

Errors will be responded to with specific error information, and an `HTTP 422` status code.


## Removing places
```shell
curl
  -X DELETE
  -H "Content-Type: application/json"
  -H 'Authorization: Bearer XXXXXX'
  https://sportplaces.api.decathlon.com/api/v1/places/:place_id
```
This endpoint deletes places that were added by the current authenticated user.

* Users cannot remove places that weren't created by them.

> JSON response

```json
{
  message: "Deleted"
}
```

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/pending`

### Request Parameters

This GET request accepts no parameters.

> Errors

Errors will be responded to with specific error information, and an `HTTP 422` status code.

## Places pending moderation
```shell
curl
  -X GET
  -H "Content-Type: application/json"
  -H 'Authorization: Bearer XXXXXX'
  https://sportplaces.api.decathlon.com/api/v1/places/pending
```
This endpoint lists places that were added by the user ID'ed by the JWT token and are pending moderation.

> JSON response

```json
{
    "type": "Feature",
    "properties": {
        "uuid": "fe56287f-a1ac-4b71-abe8-845bff595fce",
        "name": "Park Street",
        "proximity": null,
        "user": {
            "identifier": "31391277-4202-4d97-88ad-31caad2f9be4",
            "first_name": "Caio",
            "last_name": "Bianchi",
            "staff": true
        },
        "partner": null,
        "created_at": "2018-10-04 20:29:33 UTC",
        "google_place_id": "ChIJU2s2Gz6uEmsRIuwzjuh3Qa0",
        "contact_details": {
            "email": null,
            "phone": null,
            "website": null,
            "booking_url": null,
            "facebook_username": null
        },
        "address_components": {
            "address": "Park Street",
            "city": "Sydney",
            "province": "New South Wales",
            "country": "AU"
        },
        "activities": [
            {
                "sport_id": 175,
                "tags": [
                    "free"
                ],
                "photo_reference": null,
                "user": {
                    "identifier": "31391277-4202-4d97-88ad-31caad2f9be4",
                    "first_name": "Caio",
                    "last_name": "Bianchi",
                    "staff": true
                },
                "attributes": {
                    "difficulty": 2,
                    "distance": 10
                },
                "image": {}
            }
        ],
        "notes": "Lorem Ipsum Dodfdflor Amet Sit"
    },
    "geometry": {
        "type": "Point",
        "coordinates": [
            151.2099083,
            -33.8732855
        ]
    }
}
```

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/pending`

### Request Parameters

This GET request accepts no parameters.

> Errors

Errors will be responded to with specific error information, and an `HTTP 422` status code.
