div '.reveal', ->
  div '.state-background', ''
  div '.slides', ->
    section -> h1 'AngularJS'
    section -> 
      h1 'What is AngularJS?'
      p '''
      AngularJS is a Javascript MV* framework that uses the dom and dependency injection to 
      reduce boilierplate javascript and to create highly maintainable and rich client side
      applications.
      '''
    section -> 
      h1 'Why AngularJS?'
      p '''
      HTML is great for declaring static documents, but it falters when we try to use it for
      declaring dynamic views in web-applications.  AngularJS lets you extend HTML vocabulary
      for your application. The resulting environment is extraordinarily expressive, readable,
      and quick to develop.
      '''
      p '-- http://angularjs.org'
      
    section -> 
      h1 'Alternatives'
      p '''
      Other frameworks deal with HTML’s shortcomings by either abstracting away HTML, CSS, and/or 
      JavaScript or by providing an imperative way for manipulating the DOM. Neither of these address 
      the root problem that HTML was not designed for dynamic views.
      '''
    section ->
      h1 'Extensibility'
      p '''
      AngularJS is a toolset for building the framework most suited to your application development. 
      It is fully extensible and works well with other libraries. Every feature can be modified or 
      replaced to suit your unique development workflow and feature needs. Read on to find out how.
      '''
    section ->
      h1 'Demo'
      demo1 = escape '''
      <!doctype html>
      <html ng-app>
        <head>
          <script src="http://code.angularjs.org/angular-1.0.1.min.js"></script>
        </head>
        <body>
          <div>
            <label>Name:</label>
            <input type="text" ng-model="yourName" placeholder="Enter a name here">
            <hr>
            <h1>Hello {{yourName}}!</h1>
          </div>
        </body>
      </html>
      '''
      pre -> code demo1
    section ->
      h1 'ng-app'
      ngapp = escape '<html ng-app>...</html>'
      pre -> code ngapp
      p '''
      Tells Angular to be active on this part of the page, in this case the whole document.
      '''
    section ->
      h1 'ng-model'
      ngmodel = escape '<input type="text" ng-model="yourName" placeholder="Enter a name here">'
      pre -> code ngmodel
      p '''
      This links the form input element to the model, any changes that occur to the value of the 
      input element will automatically link to the model `yourname`.
      '''
    section ->
      h1 '{{yourname}}'
      yourname = escape '<h1>Hello {{yourName}}!</h1>'
      pre -> code yourname
      p '''
      The {{ }} is a declarative way of specifying data binding locations in the html.
      AngularJS will automatically update this text whenever they `yourName` property changes.
      '''
    section ->
      text '''
      <script src="http://code.angularjs.org/angular-1.0.1.min.js"></script>
      <div ng-app>
        <label>Name:</label>
        <input type="text" ng-model="yourName" placeholder="Enter a name here">
        <hr>
        <h1>Hello {{yourName}}!</h1>
      </div>
      '''
    section ->
      h1 'Did you notice!'
      h3 'No Javascript!'
    section ->
      h1 'Take another Look'
      demo1 = escape '''
      <!doctype html>
      <html ng-app>
        <head>
          <script src="http://code.angularjs.org/angular-1.0.1.min.js"></script>
        </head>
        <body>
          <div>
            <label>Name:</label>
            <input type="text" ng-model="yourName" placeholder="Enter a name here">
            <hr>
            <h1>Hello {{yourName}}!</h1>
          </div>
        </body>
      </html>
      '''
      pre -> code demo1
    section ->
      h1 'Adding Some Control'
      ul ->
        li 'Data Binding'
        li 'Controller'
        li 'Plain Javascript'
    section -> 
      h1 'Data Binding'
      p '''
      Data-binding is an automatic way of updating the view whenever the model changes, 
      as well as updating the model whenever the view changes. This is awesome because 
      it eliminates DOM manipulation from the list of things you have to worry about.
      '''
    section ->
      h1 'Controller'
      p '''
      Controllers are the behavior behind the DOM elements. AngularJS lets you express 
      the behavior in a clean readable form without usual boilerplate of updating the DOM, 
      registering callbacks or watching model changes.
      '''
    section ->
      h1 'Plain JavaScript'
      p '''
      Unlike other frameworks, there is no need to inherit from proprietary types; to wrap 
      the model in accessors methods. Just plain old JavaScript here. This makes your code 
      easy to test, maintain, reuse, and again free from boilerplate.
      '''
    section ->
      h1 'DEMO'
      demo2 = escape '''
      <h2>Todo</h2>
      <div ng-controller="TodoCtrl">
        <span>{{remaining()}} of {{todos.length}} remaining</span>
        [ <a href="" ng-click="archive()">archive</a> ]
        <ul class="unstyled">
          <li ng-repeat="todo in todos">
            <input type="checkbox" ng-model="todo.done">
            <span class="done-{{todo.done}}">{{todo.text}}</span>
          </li>
        </ul>
        <form ng-submit="addTodo()">
          <input type="text" ng-model="todoText"  size="30"
                 placeholder="add new todo here">
          <input class="btn-primary" type="submit" value="add">
        </form>
      </div>
      '''
      pre -> code demo2
    section ->
      h1 'DEMO'
      demo2a = escape '''
      function TodoCtrl($scope) {
        $scope.todos = [
          {text:'learn angular', done:true},
          {text:'build an angular app', done:false}];

        $scope.addTodo = function() {
          $scope.todos.push({text:$scope.todoText, done:false});
          $scope.todoText = '';
        };

        $scope.remaining = function() {
          var count = 0;
          angular.forEach($scope.todos, function(todo) {
            count += todo.done ? 0 : 1;
          });
          return count;
        };
        ...
      }      
      '''
      pre -> code demo2a
    section ->
      h1 'DEMO'
      demo2a = escape '''
      function TodoCtrl($scope) {
        ...
        $scope.archive = function() {
          var oldTodos = $scope.todos;
          $scope.todos = [];
          angular.forEach(oldTodos, function(todo) {
            if (!todo.done) $scope.todos.push(todo);
          });
        };
      }      
      '''
      pre -> code demo2a
      
    section ->
      h1 'Wire up a Backend'
      ul ->
        li 'Deep Linking'
        li 'Form Validation'
        li 'Server Communication'

    section ->
      h1 'Deep Linking'
      p '''
      A deep link reflects where the user is in the app, this is useful so users can 
      bookmark and email links to locations within apps. Round trip apps get this 
      automatically, but AJAX apps by their nature do not. AngularJS combines the 
      benefits of deep link with desktop app-like behavior.
      '''
    section ->
      h1 'Form Validation'
      p '''
      Client-side form validation is an important part of great user experience. 
      AngularJS lets you declare the validation rules of the form without having to 
      write JavaScript code. Write less code, go have beer sooner.
      '''

    section ->
      h1 'Form Validation'
      p '''
      AngularJS provides services on top of XHR, that dramatically simplify your code. 
      We wrap XHR to give you exception management and promises. Promises further 
      simplify your code by handling asynchronous return of data. This lets you assign 
      properties synchronously when the return is actually asynchronous.
      '''

    section ->
      h1 'Create Components'
      ul ->
        li 'Directives'
        li 'Reusable Components'
        li 'Localization'

    section ->
      h1 'Directives'
      p '''
      Directives is a unique and powerful feature available only in Angular. Directives let 
      you invent new HTML syntax, specific to your application.
      '''
    section -> 
      h1 'Reusable Components'
      p '''
      We use directives to create reusable components. A component allows you to hide complex 
      DOM structure, CSS, and behavior. This lets you focus either on what the application does 
      or how the application looks separately.
      '''
    section ->
      h1 'Localization'
      p '''
      An important part of serious apps is localization. Angular's local aware filters and 
      stemming directives give you building blocks to make your application available in all 
      locales.
      '''
    section ->
      h1 'Embed and Inject'
      ul ->
        li 'Embeddable'
        li 'Injectable'
        li 'Testable'
    section ->
      h1 'Embeddable'
      p '''
      AngularJS works great with other technologies. Add as much or as little of AngularJS to 
      an existing page as you like. Many other frameworks require full commitment. This page 
      has multiple AngularJS applications embedded in it. Because AngularJS has no global state 
      multiple apps can run on a single page without the use of iframes. We encourage you to 
      view-source and look around.
      '''
    section ->
      h1 'Injectable'
      p '''
      The dependency injection in AngularJS allows you to declaratively describe how your application 
      is wired. This means that your application needs no main() method which is usually an unmaintainable 
      mess. Dependency injection is also a core to AngularJS. This means that any component which does not 
      fit your needs can easily be replaced.
      '''
    section ->
      h1 'Testable'
      p '''
      AngularJS was designed from ground up to be testable. It encourages behavior-view separation, comes 
      pre-bundled with mocks, and takes full advantage of dependency injection. It also comes with end-to-end 
      scenario runner which eliminates test flakiness by understanding the inner workings of AngularJS.
      '''

  aside '.controls', ->
    a '.left', href: '#', '&#x25C4;'
    a '.right', href: '#', '&#x25BA;'
    a '.up', href: '#', '&#x25B2;'
    a '.down', href: '#', '&#x25BC;'
  comment 'Presentation progress bar'
  div '.progress', ->
    span()