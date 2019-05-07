<hr class="hr-section-sep">
# Errors

The Sport Places API uses the following error codes:

Error Code | Meaning
---------- | -------
400        | Bad Request -- Your request is invalid - check the JSON format of your request.
401        | Unauthorized -- Your token is invalid or expired.
404        | Not Found -- The specified place or activity wasn't found.
422        | Unprocessable Entity -- There was a validation error with your request.
500        | Internal Server Error -- We had a problem with our server. Try again later.
