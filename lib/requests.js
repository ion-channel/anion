import axios from 'axios'
import { URL, URLSearchParams } from 'url'

export function Do(method, endpoint, params, headers, body) {
    let uri = new URL(global.API_BASEURL)
    uri.pathname = endpoint

    if (params instanceof URLSearchParams) {
        uri.search = params.toString()
    } else {
        let newParams = new URLSearchParams(params)
        uri.search = newParams.toString()
    }

    if (headers == undefined) {
        headers = {}
    }

    let req = {
        method: method.toLowerCase(),
        url: uri.toString(),
        headers: headers,
        data: body,
    }

    return axios.request(req)
}

export function Get(endpoint, params, headers) {
    return Do('get', endpoint, params, headers, undefined)
}

export function Post(endpoint, params, headers, body) {
    return Do('post', endpoint, params, headers, body)
}

export function Put(endpoint, params, headers, body) {
    return Do('put', endpoint, params, headers, body)
}

export function Delete(endpoint, params, headers) {
    return Do('delete', endpoint, params, headers, undefined)
}
