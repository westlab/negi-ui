angular.module 'dashboardApp'
  .service 'negiService', () ->
    this.browsings = [
      {id: 1, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'kuma', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 2, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'buta', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 3, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'penguin', url: 'http://west.sd.keio.ac.jp', browsingTime: 10},
      {id: 4, srcIP: '10.24.1.1', dstIP: '10.24.1.3', title: 'karasu', url: 'http://west.sd.keio.ac.jp', browsingTime: 10}
    ]
