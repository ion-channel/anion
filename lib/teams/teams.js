import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './teams.structs'

export class Teams {
  static getTeam (id) {
    const params = new URLSearchParams({
      id: id,
    })

    return Get(getTeamEndpoint, params, Auth.appendHeaders())
      .then(response => {
        Structs.Team(response.data.data)
        return { team: response.data.data, meta: response.data.meta }
      })
      .catch(error => {
        return error
      })
  }

  static getTeams () {
    return Get(getTeamsEndpoint, undefined, Auth.appendHeaders())
      .then(response => {
        Structs.Teams(response.data)
        return { teams: response.data.data, meta: response.data.meta }
      })
      .catch(error => {
        return error
      })
  }
}

const getTeamEndpoint = '/v1/teams/getTeam'
const getTeamsEndpoint = '/v1/teams/getTeams'
