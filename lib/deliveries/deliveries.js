import { Auth } from '../auth/auth'
import { Get, Post, Delete } from '../requests'
import * as Structs from './deliveries.structs'

export class Deliveries {
  static getDestinations({ teamId }) {
    const params = {
      id: teamId,
    }

    return Get(getDestinationsEndpoint, params, Auth.appendHeaders())
      .then(({ data }) => {
        Structs.Destinations(data)
        return data.data
      })
      .catch(error => {
        throw error
      })
  }

  static createDestination(body) {
    /**
     * required shape of body: team_id, location, region, name, type, access_key, secret_access_key
     * type can be either s3 or grafeas
     * location is required if the type is s3
     * region can only be one of these: ap-northeast-2, ap-northeast-1, ap-northeast-3, ap-south-1, ap-southeast-1, cn-north-1, cn-northwest-1, eu-west-3, eu-central-1, sa-east-1
     */
    return Post(
      createDestinationEndpoint,
      undefined,
      Auth.appendHeaders(),
      body,
    )
  }

  static deleteDestination(id) {
    return Delete(
      deleteDestinationEndpoint,
      new URLSearchParams({ id }),
      Auth.appendHeaders(),
    )
  }
}

const getDestinationsEndpoint = '/v1/teams/getDeliveryDestinations'
const createDestinationEndpoint = '/v1/teams/createDeliveryDestination'
const deleteDestinationEndpoint = '/v1/teams/deleteDeliveryDestination'
