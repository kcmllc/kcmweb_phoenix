var kcmweb = angular.module('kcmweb', ["ngRoute"])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/', {
      controller: 'IndexCtrl'
    });
    $routeProvider.otherwise({
      redirectTo: '/'
    });
  }])
  .factory("Socket", function($q, $rootScope, $log) {
    underlyingSocket = new Phoenix.Socket("/ws");
    return {
      join: function(channel, topic, callback) {
          underlyingSocket.join(channel, topic, {}, function(chan) {
            return $rootScope.$apply(callback(chan));
          });
      },
      on: function(chan, eventName, callback) {
        chan.on(eventName, function(message) {
        return $rootScope.$apply(callback(message));
      });
      },
      send: function(chan, eventName, payload) {
        return chan.send(eventName, payload);
      },
      leave: function(chan, requestor, message) {
        var chanKey;
        chanKey = "" + chan.channel + ":" + chan.topic;
        listenersByChannel[chanKey] = listenersByChannel[chanKey].filter(function(r) {
          return r !== requestor;
        });
        if (listenersByChannel[chanKey].length === 0) {
          delete listenersByChannel[chanKey];
          delete connectedChannels[chanKey];
          return chan.leave(message);
        }
      }
    };
  })
  .controller('IndexCtrl', function($rootScope, $scope, $http, Socket) {
    Socket.join("room", "lobby", function(chan){
      chan.on('watchlists', function(tickers){

        $scope.tickers = tickers.watchlists;
        $scope.$apply();
      });
      $scope.getWatchlists = function(){
        chan.send('get:watchlists', {});
      };
    });
  });
