(** Represents an Ext JS 4 application, which is typic ...
  
  {% <p>Represents an Ext JS 4 application, which is typically a single page app using a <a href="#!/api/Ext.container.Viewport" rel="Ext.container.Viewport" class="docClass">Viewport</a>.
A typical <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> might look like this:</p>

<pre><code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>(\{
    name: 'MyApp',
    launch: function() \{
        <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.container.Viewport" rel="Ext.container.Viewport" class="docClass">Ext.container.Viewport</a>', \{
            items: \{
                html: 'My App'
            \}
        \});
    \}
\});
</code></pre>

<p>This does several things. First it creates a global variable called 'MyApp' - all of your Application's classes (such
as its Models, Views and Controllers) will reside under this single namespace, which drastically lowers the chances
of colliding global variables. The MyApp global will also have a getApplication method to get a reference to
the current application:</p>

<pre><code>var app = MyApp.getApplication();
</code></pre>

<p>When the page is ready and all of your JavaScript has loaded, your Application's <a href="#!/api/Ext.app.Application-method-launch" rel="Ext.app.Application-method-launch" class="docClass">launch</a> function is called,
at which time you can run the code that starts your app. Usually this consists of creating a Viewport, as we do in
the example above.</p>

<h1>Telling Application about the rest of the app</h1>

<p>Because an <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> represents an entire app, we should tell it about the other parts of the app - namely
the Models, Views and Controllers that are bundled with the application. Let's say we have a blog management app; we
might have Models and Controllers for Posts and Comments, and Views for listing, adding and editing Posts and Comments.
Here's how we'd tell our Application about all these things:</p>

<pre><code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>(\{
    name: 'Blog',
    models: ['Post', 'Comment'],
    controllers: ['Posts', 'Comments'],

    launch: function() \{
        ...
    \}
\});
</code></pre>

<p>Note that we didn't actually list the Views directly in the Application itself. This is because Views are managed by
Controllers, so it makes sense to keep those dependencies there. The Application will load each of the specified
Controllers using the pathing conventions laid out in the <a href="#/guide/application_architecture">application architecture guide</a> - in this case
expecting the controllers to reside in app/controller/Posts.js and app/controller/Comments.js. In turn, each
Controller simply needs to list the Views it uses and they will be automatically loaded. Here's how our Posts
controller like be defined:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Posts', \{
    extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',
    views: ['posts.List', 'posts.Edit'],

    //the rest of the Controller here
\});
</code></pre>

<p>Because we told our Application about our Models and Controllers, and our Controllers about their Views, Ext JS will
automatically load all of our app files for us. This means we don't have to manually add script tags into our html
files whenever we add a new class, but more importantly it enables us to create a minimized build of our entire
application using Sencha Cmd.</p>

<h1>Deriving from <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a></h1>

<p>Typically, applications do not derive directly from <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a>. Rather, the
configuration passed to <code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a></code> mimics what you might do in a derived class.
In some cases, however, it can be desirable to share logic by using a derived class
from <code><a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a></code>.</p>

<p>Derivation works as you would expect, but using the derived class should still be the
job of the <code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a></code> method.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.app.Application', \{
    extend: '<a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a>',
    ...
\});

<a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>('MyApp.app.Application');
</code></pre>

<p>For more information about writing Ext JS 4 applications, please see the <a href="#/guide/application_architecture">application architecture guide</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_app_Controller.t
  
  method getApplication_app : 'self Js.t Js.meth
  (** {% <p>Returns the base <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> for this controller.</p> %}
    
    {b Returns}:
    {ul {- [Ext_app_Application.t Js.t] {% <p>the application</p> %}
    }
    }
    *)
  method getController_app : Js.js_string Js.t -> Ext_app_Controller.t Js.t
    Js.meth
  (** {% <p>Returns instance of a <a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Controller</a> with the given id.
When controller doesn't exist yet, it's created. Note that this method depends
on Application instance and will return undefined when Application is not
accessible. The only exception is when this Controller instance's id is requested;
in that case we always return the instance even if Application is no available.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_app_Controller.t Js.t]
    {% <p>controller instance or undefined.</p> %}
    }
    }
    *)
  method launch : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Called automatically when the page has completely loaded. This is an empty function that should be
