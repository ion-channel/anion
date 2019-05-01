import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './reports.structs'

export class Reports {
  static getAnalysisNavigation ({ analysisId, teamId, projectId }) {
    const params = new URLSearchParams({
      analysis_id: analysisId,
      team_id: teamId,
      project_id: projectId,
    })

    return Get(getAnalysisNavigationEndpoint, params, Auth.appendHeaders())
      .then(response => {
        Structs.Navigation(response.data.data)
        return { navigation: response.data.data }
      })
      .catch(error => {
        return error
      })
  }
}

const getAnalysisNavigationEndpoint = '/v1/report/getAnalysisNav'
