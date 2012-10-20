(** Controllers are the glue that binds an application ...
  
  {% <p>Controllers are the glue that binds an application together. All they really do is listen for events (usually from
views) and take some action. Here's how we might create a Controller to manage Users:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Users', {
    extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',

    init: function() {
        console.log('Initialized Users! This happens before the Application launch function is called');
    }
});
</code></pre>

<p>The init function is a special method that is called when your application boots. It is called before the
<a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Application</a>'s launch function is executed so gives a hook point to run any code before
your Viewport is created.</p>

<p>The init function is a great place to set up how your controller interacts with the view, and is usually used in
conjunction with another Controller function - <a href="#!/api/Ext.app.Controller-method-control" rel="Ext.app.Controller-method-control" class="docClass">control</a>. The control function
makes it easy to listen to events on your view classes and take some action with a handler function. Let's update
our Users controller to tell us when the panel is rendered:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Users', {
    extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',

    init: function() {
        this.control({
            'viewport &gt; panel': {
                render: this.onPanelRendered
            }
        });
    },

    onPanelRendered: function() {
        console.log('The panel was rendered');
    }
});
</code></pre>

<p>We've updated the init function to use this.control to set up listeners on views in our application. The control
function uses the new ComponentQuery engine to quickly and easily get references to components on the page. If you
are not familiar with ComponentQuery yet, be sure to check out the <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">documentation</a>. In brief though,
it allows us to pass a CSS-like selector that will find every matching component on the page.</p>

<p>In our init function above we supplied 'viewport > panel', which translates to "find me every Panel that is a direct
child of a Viewport". We then supplied an object that maps event names (just 'render' in this case) to handler
functions. The overall effect is that whenever any component that matches our selector fires a 'render' event, our
onPanelRendered function is called.</p>

<h2>Using refs</h2>

<p>One of the most useful parts of Controllers is the new ref system. These use the new <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> to
make it really easy to get references to Views on your page. Let's look at an example of this now:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Users', {
    extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',

    refs: [
        {
            ref: 'list',
            selector: 'grid'
        }
    ],

    init: function() {
        this.control({
            'button': {
                click: this.refreshGrid
            }
        });
    },

    refreshGrid: function() {
        this.getList().store.load();
    }
});
</code></pre>

<p>This example assumes the existence of a <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Grid</a> on the page, which contains a single button to
refresh the Grid when clicked. In our refs array, we set up a reference to the grid. There are two parts to this -
the 'selector', which is a <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector which finds any grid on the page and
assigns it to the reference 'list'.</p>

<p>By giving the reference a name, we get a number of things for free. The first is the getList function that we use in
the refreshGrid method above. This is generated automatically by the Controller based on the name of our ref, which
was capitalized and prepended with get to go from 'list' to 'getList'.</p>

<p>The way this works is that the first time getList is called by your code, the ComponentQuery selector is run and the
first component that matches the selector ('grid' in this case) will be returned. All future calls to getList will
use a cached reference to that grid. Usually it is advised to use a specific ComponentQuery selector that will only
match a single View in your application (in the case above our selector will match any grid on the page).</p>

<p>Bringing it all together, our init function is called when the application boots, at which time we call this.control
to listen to any click on a <a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">button</a> and call our refreshGrid function (again, this will
match any button on the page so we advise a more specific selector than just 'button', but have left it this way for
simplicity). When the button is clicked we use out getList function to refresh the grid.</p>

<p>You can create any number of refs and control any number of components this way, simply adding more functions to
your Controller as you go. For an example of real-world usage of Controllers see the Feed Viewer example in the
examples/app/feed-viewer folder in the SDK download.</p>

<h2>Generated getter methods</h2>

<p>Refs aren't the only thing that generate convenient getter methods. Controllers often have to deal with Models and
Stores so the framework offers a couple of easy ways to get access to those too. Let's look at another example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.controller.Users', {
    extend: '<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>',

    models: ['User'],
    stores: ['AllUsers', 'AdminUsers'],

    init: function() {
        var User = this.getUserModel(),
            allUsers = this.getAllUsersStore();

        var ed = new User({name: 'Ed'});
        allUsers.add(ed);
    }
});
</code></pre>

<p>By specifying Models and Stores that the Controller cares about, it again dynamically loads them from the appropriate
locations (app/model/User.js, app/store/AllUsers.js and app/store/AdminUsers.js in this case) and creates getter
functions for them all. The example above will create a new User model instance and add it to the AllUsers Store.
Of course, you could do anything in this function but in this case we just did something simple to demonstrate the
functionality.</p>

