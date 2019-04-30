import cookies from 'js-cookie'

const COOKIE = 'jwt'

export class Auth {
  static clearToken () {
    return cookies.remove(COOKIE)
  }

  static getToken () {
    return cookies.get(COOKIE)
  }

  static setToken (token) {
    return cookies.set(COOKIE, token)
  }

  static appendHeaders (headers) {
    if (headers === undefined) {
      headers = {}
    }

    let token = cookies.get(COOKIE)

    if (token !== undefined && token !== '') {
      headers['Authorization'] = `bearer ${token}`
    }

    return headers
  }
}
