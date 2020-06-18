import { Auth } from '../auth/auth'
import { Get } from '../requests'

export class Rulesets {
  static getProjectHistory({ projectId }) {
    const params = new URLSearchParams({ project_id: projectId })
    return Get(getProjectHistoryEndpoint, params, Auth.appendHeaders()).then(
      ({ data }) => {
        return data
      },
    )
  }
}

const getProjectHistoryEndpoint = '/v1/ruleset/getProjectHistory'
