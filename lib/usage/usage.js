import { Auth } from '../auth/auth'
import { Get } from '../requests'

export class Usage {
  static info({ teamId, noOp = false }) {
    if (noOp === true) {
      // no operation flag in case usage data isn't present
      return { TotalPurchased: -2, TotalUsed: 0 }
    } else {
      const params = new URLSearchParams({ team_id: teamId })
      return Get(infoEndpoint, params, Auth.appendHeaders())
    }
  }
}

const infoEndpoint = '/v1/usage/info'
