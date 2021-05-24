# Users

- types
  - `User`
    - id: string,
    - email: string,
    - username: string,
    - chat_handle: string,
    - created_at: string,
    - updated_at: string,
    - last_active_at: string,
    - externally_managed: boolean,
    - sys_admin: boolean,
    - system: boolean,
    - teams: any,
- methods

  - `getSelf`

    - description: during an authenticated session, fetch the data for my user
    - parameters:
      - token
        - type: string
        - description: the authentication token
    - returns: Promise
      - data: object
        - field
      - example: [test file](./users.test.js#L110)
    - example: `Users.getSelf('abc')`

  - `resetPassword`

    - description: as a user that can't remember their password, and they are not in an authenticated session, this will email them with a link that will direct them to a page where they can change their password
    - parameter:
      - email
        - type: string
        - description: the email of the user that needs to reset their password
    - returns: Promise
      - data: object
        - message: string
      - example: `{message: 'Password reset created successfully'}`
    - example: `Users.resetPassword({ email: 'myemail@ionchannel.io' })`

  - `completeSignup`

    - description: a user has been invited, which means they should have gotten an email that has an authentication token. Now they need to create a password for their account, so they can create an authenticated session
    - parameter: object
      - username
        - type: string
        - description: the username that was defined when the user's account was created
      - password
        - type: string
        - description: the user's password to their account into the console
      - passwordConfirmation
        - type: string
        - description: on a website, this would be an additional input so that the server can validate that the password and this field match
      - token
        - type: string
        - description: the authentication token that would have been in the email to the invited user
    - returns: Promise
      - data: object
      - example: `{}`
    - example: `Users.completeSignup({ username: 'foo', password: 'password', passwordConfirmation: 'password', token: 'abc' })`

  - `updateUser`

    - description: change the data of a user's account
    - parameter: object
      - id
        - type: string
        - description: the id of the user
      - email
        - type: string
        - description: the email of the user that is intended to be changed, optional
      - username
        - type: string
        - description: the username of the user that is intended to be changed, optional
      - password
        - type: string
        - description: a password of a user that is intended to be changed, optional
      - token
        - type: string
        - description: the authentication token
    - returns: Promise
      - data: `User`
      - example: [test file](./users.test.js#L127)
    - example: `Users.updateUser({ id: 'myuserid', password: 'mynewpassword' })`

  - `getUsers`

    - description: fetch the users of a team, only admin and system admin users can get this data
    - parameters: none
    - returns: Promise
      - data: an array of `User`
      - example: [test file](./users.test.js#L144)
    - example: `Users.getUsers()`

  - `signupAws`

    - description: user accounts can be created in two different ways: [Request an api key](https://ionchannel.io/contact/) or they can log into their AWS console and search for ion channel in the AWS Marketplace. By subscribing to ion channel, a user would be redirected to the ion channel console to create their account
    - parameter: object
      - customer
        - type: string
        - description: the id of the aws user
      - teamName
        - type: string
        - description: the name of the team the user wants to create
      - email
        - type: string
        - description: the user's email
      - name
        - type: string
        - description: the name of the person registering
      - username
        - type: string
        - description: the username they want to define
      - password
        - type: string
        - description: the user's password to their account into the console
      - passwordConfirmation
        - type: string
        - description: on a website, this would be an additional input so that the server can validate that the password and this field match
    - returns: Promise
    - example: `Users.singupAws({customer: 'abc', teamName: 'my team', email: 'user@mail.com', name: 'John Snow', username: 'user123', passsword: 'secret', passwordConfirmation: 'secret'})`
