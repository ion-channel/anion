import { Post } from '../requests'
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
      .then(response => {
        Structs.Session(response.data.data)
        return response.data.data
      })
      .catch(error => {
        throw error
      })
  }
}

const sessionsLoginEndpoint = '/v1/sessions/login'
