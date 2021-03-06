import { Auth } from '../auth/auth'
import { Get, Put, Post } from '../requests'
import * as Structs from './projects.structs'

export class Projects {
  static createProject({ body, checkAccess = false }) {
    const params = checkAccess
      ? new URLSearchParams({
          chk_access: true,
        })
      : undefined

    return Post(createProjectEndpoint, params, Auth.appendHeaders(), body)
      .then(res => {
        Structs.Project(res.data.data)
        return res.data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getProject({ id, teamId }) {
    const params = new URLSearchParams({ id })

    if (teamId) {
      params.append('team_id', teamId)
    }

    return Get(getProjectEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Project(data.data)
        return { project: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getPublicProject({ id }) {
    const params = new URLSearchParams({ id })

    return Get(getPublicProjectEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Project(data.data)
        return { project: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getProjects({ teamId }) {
    const params = new URLSearchParams({
      team_id: teamId,
    })

    return Get(getProjectsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Projects(data)
        return { projects: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static updateProject({ project, checkAccess = false }) {
    const params = new URLSearchParams({
      chk_access: checkAccess,
    })

    return Put(
      updateProjectEndpoint,
      params,
      Auth.appendHeaders(),
      project,
    ).then(({ data }) => data.data)
  }

  static updateRulesetForProjects({ rulesetId, projectIds }) {
    return Put(
      updateRulesetForProjectsEndpoint,
      undefined,
      Auth.appendHeaders(),
      { ruleset_id: rulesetId, project_ids: projectIds },
    )
  }

  static updateProjects({ projectIds, ...fields }) {
    const params = new URLSearchParams({})

    for (const [field, value] of Object.entries(fields)) {
      params.append(field, value)
    }

    return Put(updateProjectsEndpoint, params, Auth.appendHeaders(), {
      project_ids: projectIds,
    })
  }
}

const root = `/v1/project/`
const createProjectEndpoint = `${root}createProject`
const getProjectEndpoint = `${root}getProject`
const getPublicProjectEndpoint = `${root}getPublicProject`
const getProjectsEndpoint = `${root}getProjects`
const updateProjectEndpoint = `${root}updateProject`
const updateProjectsEndpoint = `${root}updateProjects`
const updateRulesetForProjectsEndpoint = `${root}updateRulesetForProjects`
