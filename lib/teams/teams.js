import { Auth } from '../auth/auth'
import { Get, Put, Post, Delete } from '../requests'
import * as Structs from './teams.structs'

export class Teams {
  static getTeam({ id }) {
    const params = new URLSearchParams({
      id: id,
    })

    return Get(getTeamEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Team(data.data)
        return { team: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getTeams() {
    return Get(getTeamsEndpoint, undefined, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Teams(data)
        return { teams: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getTeamUsers({ teamId }) {
    const params = new URLSearchParams({
      team_id: teamId,
    })

    return Get(getTeamUsersEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.TeamUsers(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static acceptInvite({ id, token }) {
    const headers = {
      authorization: token,
    }

    const body = {
      someid: id,
    }

    return Put(acceptTeamInviteEndpoint, undefined, headers, body)
      .then(({ data }) => data)
      .catch(error => {
        throw error
      })
  }

  static getInvite({ id, token }) {
    const headers = {
      authorization: token,
    }

    const params = {
      someid: id,
    }

    return Get(getTeamInviteEndpoint, params, headers)
      .then(({ data }) => data)
      .catch(error => {
        throw error
      })
  }

  static inviteTeamUser({ teamId, userId, email, role }) {
    const body = {
      team_id: teamId,
      role,
    }

    if (userId) {
      body.user_id = userId
    } else if (email) {
      body.email = email
    }

    return Post(inviteTeamUserEndpoint, undefined, Auth.appendHeaders(), body)
      .then(({ data }) => data.data)
      .catch(error => {
        throw error
      })
  }

  static resendInvite({ id }) {
    const body = {
      someid: id,
    }

    return Put(
      resendInviteTeamUserEndpoint,
      undefined,
      Auth.appendHeaders(),
      body,
    )
      .then(({ data }) => data.data)
      .catch(error => {
        throw error
      })
  }

  static deleteTeamUser({ id }) {
    const body = {
      someid: id,
    }

    return Delete(deleteTeamUserEndpoint, undefined, Auth.appendHeaders(), body)
      .then(({ data }) => data.data)
      .catch(error => {
        throw error
      })
  }

  static updateTeam({ id, name, pocName, pocEmail }) {
    const body = {
      someid: id,
      name,
      poc_name: pocName,
      poc_email: pocEmail,
    }

    return Put(updateTeamEndpoint, undefined, Auth.appendHeaders(), body)
      .then(({ data }) => {
        Structs.Team(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static updateTeamUser({ someid, role, status }) {
    return Put(updateTeamUserEndpoint, undefined, Auth.appendHeaders(), {
      someid,
      role: role.toLowerCase(),
      status,
    })
      .then(({ data }) => {
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static createTeam({ name, pocName, email, username }) {
    const body = {
      name,
      poc_name: pocName,
      poc_email: email,
      email: email,
      username,
    }

    return Post(createTeamEndpoint, undefined, Auth.appendHeaders(), body)
      .then(({ data }) => {
        Structs.Team(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const getTeamEndpoint = '/v1/teams/getTeam'
const getTeamsEndpoint = '/v1/teams/getTeams'
const updateTeamEndpoint = '/v1/teams/updateTeam'
const createTeamEndpoint = '/v1/teams/establishTeam'

const acceptTeamInviteEndpoint = '/v1/teamUsers/acceptInvite'
const deleteTeamUserEndpoint = '/v1/teamUsers/deleteTeamUser'
const getTeamInviteEndpoint = '/v1/teamUsers/getInvite'
const getTeamUsersEndpoint = '/v1/teamUsers/getTeamUsers'
const inviteTeamUserEndpoint = '/v1/teamUsers/inviteTeamUser'
const resendInviteTeamUserEndpoint = '/v1/teamUsers/resendInvite'
const updateTeamUserEndpoint = `/v1/teamUsers/updateTeamUser`
