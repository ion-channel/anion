import { Get } from '../requests'
import * as Structs from './vulnerabilities.structs'

export class Vulnerabilities {
  static getVulnerability(externalId) {
    const params = new URLSearchParams({
      external_id: externalId,
    })

    return Get(getVulnerabilityEndpoint, params, undefined)
      .then(({ data }) => {
        Structs.Vulnerability(data.data)
        return data.data
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
      .then(({ data }) => {
        Structs.Vulnerabilities(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const getVulnerabilityEndpoint = '/v1/vulnerability/getVulnerability'
const getVulnerabilitiesEndpoint = '/v1/vulnerability/getVulnerabilities'
