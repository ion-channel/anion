# Tokens

- types
  - `Token`
    - jti: string, optional
    - sub: string, optional
    - iat: number, optional
    - exp: number, optional
    - name: number, optional
    - cli: boolean
- methods

  - `createToken`

    - description: create a new token for a user
    - parameter: object
      - name
        - type: string
        - description: the name of the token
      - cli
        - type: boolean
        - description: default value is true
    - returns: Promise
      - data: string
      - example: [test file](./tokens.test.js#L76)
    - example: `Tokens.createToken({ name: 'awesometoken' })`

  - `getTokens`

    - description: fetch all the tokens that a user has created
    - parameter: object
      - cli
        - type: boolean
        - description: default value is true
    - returns: Promise
      - data: array of `Token`
      - example: [test file](./tokens.test.js#L59)
    - example: `Tokens.getTokens({ cli: true })`

  - `deleteToken`

    - description: deletes a token that a user had created
    - parameter: object
      - id
        - type: string
        - description: the id of the token that you want to delete
    - returns: Promise
      - data: null
    - example: `Tokens.deleteToken({id: 'abc'})`

  - `refreshToken`

    - description: refresh the authentication token
    - parameters: none
    - returns: Promise
