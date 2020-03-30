import { Auth } from '../auth/auth'
import { Get, Post } from '../requests'
import { AnalysisStatus } from './scanner.structs'

export class Scanner {
  static getLatestAnalysisStatus({ projectId, teamId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
    })

    return Get(getLatestAnalysisStatusEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        AnalysisStatus(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static analyzeProject({ projectId, teamId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
    })

    return Post(analyzeProjectEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => data)
      .catch(error => {
        throw error
      })
  }
}

const getLatestAnalysisStatusEndpoint = 'v1/scanner/getLatestAnalysisStatus'
const analyzeProjectEndpoint = 'v1/scanner/analyzeProject'
