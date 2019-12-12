import { Auth } from '../auth/auth'
import { Get } from '../requests'
import * as Structs from './users.structs'

export class Users {
  static getSelf () {
    return Get(usersGetSelfEndpoint, undefined, Auth.appendHeaders())
      .then(response => {
        Structs.User(response.data.data)
        return response.data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const usersGetSelfEndpoint = '/v1/users/getSelf'
