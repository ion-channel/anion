import { Auth } from '../auth/auth'
import { Get, Post } from '../requests'
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

  static getDigests({ projectId, teamId, analysisId, grouped = false }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
      id: analysisId,
      grouped,
    })

    return Get(getDigestsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Digests(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getPublicDigests({ projectId, analysisId, grouped = false }) {
    const params = new URLSearchParams({
      project_id: projectId,
      id: analysisId,
      grouped,
    })

    return Get(getPublicDigestsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Digests(data.data)
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
        // This data shape will be changing, removing the block until the new shape is solidified
        // Structs.ProjectsReport(data)
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

  static getPublicAnalysis(analysisId) {
    const params = new URLSearchParams({
      analysis_id: analysisId,
    })
    return Get(getPublicAnalysisEndpoint, params)
      .then(({ data }) => data.data)
      .catch(error => {
        throw error
      })
  }

  static getProjectHistory({ teamId, projectId, from, to }) {
    const params = new URLSearchParams({
      team_id: teamId,
      project_id: projectId,
    })

    if (from && to) {
      params.append('from', from)
      params.append('to', to)
    }

    return Get(getProjectHistoryEndpoint, params, Auth.appendHeaders()).then(
      ({ data }) => data.data,
    )
  }

  static getExportedData({ teamId, ids }) {
    return Post(
      getExportedDataEndpoint,
      undefined,
      { ...Auth.appendHeaders(), accept: 'application/json' },
      {
        team_id: teamId,
        ids,
      },
    )
  }

  static getExportedDataCSV({ teamId, ids }) {
    return Post(
      getExportedDataEndpoint,
      undefined,
      {
        ...Auth.appendHeaders(),
        accept: 'text/csv',
        'Content-Type': 'text/csv',
      },
      {
        team_id: teamId,
        ids,
      },
    )
  }

  static getExportedVulnerabilityData({ teamId, ids }) {
    return Post(
      getExportedVulnerabilityDataEndpoint,
      undefined,
      { ...Auth.appendHeaders(), accept: 'application/json' },
      {
        team_id: teamId,
        ids,
      },
    )
  }

  static getExportedVulnerabilityDataCSV({ teamId, ids }) {
    return Post(
      getExportedVulnerabilityDataEndpoint,
      undefined,
      {
        ...Auth.appendHeaders(),
        accept: 'text/csv',
        'Content-Type': 'text/csv',
      },
      {
        team_id: teamId,
        ids,
      },
    )
  }

  static getProjectsByDependency({ teamId, name, org, version }) {
    const params = new URLSearchParams({
      team_id: teamId,
      name,
      org,
      version,
    })
    return Get(getProjectsByDependencyEndpoint, params, Auth.appendHeaders())
  }

  static getSBOM(type, { teamId, ids }) {
    const params = new URLSearchParams({
      sbom_type: type,
    })

    return Post(
      getSBOMEndpoint,
      params,
      {
        ...Auth.appendHeaders(),
      },
      {
        team_id: teamId,
        ids,
      },
    )
  }
}

const root = '/v1/report/'
const getAnalysisEndpoint = `${root}getAnalysis`
const getDigestsEndpoint = `${root}getDigests`
const getProjectEndpoint = `${root}getProject`
const getProjectsEndpoint = `${root}getProjects`
const getPortfolioEndpoint = `${root}getPortfolio`
const getVulnerabilityListEndpoint = `${root}getVulnerabilityList`
const getAffectedProjectsEndpoint = `${root}getAffectedProjects`
const getPublicAnalysisEndpoint = `${root}getPublicAnalysis`
const getPublicDigestsEndpoint = `${root}getPublicDigests`
const getProjectHistoryEndpoint = `${root}getProjectHistory`
const getExportedDataEndpoint = `${root}getExportedData`
const getExportedVulnerabilityDataEndpoint = `${root}getExportedVulnerabilityData`
const getProjectsByDependencyEndpoint = `${root}getProjectsByDependency`
const getSBOMEndpoint = `${root}getSBOM`
