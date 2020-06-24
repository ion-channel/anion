import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './ruleset.structs'

export class Rulesets {
  static getAppliedRuleSet({ projectId, teamId, analysisId }) {
    const params = new URLSearchParams({ project_id: projectId, team_id: teamId, analysis_id: analysisId })
    return Get(getAppliedRuleSetEndpoint, params, Auth.appendHeaders())
      .then(
        ({ data }) => {
          Structs.AppliedRulesetSummary(data.data)
          return data.data
        },
      ).catch(error => {
        throw error
      })
  }

  static getProjectHistory({ projectId }) {
    const params = new URLSearchParams({ project_id: projectId })
    return Get(getProjectHistoryEndpoint, params, Auth.appendHeaders()).then(
      ({ data }) => {
        return data
      },
    )
  }

  static getRuleset({ id, teamId }) {
    const params = new URLSearchParams({ id: id, team_id: teamId })
    return Get(getRulesetEndpoint, params, Auth.appendHeaders()).then(
      ({ data }) => {
        return data
      },
    )
  }
}

const getAppliedRuleSetEndpoint = '/v1/ruleset/getAppliedRulesetForProject'
const getProjectHistoryEndpoint = '/v1/ruleset/getProjectHistory'
const getRulesetEndpoint = '/v1/ruleset/getRuleset'
