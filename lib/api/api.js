import { URL, URLSearchParams } from 'url'
import axios from 'axios'

export class API {
    constructor(options) {
        this.url = ''
        this.token = ''
        this.baseURL = this.baseURL.bind(this)
        this.bearerToken = this.bearerToken.bind(this)

        this.doReq = this.doReq.bind(this)
        this.delete = this.delete.bind(this)
        this.get = this.get.bind(this)
        this.post = this.post.bind(this)
        this.put = this.put.bind(this)

        if (options) {
            if (options.baseURL) {
                this.baseURL(options.baseURL)
            }

            if (options.token) {
                this.bearerToken(options.token)
            }
        }
    }

    baseURL(url) {
        if (url) {
            this.url = url
        }

        return this.url
    }

    bearerToken(token) {
        if (token) {
            this.token = token
        }

        return this.token
    }

    doReq(method, endpoint, params, headers, body) {
        let uri = new URL(this.url)
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

        headers['Authorization'] = 'bearer ' + this.bearerToken()

        let req = {
            method: method.toLowerCase(),
            url: uri.toString(),
            headers: headers,
            data: body,
        }

        return axios.request(req)
    }

    get(endpoint, params, headers) {
        return this.doReq('get', endpoint, params, headers, undefined)
    }

    post(endpoint, params, headers, body) {
        return this.doReq('post', endpoint, params, headers, body)
    }

    put(endpoint, params, headers, body) {
        return this.doReq('put', endpoint, params, headers, body)
    }

    delete(endpoint, params, headers) {
        return this.doReq('delete', endpoint, params, headers, undefined)
    }
}
