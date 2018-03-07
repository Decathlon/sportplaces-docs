---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://decathlon.com'>Powered by Decathlon</a>

includes:
  - api/places
  - api/sports
  - api/activities
  - errors


search: true
---

# Introduction

Welcome to the Sport-Places API! You can use our API to access Sport-Places API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, and Python! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```ruby
require 'sportplaces'

api = Sport-Places::APIClient.authorize!('xxxxxxxxxxxx')
```

```python
import sportplaces

api = sportplaces.authorize('xxxxxxxxxxxx')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: xxxxxxxxxxxx"
```

```javascript
const sportplaces = require('sportplaces');

let api = sportplaces.authorize('xxxxxxxxxxxx');
```

> Make sure to replace `xxxxxxxxxxxx` with your API key.

Sport-Places uses API keys to allow access to the API. You can register a new Sport-Places API key at our [developer portal](http://example.com/developers).

Sport-Places expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: xxxxxxxxxxxx`

<aside class="notice">
You must replace <code>xxxxxxxxxxxx</code> with your personal API key.
</aside>


