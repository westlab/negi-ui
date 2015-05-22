angular.module 'dashboardApp'
  .service 'negiService', () ->
    this.browsings = [
      {
        id: 1,
        srcIP: '10.24.1.1',
        dstIP: '10.24.1.3',
        title: 'foo',
        url: 'http://west.sd.keio.ac.jp',
        browsingTime: 10
      },
      {
        id: 2,
        srcIP: '10.24.1.1',
        dstIP: '10.24.1.3',
        title: 'bar',
        url: 'http://west.sd.keio.ac.jp',
        browsingTime: 10
      },
      {
        id: 3,
        srcIP: '10.24.1.1',
        dstIP: '10.24.1.3',
        title: 'baz',
        url: 'http://west.sd.keio.ac.jp',
        browsingTime: 20
      },
      {
        id: 4,
        srcIP: '10.24.1.1',
        dstIP: '10.24.1.3',
        title: 'foo',
        url: 'http://west.sd.keio.ac.jp',
        browsingTime: 40
      }
    ]

    this.domainRanking = [
      {
        url: 'https://www.google.com',
        count: 15170
      },
      {
        url: 'https://github.com',
        count: 8070
      }
    ]

    @
