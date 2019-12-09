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
      .catch(error => {
        throw error
      })
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
      .catch(error => {
        throw error
      })
  }

  static getProjects ({ teamId }) {
    const params = new URLSearchParams({
      team_id: teamId,
    })

    return Get(getProjectsEndpoint, params, Auth.appendHeaders())
      .then(resp => {
        Structs.ProjectsReport(resp.data)
        return { projects: resp.data.data, meta: resp.data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getPortfolio ({ teamId }) {
    const params = new URLSearchParams({
      id: teamId,
    })

    return Get(getPortfolioEndpoint, params, Auth.appendHeaders())
      .then(resp => {
        Structs.PortfolioReport(resp.data.data)
        return resp.data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getVulnerabilityList ({ teamId, listType = null }) {
    const params = new URLSearchParams({
      id: teamId,
    })

    if (listType) {
      params.append('list_type', listType)
    }

    return Get(getVulnerabilityListEndpoint, params, Auth.appendHeaders())
      .then(resp => {
        Structs.VulnerabilityListReport(resp.data.data)
        return resp.data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const getAnalysisEndpoint = '/v1/report/getAnalysis'
const getProjectEndpoint = '/v1/report/getProject'
const getProjectsEndpoint = '/v1/report/getProjects'
const getPortfolioEndpoint = '/v1/report/getPortfolio'
const getVulnerabilityListEndpoint = '/v1/report/getVulnerabilityList'