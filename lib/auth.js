import cookies from 'js-cookie'

const COOKIE = 'bearer-token'

export class Auth {
    static clearToken() {
        cookies.remove(COOKIE)
    }

    static setToken(token) {
        cookies.set(COOKIE, token)
    }

    static appendHeaders(headers) {
        if (headers === undefined) {
            headers = {}
        }

        let token = cookies.get(COOKIE)

        if (token !== undefined && token != '') {
            headers['Authorization'] = `bearer ${token}`
        }

        return headers
    }
}
