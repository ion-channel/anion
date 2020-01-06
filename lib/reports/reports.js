import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './reports.structs'

export class Reports {
  static getAnalysis({ projectId, teamId, analysisId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
      analysis_id: analysisId,
    })

    return Get(getAnalysisEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.AnalysisReport(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getProject({ projectId, teamId }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
    })

    return Get(getProjectEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.ProjectReport(data.data)
        return data.data
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
        Structs.ProjectsReport(data)
        return { projects: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }

  static getPortfolio({ teamId }) {
    const params = new URLSearchParams({
      id: teamId,
    })

    return Get(getPortfolioEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.PortfolioReport(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getVulnerabilityList({ teamId, listType = null }) {
    const params = new URLSearchParams({
      id: teamId,
    })

    if (listType) {
      params.append('list_type', listType)
    }

    return Get(getVulnerabilityListEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.VulnerabilityListReport(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getAffectedProjects({ teamId, externalId }) {
    const params = new URLSearchParams({
      id: teamId,
      external_id: externalId,
    })

    return Get(getAffectedProjectsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.AffectedProjects(data)
        return data.data
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
const getAffectedProjectsEndpoint = '/v1/report/getAffectedProjects'
