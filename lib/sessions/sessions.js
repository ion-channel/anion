import { Auth } from '../auth/auth'
import { Post, Delete } from '../requests'
import * as Structs from './sessions.structs'

export class Sessions {
  static login(username, password) {
    const headers = {}
    const body = {}

    if (username !== '' && password !== '') {
      const encodedAuth = Buffer.from(`${username}:${password}`).toString(
        'base64',
      )

      headers.Authorization = `Basic ${encodedAuth}`
      headers['Content-Type'] = 'application/json; charset=UTF-8'

      body.username = username
      body.password = password
    }

    return Post(sessionsLoginEndpoint, undefined, headers, body)
      .then(({ data }) => {
        Structs.Session(data.data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static logout() {
    return Delete(sessionsLogoutEndpoint, undefined, Auth.appendHeaders())
      .then(res => res)
      .catch(error => {
        throw error
      })
  }
}

const sessionsLoginEndpoint = '/v1/sessions/login'

const sessionsLogoutEndpoint = '/v1/sessions/logout'
