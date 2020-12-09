import { Auth } from '../auth/auth'
import { Get } from '../requests'

export class Usage {
  static info({ teamId }) {
    const params = new URLSearchParams({ team_id: teamId })
    return Get(infoEndpoint, params, Auth.appendHeaders())
  }
}

const infoEndpoint = '/v1/usage/info'
