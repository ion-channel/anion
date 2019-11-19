import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './reports.structs'

export class Reports {
  static getAnalysis ({ projectId, teamId, analysisId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
      analysis_id: analysisId,
    })

    return Get(getAnalysisEndpoint, params, Auth.appendHeaders())
      .then(resp => {
        Structs.AnalysisReport(resp.data.data)
        return resp.data.data
      })
      .catch(error => error)
  }

  static getProject ({ projectId, teamId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
    })

    return Get(getProjectEndpoint, params, Auth.appendHeaders())
      .then(resp => {
        Structs.ProjectReport(resp.data.data)
        return resp.data.data
      })
      .catch(error => error)
  }
}

const getAnalysisEndpoint = '/v1/report/getAnalysis'
const getProjectEndpoint = '/v1/report/getProject'
