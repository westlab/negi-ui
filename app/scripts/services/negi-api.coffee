'use strict'

dashboardApp = angular.module 'dashboardApp'

dashboardApp.provider 'negiAPI', () ->
  resources = {}
  resourceConfigs = {}
  config =
    basePath: 'http://sor2.westlab:24242/api/v1'
    # basePath: 'http://localhost:24001/v1'

  @setBasePath = (basePath)->
    config.basePath = basePath

  # add new resource
  @resource = (resourceName, url, paramDefaults, actions, options) =>
    resourceConfigs[resourceName] = [url, paramDefaults, actions, options]
    @

  @$get = ['$resource', '$rootScope', ($resource, $rootScope)->
    @resource = (resourceName)->
      if (resources[resourceName])
        return resources[resourceName]

      options = resourceConfigs[resourceName]
      if(!options)
        return null

      # update url to add base path
      options[0] = config.basePath + options[0]
      console.log options
      angular.forEach(options[2], (obj) ->
       if (obj.url != undefined)
          obj.url = config.basePath + obj.url
      )
      resources[resourceName] = $resource.apply(null, options)

      return resources[resourceName]
    @
  ]

  @


dashboardApp.config (negiAPIProvider)->
  negiAPIProvider
    .resource('ranking', '/rankings', null,
      domain:
        url: '/rankings/domain'
        method: 'GET'
        isArray: true
        params:
          limit: 6
      srcIp:
        url: '/rankings/src_ip'
        method: 'GET'
        isArray: true
        params:
          limit: 6
    )
    .resource('http_record', '/browsings', null,
      get:
        url: '/browsings'
        method: 'GET'
        isArray: true
    )
