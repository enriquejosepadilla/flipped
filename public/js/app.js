var app = angular.module('app', [
  'ui.router', 'ngRoute'
]);

app.config(['$urlRouterProvider','$stateProvider',
  function($urlRouterProvider, $stateProvider) {
    $stateProvider
        .state('home',{
          url: '/',
          templateUrl: 'templates/home.html',
          controller: 'homeCtrl'
        })
        .state('signup',{
          url: '/signup/:type',
          templateUrl: 'templates/signup.html',
          controller: 'signupCtrl'
        })
        .state('login',{
          url: '/login',
          templateUrl: 'templates/login.html',
          controller: 'loginCtrl'
        })
        .state('class',{
          url: '/class',
          templateUrl: 'templates/classes.html',
          controller: 'classCtrl'
        })
        .state('lecture',{
          url: '/lecture/:classId',
          templateUrl: 'templates/lecture_list.html',
          controller: 'lectureCtrl'
        })
        .state('lectureView',{
          url: '/lecture/:classId/:lectureId',
          templateUrl: 'templates/lecture.html',
          controller: 'lectureCtrl'
        })
        .state('stream',{
          url: '/stream/:id',
          templateUrl: 'templates/stream.html',
          controller: 'streamCtrl'
        })
        .state('forum',{
          url: '/forum/:lectureId/:questionId',
          templateUrl: 'templates/forum.html',
          controller: 'forumCtrl'
        })
        .state('lectureCreation',{
          url: '/make/:classId',
          templateUrl: 'templates/make.html',
          controller: 'makeCtrl'
        });
    $urlRouterProvider.otherwise('home');
  }]);