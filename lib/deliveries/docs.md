# Deliveries

- types

  - `DeliveryDestination`: object

    - deleted_at: string, optional
    - id: string
    - location: string
    - name: string
    - region: string, can only be one of these: ap-northeast-2, ap-northeast-1, ap-northeast-3, ap-south-1, ap-southeast-1, cn-north-1, cn-northwest-1, eu-west-3, eu-central-1, sa-east-1
    - team_id: string
    - type: string, only s3 is supported

- methods:

  - `getDestinations`

    - description: returns the delivery destinations for a team
    - parameters:
      - object
        - teamId
          - type: string
          - description: the id of the team that you want the destinations from
    - returns:

      - Promise
      - array of `DeliveryDestination` - example:

      ```javascript
      const example = [
        {
          id: '47c87537-7f83-406e-8592-5a048e6425dc',
          team_id: 'someteamid',
          location: 'bucket-a',
          region: 'us-east-1',
          name: 'prod bucket',
          type: 's3',
        },
      ]
      ```

    - example: `Deliveries.getDestinations({teamId: 'a'})`

  - `createDestination`
    - description: adds a new delivery destination to you team's list of delivery destinations
    - parameters: `DeliveryDestination`
    - returns: Promise
      - the same object that was passed in as an argument with a field for id
      - example:
      ```javascript
      const example = {
        id: 'abc',
        team_id: 'a',
        location: 'path/to/aws/bucket',
        region: 'ap-northeast-2',
        name: 'my deliveries',
        type: 's3',
        access_key: 'aws bucket access key',
        secret_accces_key: 'aws secret access key for bucket',
      }
      ```
    - example:
      ```javascript
      Deliveries.createDestination({
        team_id: 'a',
        location: 'path/to/aws/bucket',
        region: 'ap-northeast-2',
        name: 'my deliveries',
        type: 's3',
        access_key: 'aws bucket access key',
        secret_accces_key: 'aws secret access key for bucket',
      })
      ```
  - `deleteDestination`
    - description: archives a delivery destination
    - parameters:
      - id
        - type: string
        - description: the id of the delivery destination that you want to delete
    - returns: Promise
      - data: object
        - data: empty string
      ```javascript
      const example = {
        data: { data: '' },
      }
      ```
    - example: `Deliveries.deleteDestionation('a')`
