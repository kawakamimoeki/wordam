# Wordam

API to get random japanese words list via Wikipedia.

## Usage

### Request
```
GET https://wordam.herokuapp.com
```

|param|type|default|
|--|--|--|
|limit|number|100|

### Response

```json
{
  "words": [
    "wordA",
    "wordB",
    "..."
  ]
}
```

## Development

```
bundle
```

```
bundle exec rackup
```
