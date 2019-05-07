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
[GeoJSON Format (RFC 7946)](https://tools.ietf.org/html/rfc7946)

Query parameters are also expected to be compliant with this spec, including all `POST` bodies and query string params.
Coordinates are represented in `[longitude, latitude, elevation]` groups. In query strings, these **MUST** be sent as
comma (`,`) separated strings consisting only of the `longitude` and `latitude` elements.

Example: `&origin=-73.5826985,45.5119864`

<aside class="warning">
  GeoJSON specification has the longitude and latitude components of locations reversed compared to most other
  geographical data formats. If you're getting strange API results, or your query is resulting in a 422 error, it is
  likely that you've got the order wrong.
</aside>
