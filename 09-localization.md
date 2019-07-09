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
