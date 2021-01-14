# Usage

- methods

  - `info`

    - description: get the number of analysis a team has used in the current month and the number of analysis they have purchaged for that month
    - parameter: object
      - teamId
        - type: string
        - description: the id of a team
    - returns: Promise
      - data: object
        - TotalPurchased: number
        - TotalUsed: number
      - example: `{ TotalPurchased: 100, TotalUsed: 10 }`
    - example: `Usage.info({ teamId: 'abc' })`