overridden by each application that needs to take action on page load.</p> %}
    
    {b Parameters}:
    {ul {- profile: [Js.js_string Js.t]
    {% <p>The detected application profile</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>By default, the Application will dispatch to the configured startup controller and
action immediately after running the launch function. Return false to prevent this behavior.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_app_Controller.configs
  
  method launch : ('self Js.t, Js.js_string Js.t -> bool Js.t)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.launch] *)
  method appFolder : Js.js_string Js.t Js.prop
  (** {% <p>The path to the directory which contains all application's classes.
This path will be registered via <a href="#!/api/Ext.Loader-method-setPath" rel="Ext.Loader-method-setPath" class="docClass">Ext.Loader.setPath</a> for the namespace specified
in the <a href="#!/api/Ext.app.Application-cfg-name" rel="Ext.app.Application-cfg-name" class="docClass">name</a> config.</p> %}
    
    Defaults to: ['app']
    *)
  method appProperty : Js.js_string Js.t Js.prop
  (** {% <p>The name of a property to be assigned to the main namespace to gain a reference to
this application. Can be set to an empty value to prevent the reference from
being created</p>

<pre><code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>(\{
    name: 'MyApp',
    appProperty: 'myProp',

    launch: function() \{
        console.log(MyApp.myProp === this);
    \}
\});
</code></pre> %}
    
    Defaults to: ['app']
    *)
  method autoCreateViewport : bool Js.t Js.prop
  (** {% <p>True to automatically load and instantiate AppName.view.Viewport before firing the launch
function.</p> %}
    
    Defaults to: [false]
    *)
  method controllers : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>Names of controllers that the app uses.</p> %}
    *)
  method enableQuickTips : bool Js.t Js.prop
  (** {% <p>True to automatically set up <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">Ext.tip.QuickTip</a> support.</p> %}
    
    Defaults to: [true]
    *)
  method name : Js.js_string Js.t Js.prop
  (** {% <p>The name of your application. This will also be the namespace for your views, controllers
models and stores. Don't use spaces or special characters in the name.</p> %}
    *)
  method namespaces : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>The list of namespace prefixes used in the application to resolve dependencies
like Views and Stores:</p>

<pre><code> <a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>(\{
     name: 'MyApp',

     namespaces: ['Common.code'],

     controllers: [ 'Common.code.controller.Foo', 'Bar' ]
 \});

 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Common.code.controller.Foo', \{
     extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',

     models: ['Foo'],    // Loads Common.code.model.Foo
     views:  ['Bar']     // Loads Common.code.view.Bar
 \});

 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Bar', \{
     extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',

     models: ['Foo'],    // Loads MyApp.model.Foo
     views:  ['Bar']     // Loads MyApp.view.Bar
 \});
</code></pre>

<p>You don't need to include main namespace (MyApp), it will be added to the list
automatically.</p> %}
    
    Defaults to: []
    *)
  method paths : _ Js.t Js.prop
  (** {% <p>Additional load paths to add to <a href="#!/api/Ext.Loader" rel="Ext.Loader" class="docClass">Ext.Loader</a>.
See <a href="#!/api/Ext.Loader-cfg-paths" rel="Ext.Loader-cfg-paths" class="docClass">Ext.Loader.paths</a> config for more details.</p> %}
    *)
  method scope : _ Js.t Js.prop
  (** {% <p>The scope to execute the <a href="#!/api/Ext.app.Application-method-launch" rel="Ext.app.Application-method-launch" class="docClass">launch</a> function in. Defaults to the Application instance.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_app_Controller.events
  
  
end

class type statics =
object
  inherit Ext_app_Controller.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

