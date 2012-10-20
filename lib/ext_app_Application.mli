(** Represents an Ext JS 4 application, which is typic ...
  
  {% <p>Represents an Ext JS 4 application, which is typically a single page app using a <a href="#!/api/Ext.container.Viewport" rel="Ext.container.Viewport" class="docClass">Viewport</a>.
A typical <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> might look like this:</p>

<pre><code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>({
    name: 'MyApp',
    launch: function() {
        <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.container.Viewport" rel="Ext.container.Viewport" class="docClass">Ext.container.Viewport</a>', {
            items: {
                html: 'My App'
            }
        });
    }
});
</code></pre>

<p>This does several things. First it creates a global variable called 'MyApp' - all of your Application's classes (such
as its Models, Views and Controllers) will reside under this single namespace, which drastically lowers the chances
of colliding global variables.</p>

<p>When the page is ready and all of your JavaScript has loaded, your Application's <a href="#!/api/Ext.app.Application-method-launch" rel="Ext.app.Application-method-launch" class="docClass">launch</a> function is called,
at which time you can run the code that starts your app. Usually this consists of creating a Viewport, as we do in
the example above.</p>

<h1>Telling Application about the rest of the app</h1>

<p>Because an <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> represents an entire app, we should tell it about the other parts of the app - namely
the Models, Views and Controllers that are bundled with the application. Let's say we have a blog management app; we
might have Models and Controllers for Posts and Comments, and Views for listing, adding and editing Posts and Comments.
Here's how we'd tell our Application about all these things:</p>

<pre><code><a href="#!/api/Ext-method-application" rel="Ext-method-application" class="docClass">Ext.application</a>({
    name: 'Blog',
    models: ['Post', 'Comment'],
    controllers: ['Posts', 'Comments'],

    launch: function() {
        ...
    }
});
</code></pre>

<p>Note that we didn't actually list the Views directly in the Application itself. This is because Views are managed by
Controllers, so it makes sense to keep those dependencies there. The Application will load each of the specified
Controllers using the pathing conventions laid out in the <a href="#/guide/application_architecture">application architecture guide</a> - in this case
expecting the controllers to reside in app/controller/Posts.js and app/controller/Comments.js. In turn, each
Controller simply needs to list the Views it uses and they will be automatically loaded. Here's how our Posts
controller like be defined:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Posts', {
    extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',
    views: ['posts.List', 'posts.Edit'],

    //the rest of the Controller here
});
</code></pre>

<p>Because we told our Application about our Models and Controllers, and our Controllers about their Views, Ext JS will
automatically load all of our app files for us. This means we don't have to manually add script tags into our html
files whenever we add a new class, but more importantly it enables us to create a minimized build of our entire
application using the Ext JS 4 SDK Tools.</p>

<p>For more information about writing Ext JS 4 applications, please see the <a href="#/guide/application_architecture">application architecture guide</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_app_Controller.t
  
  method control : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Adds listeners to components selected via <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a>. Accepts an
object containing component paths mapped to a hash of listener functions.</p>

<p>In the following example the <code>updateUser</code> function is mapped to to the <code>click</code>
event on a button component, which is a child of the <code>useredit</code> component.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('AM.controller.Users', {
    init: function() {
        this.control({
            'useredit button[action=save]': {
                click: this.updateUser
            }
        });
    },

    updateUser: function(button) {
        console.log('clicked the Save button');
    }
});
</code></pre>

<p>See <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> for more information on component selectors.</p> %}
    
    {b Parameters}:
    {ul {- selectors: [_ Js.t]
    {% <p>If a String, the second argument is used as the
listeners, otherwise an object of selectors -> listeners is assumed</p> %}
    }
    {- listeners: [_ Js.t]
    }
    }
    *)
  method getController_app : Js.js_string Js.t -> Ext_app_Controller.t Js.t
    Js.meth
  (** {% <p>Returns instance of a <a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">controller</a> with the given name.
When controller doesn't exist yet, it's created.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_app_Controller.t Js.t]
    {% <p>a controller instance.</p> %}
    }
    }
    *)
  method getModel : Js.js_string Js.t -> Ext_data_Model.t Js.t Js.meth
  (** {% <p>Returns a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> class with the given name.
A shorthand for using <a href="#!/api/Ext.ModelManager-method-getModel" rel="Ext.ModelManager-method-getModel" class="docClass">Ext.ModelManager.getModel</a>.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t] {% <p>a model class.</p> %}
    }
    }
    *)
  method getStore : Js.js_string Js.t -> Ext_data_Store.t Js.t Js.meth
  (** {% <p>Returns instance of a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> with the given name.
When store doesn't exist yet, it's created.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Store.t Js.t] {% <p>a store instance.</p> %}
    }
    }
    *)
  method getView : Js.js_string Js.t -> #Ext_Base.t Js.t Js.meth
  (** {% <p>Returns a View class with the given name.  To create an instance of the view,
you can use it like it's used by Application to create the Viewport:</p>

<pre><code>this.getView('Viewport').create();
</code></pre> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Base.t Js.t] {% <p>a view class.</p> %}
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
  inherit Ext_Base.configs
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
  method autoCreateViewport : bool Js.t Js.prop
  (** {% <p>True to automatically load and instantiate AppName.view.Viewport before firing the launch function.</p> %}
    
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
  inherit Ext_Base.events
  inherit Ext_app_Controller.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_app_Controller.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

