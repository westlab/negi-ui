'use strict'

angular.module 'dashboardApp'
.factory 'westLabService', ()->
  description = {
    about: 'Service-oriented Routerを使い、Interopの会場のネットワークを' +
    'DPIを使いリアルタイム解析しています。解析することにより、誰がどのwebページを' +
    'どのくらい閲覧しているわかります。これによりネットワークから' +
    'トレンド予測を行う事ができます。 慶應義塾大学 西研究室'
  }

  description
