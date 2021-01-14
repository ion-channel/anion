import { Auth } from '../auth/auth'
import { Get, Post, Delete } from '../requests'
import * as Structs from './ruleset.structs'

export class Rulesets {
  static getAppliedRuleSet({ projectId, teamId, analysisId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
      analysis_id: analysisId,
    })
    return Get(getAppliedRuleSetEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.AppliedRulesetSummary(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getAppliedRuleSetForPublicProject({ projectId, analysisId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      analysis_id: analysisId,
    })
    return Get(
      getAppliedRuleSetForPublicProjectEndpoint,
      params,
      Auth.appendHeaders(),
    )
      .then(({ data }) => {
        Structs.AppliedRulesetSummary(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getProjectHistory({ projectId, from, to }) {
    const params = new URLSearchParams({ project_id: projectId })

    if (from && to) {
      params.append('from', from)
      params.append('to', to)
    }

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

  static getPublicRuleset({ id }) {
    const params = new URLSearchParams({ id })
    return Get(getPublicRulesetEndpoint, params, Auth.appendHeaders()).then(
      ({ data }) => {
        return data
      },
    )
  }

  static getRulesets({ teamId }) {
    const params = new URLSearchParams({ team_id: teamId })
    return Get(getRulesetsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.RuleSets(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getRules() {
    return Get(getRulesEndpoint, undefined, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Rules(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static createRuleset({ teamId, name, description, ruleIds }) {
    const body = {
      team_id: teamId,
      rule_ids: ruleIds,
      name,
      description,
    }
    // console.log('create ruleset', { createRulesetEndpoint, body })
    return Post(createRulesetEndpoint, undefined, Auth.appendHeaders(), body)
  }

  static deleteRuleset({ rulesetId, teamId }) {
    const params = new URLSearchParams({
      ruleset_id: rulesetId,
      team_id: teamId,
    })

    return Delete(deleteRulesetEndpoint, params, Auth.appendHeaders())
  }
}

const getAppliedRuleSetEndpoint = '/v1/ruleset/getAppliedRulesetForProject'
const getAppliedRuleSetForPublicProjectEndpoint =
  '/v1/ruleset/getAppliedRulesetForPublicProject'
const getProjectHistoryEndpoint = '/v1/ruleset/getProjectHistory'
const getRulesetEndpoint = '/v1/ruleset/getRuleset'
const getRulesetsEndpoint = '/v1/ruleset/getRulesets'
const getRulesEndpoint = '/v1/ruleset/getRules'
const createRulesetEndpoint = '/v1/ruleset/createRuleset'
const getPublicRulesetEndpoint = '/v1/ruleset/getPublicRuleset'
const deleteRulesetEndpoint = '/v1/ruleset/deleteRuleset'
