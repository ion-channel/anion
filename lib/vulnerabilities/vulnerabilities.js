import { Get } from '../requests'
import * as Structs from './vulnerabilities.structs'

export class Vulnerabilities {
  static getVulnerability(externalId) {
    const params = new URLSearchParams({
      external_id: externalId,
    })

    return Get(getVulnerabilityEndpoint, params, undefined)
      .then(response => {
        Structs.Vulnerability(response.data.data)
        return response.data.data
      })
      .catch(error => {
        throw error
      })
  }

  static getVulnerabilities(product, version) {
    const params = new URLSearchParams({
      product: product,
    })

    if (version !== undefined) {
      params.set('version', version)
    }

    return Get(getVulnerabilitiesEndpoint, params, undefined)
      .then(response => {
        Structs.Vulnerabilities(response.data.data)
        return response.data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const getVulnerabilityEndpoint = '/v1/vulnerability/getVulnerability'
const getVulnerabilitiesEndpoint = '/v1/vulnerability/getVulnerabilities'
