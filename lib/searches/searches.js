import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './searches.structs'

export class Searches {
  static search(query, offset, limit) {
    const params = new URLSearchParams({
      q: query,
    })

    if (offset || offset === 0) {
      params.set('offset', offset)
    }

    if (limit) {
      params.set('limit', limit)
    }

    return Get(searchEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Searches(data.data)
        return { results: data.data, meta: data.meta }
      })
      .catch(error => {
        throw error
      })
  }
}

const searchEndpoint = '/v1/search'
