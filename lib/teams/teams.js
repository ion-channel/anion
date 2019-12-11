import { Auth } from '../auth/auth'
import { Get, Put } from '../requests'
import * as Structs from './teams.structs'

export class Teams {
  static getTeam ({ id }) {
    const params = new URLSearchParams({
      id: id,
    })

    return Get(getTeamEndpoint, params, Auth.appendHeaders())
      .then(response => {
        Structs.Team(response.data.data)
        return { team: response.data.data, meta: response.data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getTeams () {
    return Get(getTeamsEndpoint, undefined, Auth.appendHeaders())
      .then(response => {
        Structs.Teams(response.data)
        return { teams: response.data.data, meta: response.data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getTeamUsers ({ teamId }) {
    const params = new URLSearchParams({
      team_id: teamId,
    })

    return Get(getTeamUsersEndpoint, params, Auth.appendHeaders())
      .then(response => {
        Structs.TeamUsers(response.data)
        return response.data.data
      })
      .catch(error => {
        throw error
      })
  }

  static acceptInvite ({ id, token }) {
    const headers = {
      authorization: token,
    }

    const body = {
      someid: id,
    }

    return Put(acceptTeamInviteEndpoint, undefined, headers, body)
      .then(response => {
        return response.data
      })
      .catch(error => {
        throw error
      })
  }
}

const getTeamEndpoint = '/v1/teams/getTeam'
const getTeamsEndpoint = '/v1/teams/getTeams'
const getTeamUsersEndpoint = '/v1/teamUsers/getTeamUsers'
const acceptTeamInviteEndpoint = '/v1/teamUsers/acceptInvite'