<h2>Further Reading</h2>

<p>For more information about writing Ext JS 4 applications, please see the
<a href="#/guide/application_architecture">application architecture guide</a>. Also see the <a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Ext.app.Application</a> documentation.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method addRef : _ Js.t -> unit Js.meth
  (** {% <p>Registers a <a href="#!/api/Ext.app.Controller-cfg-refs" rel="Ext.app.Controller-cfg-refs" class="docClass">reference</a>.</p> %}
    
    {b Parameters}:
    {ul {- _ref: [_ Js.t]
    }
    }
    *)
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
  method getController : Js.js_string Js.t -> 'self Js.t Js.meth
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
  method hasRef : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if a <a href="#!/api/Ext.app.Controller-cfg-refs" rel="Ext.app.Controller-cfg-refs" class="docClass">reference</a> is registered.</p> %}
    
    {b Parameters}:
    {ul {- _ref: [_ Js.t]
    }
    }
    *)
  method init : _ Js.t -> unit Js.meth
  (** {% <p>A template method that is called when your application boots. It is called before the
<a href="#!/api/Ext.app.Application" rel="Ext.app.Application" class="docClass">Application</a>'s launch function is executed so gives a hook point to run any code before
your Viewport is created.</p> %}
    
    {b Parameters}:
    {ul {- application: [Ext_app_Application.t Js.t]
    }
    }
    *)
  method onLaunch : _ Js.t -> unit Js.meth
  (** {% <p>A template method like <a href="#!/api/Ext.app.Controller-method-init" rel="Ext.app.Controller-method-init" class="docClass">init</a>, but called after the viewport is created.
This is called after the <a href="#!/api/Ext.app.Application-method-launch" rel="Ext.app.Application-method-launch" class="docClass">launch</a> method of Application is executed.</p> %}
    
    {b Parameters}:
    {ul {- application: [Ext_app_Application.t Js.t]
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method init : ('self Js.t, _ Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.init] *)
  method onLaunch : ('self Js.t, _ Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onLaunch] *)
  method id : Js.js_string Js.t Js.prop
  (** {% <p>The id of this controller. You can use this id when dispatching.</p> %}
    *)
  method models : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>Array of models to require from AppName.model namespace. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    models: ['User', 'Vehicle']
});
</code></pre>

<p>This is equivalent of:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    requires: ['MyApp.model.User', 'MyApp.model.Vehicle'],
    getUserModel: function() {
        return this.getModel("User");
    },
    getVehicleModel: function() {
        return this.getModel("Vehicle");
    }
});
</code></pre> %}
    *)
  method refs : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>Array of configs to build up references to views on page. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    refs: [
        {
            ref: 'list',
            selector: 'grid'
        }
    ],
});
</code></pre>

<p>This will add method <code>getList</code> to the controller which will internally use
<a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> to reference the grid component on page.</p>

<p>The following fields can be used in ref definition:</p>

<ul>
<li><code>ref</code> - name of the reference.</li>
<li><code>selector</code> - <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">Ext.ComponentQuery</a> selector to access the component.</li>
<li><code>autoCreate</code> - True to create the component automatically if not found on page.</li>
<li><code>forceCreate</code> - Forces the creation of the component every time reference is accessed
(when <code>get&lt;REFNAME&gt;</code> is called).</li>
</ul> %}
    *)
  method stores : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>Array of stores to require from AppName.store namespace and to generate getter methods for.
For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    stores: ['Users', 'Vehicles']
});
</code></pre>

<p>This is equivalent of:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    requires: ['MyApp.store.Users', 'MyApp.store.Vehicles']
    getUsersStore: function() {
        return this.getView("Users");
    },
    getVehiclesStore: function() {
        return this.getView("Vehicles");
    }
});
</code></pre> %}
    *)
  method views : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>Array of views to require from AppName.view namespace and to generate getter methods for.
For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    views: ['List', 'Detail']
});
</code></pre>

<p>This is equivalent of:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("MyApp.controller.Foo", {
    extend: "<a href="#!/api/Ext.app.Controller" rel="Ext.app.Controller" class="docClass">Ext.app.Controller</a>",
    requires: ['MyApp.view.List', 'MyApp.view.Detail'],
    getListView: function() {
        return this.getView("List");
    },
    getDetailView: function() {
        return this.getView("Detail");
    }
});
</code></pre> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

