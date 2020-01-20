import { Auth } from '../auth/auth'
import { Get } from '../requests'
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
}

const getLatestAnalysisStatusEndpoint = 'v1/scanner/getLatestAnalysisStatus'
