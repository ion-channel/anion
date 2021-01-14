# Vulnerabilities

- types
  - `Vulnerability`
    - id: number,
    - external_id: string,
    - title: string,
    - summary: string,
    - score: string,
    - score_version: string,
    - score_system: string,
  - `Product`
    - id: number,
    - name: string,
    - org: string,
    - version: string,
    - created_at: string,
    - updated_at: string,
    - title: string,
    - external_id: string,
- methods

  - `getVulnerability`

    - description: fetch the data around a given vulnerability
    - parameter:
      - externalId
        - type: string
        - description: the id of the vulnerability
    - returns: Promise
      - data: `Vulnerability`
      - example: look at line 128 in [test file](lib/vulnerabilities/vulnerabilities.tesjs)
    - example: `Vulnerabilities.getVulnerability('somevulnid')`

  - `getVulnerabilities`

    - description: fetch a list of known vulnerabilities that exist on the given product
    - parameters:
      - product
        - type: string
        - description: the name of the product
      - version
        - type: string
        - description: the version of the product
      - offset
        - type: number
        - description: for pagination, default value is 0, where you want to start returning records
      - limit
        - type: number
        - description: for pagination, default value is 10, how many possible records you want to get back
    - returns: Promise
      - data: an array of `Vulnerability`
      - example: look at line 159 in [test file](lib/vulnerabilities/vulnerabilities.tesjs)
    - example: `Vulnerabilities.getVulnerabilities('jdk', '1.0.0')`

  - `getProduct`

    - description: fetch the data for a product
    - parameter: object
      - externalId
        - type: string
        - description: the id of the product
    - returns: Promise
      - data: `Product`
      - example: look at line 172 in [test file](lib/vulnerabilities/vulnerabilities.tesjs)
    - example: `Vulnerabilities.getProduct({ externalId: 'ruby' })`
