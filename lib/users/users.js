import { Auth } from '../auth/auth'
import { Get, Put } from '../requests'
import * as Structs from './users.structs'

export class Users {
  static getSelf() {
    return Get(usersGetSelfEndpoint, undefined, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.User(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static updateUser({ id, email, username, password }) {
    const body = {
      someid: id,
    }

    if (email && email !== '') {
      body.email = email
    }

    if (username && username !== '') {
      body.username = username
    }

    if (password && password !== '') {
      body.password = password
    }

    return Put(usersUpdateUserEndpoint, undefined, Auth.appendHeaders(), body)
      .then(({ data }) => {
        Structs.User(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const usersGetSelfEndpoint = '/v1/users/getSelf'
const usersUpdateUserEndpoint = '/v1/users/updateUser'
