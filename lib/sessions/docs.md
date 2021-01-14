# Sessions

- types
  - `Session`
    - jwt: string
    - user: object
      - chat_handle: ""
      - created_at: "2019-01-18T22:05:52.134444Z"
      - email: "mike.swain@ionchannel.io"
      - externally_managed: false
      - id: "72703033-e379-4b9b-9fb1-fb41467b80bf"
      - last_active_at: "2021-01-13T17:52:33.588393Z"
      - metadata: null
      - sys_admin: false
      - system: false
      - teams: array of objects
        - [key: string]: string
      - updated_at: string,
      - username: string
- methods

  - `login`

    - description:
    - parameters:
      - username
        - type: string
        - description: name of the user that's trying to start an authenticated session
      - password
        - type: string
        - description: the password that belongs to the user
    - returns: Promise
      - `Session`
    - example: `Sessions.login('ion', 'channel')`

  - `logout`

    - description: ends the session of a user
    - parameters: none
    - returns: null
    - example: `Sessions.logout()`
