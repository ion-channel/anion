import { Auth } from '../auth/auth'
import { Get, Post } from '../requests'
import { AnalysisStatus } from './scanner.structs'

export class Scanner {
  static getAnalysisStatus({ projectId, teamId, id }) {
    const params = new URLSearchParams({
      project_id: projectId,
      team_id: teamId,
      id,
    })

    return Get(getAnalysisStatusEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        AnalysisStatus(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getPublicAnalysisStatus({ projectId, id }) {
    const params = new URLSearchParams({
      project_id: projectId,
      id,
    })

    return Get(getPublicAnalysisStatusEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        AnalysisStatus(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

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
    const body = {
      project_id: projectId,
      team_id: teamId,
    }

    return Post(analyzeProjectEndpoint, undefined, Auth.appendHeaders(), body)
      .then(({ data }) => data)
      .catch(error => {
        throw error
      })
  }
}

const getAnalysisStatusEndpoint = 'v1/scanner/getAnalysisStatus'
const getPublicAnalysisStatusEndpoint = 'v1/scanner/getPublicAnalysisStatus'
const getLatestAnalysisStatusEndpoint = 'v1/scanner/getLatestAnalysisStatus'
const analyzeProjectEndpoint = 'v1/scanner/analyzeProject'
