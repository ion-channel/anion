# Searches

- types
- methods

  - `search`

    - description:
    - parameters:
      - query
        - type: string
        - description: the text that the search would be applied on
      - tbs
        - type: string
        - description: optional, indicates the search will query for repositories
        - example: 'repos'
      - offset
        - type: number
        - description: for pagination, the record to start returning results on, optional
      - limit
        - type: number
        - description: the number of records to return, for pagination, optional
    - returns: Promise
      - data: object
        - field
      - example: [test file](./searches.test.js#L67)
    - example: `Searches.search('ruby', 'repos', 0, 2)`
