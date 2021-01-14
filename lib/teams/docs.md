# Teams

- types
  - `Team`
    - id: string,
    - name: string,
    - sys_admin: boolean,
    - poc_name: string,
    - poc_email: string,
    - default_deploy_key: string, optional
    - created_at: string,
    - updated_at: string,
    - deleted_at: string, optional
  - `UsersTeam`
    - id: string,
    - name: string,
    - sys_admin: boolean
    - poc_name: string,
    - poc_email: string,
    - created_at: string,
    - updated_at: string,
    - deleted_at: string, optional,
    - role: string,
  - `TeamUser`
    - id: string,
    - name: string,
    - sys_admin: boolean,
    - poc_name: string,
    - poc_email: string,
    - created_at: string,
    - updated_at: string,
    - deleted_at: string, optional
    - role: string,
- methods

  - `getTeam`

    - description: fetch the team
    - parameters:
      - id
        - type: string
        - description: id of the team
    - returns: Promise
      - `Team`
      - example: look at line 395 in [test file](./teams/teams.test.js)
    - example: `Teams.getTeam({ id: 'cd98e4e1' })`

  - `getTeams`

    - description: fetch a list of teams that the user is an admin of
    - parameters: none
    - returns: Promise
      - data: list of `UsersTeam`
      - meta: `Meta`
      - example: look at line 362 in [test file](./teams/teams.test.js)
    - example: `Teams.getTeams()`

  - `getTeamUsers`

    - description: fetch the users that are on a team
    - parameter: object
      - teamId
        - type: string
        - description: id of the team that has some users
    - returns: Promise
      - an array of `TeamUser`
      - example: look at line 419 in [test file](./teams/teams.test.js)
    - example: `Teams.getTeamUsers({ teamId: 'someteam' })`

  - `acceptInvite`

    - description: a new user has been invited to create an account, and they should have recieved an email with a link. The token on that link will confirm their account so they can login
    - parameter: object
      - id
        - type: string
        - description: id of the user
      - token
        - type: string
        - description: the jwt token that authenticates the user
    - returns: Promise
      - data: an empty object
      - example: look at line 24 in [test file](./teams/teams.test.js)
    - example: `Teams.acceptInvite({id: 'inviteid', token: 'aninvitetoken'})`

  - `getInvite`

    - description: get the team name that the user has been invited to
    - parameter: object
      - id
        - type: string
        - description:
      - field
        - type: string
        - description:
    - returns: Promise
      - data: object
        - team_name: string
      - example: look at line 44 in [test file](./teams/teams.test.js)
    - example `Teams.getInvite({id: 'inviteid', token: 'aninvitetoken'})`

  - `inviteTeamUser`

    - description: invite an existing user to a team
    - parameter: object
      - teamId
        - type: string
        - description: id of the team the user will be invited
      - userId
        - type: string, optional
        - description: id of a user
      - email
        - type: string
        - description: email of the user
      - role
        - type: string
        - description: access rights the user will have. Should be one of 'member', 'admin', or 'sys_admin'. System admins can see all of the teams in the system. Admins only have access to the teams they are an admin of. They can see all of the members of a team, and can add or remove team members. Members can only see themselves in a team and cannot perform any actions that an administrator would be able to.
    - returns: Promise
      - data: `TeamUser`
      - example: look at line 501 in [test file](./teams/teams.test.js)
    - example: `Teams.inviteTeamUser({ teamId: 'someteam', userId: 'someuser', role: 'admin'})`

  - `resendInvite`

    - description: a user hasn't accepted an invitation, so resend them the email with a new token so they can complete registration
    - parameter: object
      - id
        - type: string
        - description: id of the user
    - returns: Promise
      - data: object
        - `TeamUser`
      - example: look at line 501 in [test file](./teams/teams.test.js)
    - example:

  - `deleteTeamUser`

    - description: removes a user from a team
    - parameters:
      - id
        - type: string
        - description: id of the user
    - returns: Promise
      - data: object
        - message: string
      - example: look at line 518 in [test file](./teams/teams.test.js)
    - example: `Teams.deleteTeamUser({ id: 'someteamuserid' })`

  - `updateTeam`

    - description: update the data on a team
    - parameters: object
      - id
        - type: string
        - description: id of the team
      - name
        - type: string
        - description: name of the team
      - pocName
        - type: string
        - description: the name of the Point of contact
      - pocEmail
        - type: string
        - description: email of the point of contact
      - defaultDeployKey
        - type: string
        - description: the default value for the deploy key
    - returns: Promise
      - data: `Team`
      - example: look at line 306 in [test file](./teams/teams.test.js)
    - example: `Teams.updateTeam({ id: 'cd98e4e1-6926-4989-8ef8-f326cd5956fc', name: 'somenewname', pocName: 'NewGuy', pocEmail: 'newguy@ionchannel.io', defaultDeployKey: 'somekey'})`

  - `updateTeamUser`

    - description: change the role or status of a user
    - parameter: object
      - id
        - type: string
        - description: id of the user to apply the changes to
      - role
        - type: string
        - description: the role of the user on the team
      - status
        - type: string
        - description: whether the user has been confirmed on the team or not
    - returns: Promise
      - data: `TeamUser`
      - meta: `Meta`
      - example: look at line 184 in [test file](./teams/teams.test.js)

  - `createTeam`
    - description: creates a new team with its first user that will be an admin
    - parameters:
      - name
        - type: string
        - description: the team's name
      - pocName
        - type: string
        - description: name of the point of contact
      - email
        - type: string
        - description: email of the point of contact
      - username
        - type: string
        - description: username of the point of contact
    - returns: Promise
      - data: the same value that was passed in as the parameter
      - meta: `Meta`
      - example: look at line 198 in [test file](./teams/teams.test.js)
    - example: `Teams.createTeam({ name: 'best team', pocName: 'NewGuy', email: 'newguy@ionchannel.io', username: 'thisguy' })`
