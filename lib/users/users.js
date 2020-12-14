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

  static completeSignup({ username, password, passwordConfirmation, token }) {
    const body = {}

    if (username !== '') {
      body.username = username
    }

    if (password !== '') {
      body.password = password
    }

    if (passwordConfirmation !== '') {
      body.password_confirmation = passwordConfirmation
    }

    const headers = {
      authorization: `bearer ${token}`,
    }

    return Post(usersCompleteUserEndpoint, undefined, headers, body)
  }

  static updateUser({ id, email, username, password, token }) {
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

    const headers = token
      ? {
          authorization: `bearer ${token}`,
        }
      : Auth.appendHeaders()

    return Put(usersUpdateUserEndpoint, undefined, headers, body)
      .then(({ data }) => {
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

  static signupAws({
    customer,
    teamName,
    email,
    name,
    username,
    password,
    passwordConfirmation,
  }) {
    const body = {
      customer,
      name,
      team_name: teamName,
      username,
      email,
      password,
      password_confirmation: passwordConfirmation,
    }
    return Post(usersSignupAwsEndpoint, undefined, Auth.appendHeaders(), body)
  }
}

const usersGetSelfEndpoint = '/v1/users/getSelf'
const usersGetUsersEndpoint = '/v1/users/getUsers'
const usersResetPasswordEndpoint = '/v1/users/resetPassword'
const usersUpdateUserEndpoint = '/v1/users/updateUser'
const usersCompleteUserEndpoint = '/v1/users/complete'
const usersSignupAwsEndpoint = '/v1/users/signupAws'
