import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './ruleset.structs'

export class Rulesets {
  static getProjectHistory({ projectId }) {
    const params = new URLSearchParams({ project_id: projectId })
    return Get(getProjectHistoryEndpoint, params, Auth.appendHeaders()).then(
      ({ data }) => {
        Structs.ProjectHistory(data.data)
        return data.data
      },
    )
  }
}

const getProjectHistoryEndpoint = '/v1/ruleset/getProjectHistory'
