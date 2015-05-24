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
        name: 'https://www.google.com',
        count: 15170
      },
      {
        name: 'https://github.com',
        count: 8070
      }
      {
        name: 'http://www.nba.com',
        count: 5000
      }
      {
        name: 'https://www.youtube.com',
        count: 4000
      }
      {
        name: 'https://www.facebook.com/',
        count: 2000
      }
    ]

    this.srcIpRanking = [
      {
        name: '10.24.1.1',
        count: 15170
      },
      {
        name: '10.24.1.2',
        count: 8070
      }
      {
        name: '10.24.1.3',
        count: 5000
      }
      {
        name: '10.24.1.4',
        count: 4000
      }
      {
        name: '10.24.1.5',
        count: 2000
      }
    ]
    @
