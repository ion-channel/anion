import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './searches.structs'

export class Searches {
  static search(query) {
    const params = new URLSearchParams({
      q: query,
    })

    return Get(searchEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Searches(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const searchEndpoint = '/v1/search'
