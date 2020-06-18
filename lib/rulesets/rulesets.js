import { Auth } from '../auth/auth'
import { Get } from '../requests'

export class Rulesets {
  static getProjectHistory({ id }) {
    const params = new URLSearchParams({ id })
    return Get(
      getProjectHistoryEndpoint,
      params,
      Auth.appendHeaders(),
    ).then(({ data }) => ({ data }))
  }
}

const getProjectHistoryEndpoint = '/v1/ruleset/getProjectHistory'
