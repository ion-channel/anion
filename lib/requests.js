/* global API_ENDPOINT */

import axios from 'axios'

export function Do (method, endpoint, params, headers, body) {
  if (API_ENDPOINT === undefined) {
    const err = `base url for anion is undefined`
    console.error(err)
    throw err
  }

  const uri = new URL(API_ENDPOINT)
  uri.pathname = endpoint

  if (params instanceof URLSearchParams) {
    uri.search = params.toString()
  } else {
    const newParams = new URLSearchParams(params)
    uri.search = newParams.toString()
  }

  if (headers === undefined) {
    headers = {}
  }

  const req = {
    method: method.toLowerCase(),
    url: uri.toString(),
    headers: headers,
    data: body,
  }

  return axios.request(req)
}

export function Get (endpoint, params, headers) {
  return Do('get', endpoint, params, headers, undefined)
}

export function Post (endpoint, params, headers, body) {
  return Do('post', endpoint, params, headers, body)
}

export function Put (endpoint, params, headers, body) {
  return Do('put', endpoint, params, headers, body)
}

export function Delete (endpoint, params, headers) {
  return Do('delete', endpoint, params, headers, undefined)
}
