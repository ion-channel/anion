import { Auth } from '../auth/auth'
import { Get } from '../requests'

export class Searches {
  static search (query) {
    const params = new URLSearchParams({
      q: query,
    })

    return Get(searchEndpoint, params, Auth.appendHeaders())
      .then(response => {
        return response.data.data
      })
      .catch(error => {
        return error
      })
  }
}

const searchEndpoint = '/v1/search'
