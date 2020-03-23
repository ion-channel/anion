import { Auth } from '../auth/auth'
import { Get, Put, Post } from '../requests'
import * as Structs from './users.structs'

export class Users {
  static getSelf(token) {
    const headers = token
      ? {
          authorization: `bearer ${token}`,
        }
      : Auth.appendHeaders()

    return Get(usersGetSelfEndpoint, undefined, headers)
      .then(({ data }) => {
        Structs.User(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static resetPassword({ email }) {
    const body = {
      email,
    }

    return Post(usersResetPasswordEndpoint, undefined, undefined, body)
      .then(({ data }) => data)
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

  static getUsers() {
    return Get(usersGetUsersEndpoint, undefined, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Users(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const usersGetSelfEndpoint = '/v1/users/getSelf'
const usersGetUsersEndpoint = '/v1/users/getUsers'
const usersResetPasswordEndpoint = '/v1/users/resetPassword'
const usersUpdateUserEndpoint = '/v1/users/updateUser'
