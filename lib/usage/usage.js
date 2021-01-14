import { Auth } from '../auth/auth'
import { Get } from '../requests'

export class Usage {
  static info({ teamId, noOp = false }) {
    const params = new URLSearchParams({ team_id: teamId })
    // no operation flag in case usage data isn't present
    return noOp
      ? Promise.resolve({ TotalPurchased: -2, TotalUsed: 0 })
      : Get(infoEndpoint, params, Auth.appendHeaders())
  }
}

const infoEndpoint = '/v1/usage/info'
