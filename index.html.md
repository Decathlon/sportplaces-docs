---
title: API Reference

toc_footers:
  - <a href='#'>Documentation provided by Decathlon</a>
  - <a href='https://github.com/lord/slate'>Template Powered by Slate</a>

search: true
---<span class="product-title">Sport Places API</span>

# Get started

The Sport Places API can help you build sport-related applications requiring sport places. Here are a few steps to get you started:

**1. Sign up as an API User to receive important communications (mandatory).**

To keep our API Users happy, we will want to make sure we can inform about amazing upgrades or important changes.

Sign up by filling this form: <a href="http://eepurl.com/ggGaRP" target="_blank">http://eepurl.com/ggGaRP</a>

**2. Learn how authenticate.**

To get a `client_id` and `JWT Tokens`, go to [Authentication](#authentication)

**3. Make your first API Call!**

You are ready to go! We suggest you make your first API Call calling the sport places around you. Let's start with [Sport Places](#sport-places).  

<aside class="notice">
If you want to have greater access to our API you must be part of our partners program, 
please email <a href="mailto:sportplacesapi@decathlon.com">sportplacesapi@decathlon.com</a> to learn more. 
</aside>


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


## Retrieving Place Information

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID"
```

> JSON response:

```json
{
    "type": "Feature",
    "properties": {
        "uuid": "488c45cf-2d7c-4903-9477-01249966adcf",
        "name": "Studio Bizz Mount Royal",
        "proximity": null,
        "user": {
            "identifier": "0",
            "first_name": "Decathlon",
            "last_name": "IT",
            "staff": true
        },
        "partner": null,
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

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID`

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



> JSON response

```json
{
    "type": "Feature",
    "properties": {
        "uuid": "750cbd99-a9b1-4d2f-a271-ba8866296cf6",
        "name": "660 Terry Rd",
        "google_place_id": "ChIJm7QDm0Y36IkRbbD20K2fC24",
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


# Activities

## Get a list of activities for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities"
```

> JSON response:

```json
[
    {
        "sport_id": 160,
        "tags": [],
        "difficulty": 2,
        "duration": 10,
        "distance": 10,
        "elevation_gain": 0,
        "cellphone_service": 1
    },
    {
        "sport_id": 160,
        "tags": [],
        "difficulty": 2,
        "distance": 10
    }
]
```

Retrieves a list of sporting activities at a place.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities`

## Add a new activity

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
  {
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
  }
}'
```

> JSON response:

```json
{
    ...
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
    ...
}
```

Adds a sporting activity to a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport.

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities`

## Update an activity

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities/150 \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
  {
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
  }
}'
```

> JSON response:

```json
{
    ...
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
    ...
}
```

Updates a sporting activity at a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport. The activity must already exist at the location, else a 404 will be returned.

### HTTP Request

`PUT https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities/150`

## Update multiple activities

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
    "activities": [
      {
        "sport_id": 150,
        "tags": ["free"],
        "cellphone_service": 1
      }
    ]
}'
```

> JSON response:

```json
{
    [
        ...
        "sport_id": 150,
        "tags": ["free"],
        "cellphone_service": 1
        ...
    ]
}
```

Updates multiple sporting activities at a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport. If the activities do not exist, they will be created.

### HTTP Request

`PUT https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities`

## Remove an activity from a place

```shell
curl -X DELETE \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities/150 \
  -H 'Authorization: Bearer XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a sporting activity from a place based on its sport ID.

### HTTP Request

`DELETE https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities/SPORT_ID`

## Uploading Pictures to Activities

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/v1/places/*:place_id*/activities/*:activity_id*/images \
  -H 'Authorization: Bearer XXXXXX' \
  -H 'content-type: multipart/form-data' \
  -F '=@/path/to/the/image.png'
```

> JSON response:

```json
{
  "sport_id": 175,
  "tags": ["equipment_rental"],
  "photo_reference": "CmRaAAAAN3qk1mKFY6G...",
  "user": {
    "id": 1,
    "first_name": "Decathlon",
    "last_name": "Canada",
    "staff": true
  },
  "attributes": {},
  "image": {
    "url": "/remote/path/to/the/image.png"
  }
}
```

Pictures can be uploaded to an activity of a place via a file upload form as
such.

Only files of the image type are accepted (png, jpg, jpeg, bmp)

Uploads a picture to an activity within a place, based on the place ID and the
activity ID.

### HTTP Request

`POST https://sportplaces.api.decathlon.com/v1/places/:place_id/activities/:activity_id/images`


# Activity Tags

## Get a list of tags on an activity

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities/160/tags"
```

> JSON response:

```json
[
    "free"
]
```

Retrieves a list of tags that have been applied to a sporting activity at a place

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/tags`

## Add a tag to an activity

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities/160/tags \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
	  "slug": "lessons"
  }'
```

> JSON response:

```json
[
    "free",
    "lessons"
]
```

Adds a new tag to a sporting activity at a specified place. This tag **MUST** be permitted on a sport.

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/tags`

## Remove a tag from an activity

```shell
curl -X DELETE \
  https://sportplaces.api.decathlon.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities/160/tags/lessons \
  -H 'Authorization: Bearer XXXXXX'
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific tag from a sporting activity at a location.

### HTTP Request

`DELETE https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities/SPORT_ID/tags/lessons`



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


# Sport Filters

## Get a list of allowed filters for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports/186/filters"
```

> JSON response:

```json
[
    "size",
    "quality"
]
```

Retrieves a list of allowed filter names for a particular sport. Use these when performing Place queries, or adding
activities to a place.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/filters`

## Allow a filter for a sport

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/filters \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{"slug": "difficulty"}'
```

> JSON response:

```json
[
    "size",
    "quality",
    "difficulty"
]
```

Adds a new filter to the allowed list for a specified sport. **MUST** be one of the following:

* `surface`
* `difficulty`
* `duration`
* `elevation_gain`
* `cellphone_service`
* `distance`
* `size`
* `quality`

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/filters`

## Remove a filter from a sport

```shell
curl -X DELETE \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/filters/difficulty \
  -H 'Authorization: Bearer XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific filter from the allowed list for a given sport.

### HTTP Request

`DELETE https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/filters/FILTER_SLUG`


# Sport Tags

## Get a list of allowed tags for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports/186/tags"
```

> JSON response:

```json
[
    "free",
    "outdoor",
    "lessons",
    "space_for_children"
]
```

Retrieves a list of allowed tag names for a particular sport. Use these when performing Place queries, or adding
activities to a place.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags`

## Allow a tag for a sport

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/tags \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{"slug": "grocery_store"}'
```

> JSON response:

```json
[
    "free",
    "outdoor",
    "lessons",
    "space_for_children",
    "grocery_store"
]
```

Adds a new tag to the allowed list for a specified sport. **MUST** be one of the following:

* `beach`
* `equipment_rental`
* `free`
* `grocery_store`
* `lessons`
* `outdoor`
* `club`
* `space_for_children"`

<aside class="notice">
If you want new tags that aren't part of the list, please submit them to
<a href="mailto:sportplacesapi@decathlon.com">sportplacesapi@decathlon.com</a>.

Ex: washroom_available 
</aside>

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags`

## Remove a tag from a sport

```shell
curl -X DELETE \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/tags/grocery_store \
  -H 'Authorization: Bearer XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific tag from the allowed list for a given sport.

### HTTP Request

`DELETE https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags/TAG_SLUG`



# Code Samples

- <a href="https://github.com/Decathlon/badmintoncommunity" target="_blank">Basic Javascript App displaying Badminton facilities</a>

# Featured apps

- <a href="http://community.decathlon.ca" target="_blank">Decathlon Community in Canada</a>
- <a href="https://www.appysport.com/" target="_blank">AppySport in Hong Kong</a>

# Localization

```shell
curl 
  -X PUT
  -H "Accept-Language:fr-CA"
  -H 'Authorization: Bearer XXXXXX'
  -d "@data.json" 
  "https://sportplaces.api.decathlon.com/api/v1/places/:place_id"
```
> JSON request [@data.json]

```
{
  "notes": "Lorem Ipsumeé"
}

```

Important bits of our data are localized, since it's meant to be used in
multiple countries/locales.

The way to retrieve/post data in a specific locale, such as `fr-CA` (Canadian
French), is to send the `Accept-Language` header along with your request (See
CURL request above).

Translatable columns can be localized by either making a `POST` or a `PUT`
request, the former along with other required fields to create a place, and the
latter with just the example request object on the right.

Supported locales at the moment are: `en, en-GB, fr-FR, fr-CA, pt-PT, pt-BR, es-ES, es-MX, it, de, ja, cn, pl`

* Note that default language in our application is English (`en`), any other languages require an `Accept-Language` header.

Locales follow the <a href='https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes' target="_blank"> ISO
639-1</a> convention. 

If your locale isn't listed, please <a href='mailto:sportplacesapi@decathlon.com'> get in touch</a>

At this moment the only supported column is `notes` for a place. We plan on localizing more data to cater to our users needs.


# Standards

## GeoJSON Format

```json
{
    "type": "Feature",
    "properties": {},
    "geometry": {
        "type": "Point",
        "coordinates": [
            -73.5826985,
            45.5119864
        ]
    }
}
```

Data returned by this API is designed to be compliant with the 
<a href="https://tools.ietf.org/html/rfc7946" target="_blank">GeoJSON Format (RFC 7946)</a>

Query parameters are also expected to be compliant with this spec, including all `POST` bodies and query string params.
Coordinates are represented in `[longitude, latitude, elevation]` groups. In query strings, these **MUST** be sent as
comma (`,`) separated strings consisting only of the `longitude` and `latitude` elements.

Example: `&origin=-73.5826985,45.5119864`

<aside class="warning">
  GeoJSON specification has the longitude and latitude components of locations reversed compared to most other
  geographical data formats. If you're getting strange API results, or your query is resulting in a 422 error, it is
  likely that you've got the order wrong.
</aside>

# Errors

The Sport Places API uses the following error codes:

Error Code | Meaning
---------- | -------
400        | Bad Request -- Your request is invalid - check the JSON format of your request.
401        | Unauthorized -- Your token is invalid or expired.
404        | Not Found -- The specified place or activity wasn't found.
422        | Unprocessable Entity -- There was a validation error with your request.
500        | Internal Server Error -- We had a problem with our server. Try again later.


# Sandboxes

If you're looking for places to play around with these API calls and/or just run
tests against your application, you might want to try our sandbox environments:

## Staging

URL: <a href='https://sportplaces-api-staging.herokuapp.com' target='_blank'>https://sportplaces-api-staging.herokuapp.com</a>

This environment is a replica of our production environment, with a
representative dataset and fully functional API endpoints

## Development (Bleeding-edge)

URL: <a href='https://sportplaces-develop.herokuapp.com' target='_blank'>https://sportplaces-develop.herokuapp.com</a>

This environment is NOT recommended for production. This contains the latest
additions to our API and some of them might not yet be ready for usage. Even
though most of what's here is soon to be deployed, we cannot guarantee it will
continue to work as features are still being tested/developed.

<aside class="warning">
  In case you have specific needs for a new environment, get in touch with us at
  <a href="mailto:sportplacesapi@decathlon.com">sportplacesapi@decathlon.com</a>
</aside>

# Roadmap

## Upcoming

### June 2019
  * Auto-approval of sport place additions by partners and ambassadors
  * Ability to mark a place as favorited
  * Ability to update multiple activities for one sport place in one call

### Q3 2019
  * Facilitating data imports from multiple sources
  * Javascript public widget to display sport places
  * Ability to store place slug and search by slug
  * Be able to add several activities in one shot 

### Q4 2019
  * Implement Sport Places User Reviews\
  * Multi-region deployment to improve quality of service

## Changelog

### 1.3 - Q1 2019
  * Eliminate dependency on `google_place_id` and Google Geolocation in general
  * Use AI to better tailor recommendations based on arbitrary properties.
      * Likely models will be: mood-based, weather-based, proximity, user
          behaviour etc...
  * Booking partner integrations (implemention details TBD)
    * Storage or URLs for joining events identified by partner APIs
    * Retrieval of events at locations as supplied by partner APIs

### 1.2 - December 2018
  * Add ability for users to upload their own photos and videos
  * Reorganization of attributes and more explicit data types
  * Storage of complex geometry types: lines & polygons

### 1.1 - August 2018
  * Load Google Image Reference on response
  * Standardize Sports API to better organize hierarchy

### 1.0 - April 2018
  * List all places using the GeoJSON format
  * Filter Places by Sport
  * Filter-based Search
  * Geolocation-based listing of places
  * Places crowdsourcing
  * Decathlon Connect Authentication

# Contributing

**Everyone** is encouraged to help improve this project.

We're open to feature requests, doc improvements, big ideas, suggestions and new implementations. We may reward the best contributors with sport-related stuff ;) 

### Twitter

Tweet us at <a href='https://twitter.com/decathlondev' target='_blank'>@decathlondev</a>

### Documentation improvements

Help us improve the documentation by submitting a PR on 
<a href='https://github.com/Decathlon/sportplaces-docs' target='_blank'>here</a>

# Support

For all suggestions, bug reports and feature requests please feel free to email us at [sportplacesapi@decathlon.com](sportplacesapi@decathlon.com)

