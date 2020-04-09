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

  static getVulnerabilities(
    product,
    version,
    pagination = { offset: 0, limit: 10 },
  ) {
    const params = new URLSearchParams({
      product: product,
      ...pagination,
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

  static getProduct({ externalId }) {
    const params = new URLSearchParams({
      external_id: externalId,
    })

    return Get(getProductEndpoint, params, undefined)
      .then(({ data }) => {
        Structs.Products(data.data)
        return data.data.length > 0 ? data.data[0] : {}
      })
      .catch(error => {
        throw error
      })
  }
}

const getVulnerabilityEndpoint = '/v1/vulnerability/getVulnerability'
const getVulnerabilitiesEndpoint = '/v1/vulnerability/getVulnerabilities'
const getProductEndpoint = '/v1/vulnerability/getProducts'
