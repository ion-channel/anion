import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './projects.structs'

export class Projects {
  static getProject({ id, teamId }) {
    const params = new URLSearchParams({
      id: id,
      team_id: teamId,
    })

    return Get(getProjectEndpoint, params, Auth.appendHeaders())
      .then(response => {
        Structs.Project(response.data.data)
        return { project: response.data.data, meta: response.data.meta }
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
      .then(response => {
        Structs.Projects(response.data)
        return { projects: response.data.data, meta: response.data.meta }
      })
      .catch(error => {
        throw error
      })
  }
}

const getProjectEndpoint = 'v1/project/getProject'
const getProjectsEndpoint = 'v1/project/getProjects'
