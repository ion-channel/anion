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

    const token = this.getToken()

    if (token !== undefined && token !== '') {
      headers['Authorization'] = `bearer ${token}`
    }

    return headers
  }
}
