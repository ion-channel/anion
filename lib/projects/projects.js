import { Auth } from '../auth/auth'
import { Get, Put, Post } from '../requests'
import * as Structs from './projects.structs'

export class Projects {
  static createProject(body) {
    return Post(createProjectEndpoint, undefined, Auth.appendHeaders(), body)
      .then(res => {
        Structs.Project(res.data.data)
        return res.data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getProject({ id, teamId }) {
    const params = new URLSearchParams({
      id: id,
      team_id: teamId,
    })

    return Get(getProjectEndpoint, params, Auth.appendHeaders())
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

  static updateProject({ project }) {
    try {
      Structs.UpdateProject(project)
    } catch (error) {
      throw new Error(`failed to update project: ${error}`)
    }

    return Put(updateProjectEndpoint, undefined, Auth.appendHeaders(), project)
      .then(({ data }) => {
        Structs.Project(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const createProjectEndpoint = '/v1/project/createProject'
const getProjectEndpoint = 'v1/project/getProject'
const getProjectsEndpoint = 'v1/project/getProjects'
const updateProjectEndpoint = 'v1/project/updateProject'
