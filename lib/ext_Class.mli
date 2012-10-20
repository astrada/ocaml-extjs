(** Handles class creation throughout the framework. T ...
  
  {% <p>Handles class creation throughout the framework. This is a low level factory that is used by <a href="#!/api/Ext.ClassManager" rel="Ext.ClassManager" class="docClass">Ext.ClassManager</a> and generally
should not be used directly. If you choose to use <a href="#!/api/Ext.Class" rel="Ext.Class" class="docClass">Ext.Class</a> you will lose out on the namespace, aliasing and depency loading
features made available by <a href="#!/api/Ext.ClassManager" rel="Ext.ClassManager" class="docClass">Ext.ClassManager</a>. The only time you would use <a href="#!/api/Ext.Class" rel="Ext.Class" class="docClass">Ext.Class</a> directly is to create an anonymous class.</p>

<p>If you wish to create a class you should use <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a> which aliases
<a href="#!/api/Ext.ClassManager-method-create" rel="Ext.ClassManager-method-create" class="docClass">Ext.ClassManager.create</a> to enable namespacing and dynamic dependency resolution.</p>

<p><a href="#!/api/Ext.Class" rel="Ext.Class" class="docClass">Ext.Class</a> is the factory and <strong>not</strong> the superclass of everything. For the base class that <strong>all</strong> Ext classes inherit
from, see <a href="#!/api/Ext.Base" rel="Ext.Base" class="docClass">Ext.Base</a>.</p> %}
  *)

class type t =
object('self)
  
  
end

class type configs =
object('self)
  
  method alias : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>List of short aliases for class names.  Most useful for defining xtypes for widgets:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.CoolPanel', {
    extend: '<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>',
    alias: ['widget.coolpanel'],
    title: 'Yeah!'
});

// Using <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>
<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('widget.coolpanel');

// Using the shorthand for defining widgets by xtype
<a href="#!/api/Ext-method-widget" rel="Ext-method-widget" class="docClass">Ext.widget</a>('panel', {
    items: [
        {xtype: 'coolpanel', html: 'Foo'},
        {xtype: 'coolpanel', html: 'Bar'}
    ]
});
</code></pre>

<p>Besides "widget" for xtype there are alias namespaces like "feature" for ftype and "plugin" for ptype.</p> %}
    *)
  method alternateClassName : _ Js.t Js.prop
  (** {% <p>Defines alternate names for this class.  For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Developer', {
    alternateClassName: ['Coder', 'Hacker'],
    code: function(msg) {
        alert('Typing... ' + msg);
    }
});

var joe = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('Developer');
joe.code('stackoverflow');

var rms = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('Hacker');
rms.code('hack hack');
</code></pre> %}
    *)
  method config : _ Js.t Js.prop
  (** {% <p>List of configuration options with their default values, for which automatically
accessor methods are generated.  For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('SmartPhone', {
     config: {
         hasTouchScreen: false,
         operatingSystem: 'Other',
         price: 500
     },
     constructor: function(cfg) {
         this.initConfig(cfg);
     }
});

var iPhone = new SmartPhone({
     hasTouchScreen: true,
     operatingSystem: 'iOS'
});

iPhone.getPrice(); // 500;
iPhone.getOperatingSystem(); // 'iOS'
iPhone.getHasTouchScreen(); // true;
</code></pre> %}
    *)
  method extend : Js.js_string Js.t Js.prop
  (** {% <p>The parent class that this class extends. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Person', {
    say: function(text) { alert(text); }
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Developer', {
    extend: 'Person',
    say: function(text) { this.callParent(["print "+text]); }
});
</code></pre> %}
    *)
  method inheritableStatics : _ Js.t Js.prop
  (** {% <p>List of inheritable static methods for this class.
Otherwise just like <a href="#!/api/Ext.Class-cfg-statics" rel="Ext.Class-cfg-statics" class="docClass">statics</a> but subclasses inherit these methods.</p> %}
    *)
  method mixins : _ Js.t Js.prop
  (** {% <p>List of classes to mix into this class. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('CanSing', {
     sing: function() {
         alert("I'm on the highway to hell...")
     }
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Musician', {
     mixins: ['CanSing']
})
</code></pre>

<p>In this case the Musician class will get a <code>sing</code> method from CanSing mixin.</p>

<p>But what if the Musician already has a <code>sing</code> method? Or you want to mix
in two classes, both of which define <code>sing</code>?  In such a cases it's good
to define mixins as an object, where you assign a name to each mixin:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Musician', {
     mixins: {
         canSing: 'CanSing'
     },

     sing: function() {
         // delegate singing operation to mixin
         this.mixins.canSing.sing.call(this);
     }
})
</code></pre>

<p>In this case the <code>sing</code> method of Musician will overwrite the
mixed in <code>sing</code> method. But you can access the original mixed in method
through special <code>mixins</code> property.</p> %}
    *)
  method requires : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>List of classes that have to be loaded before instantiating this class.
For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Mother', {
    requires: ['Child'],
    giveBirth: function() {
        // we can be sure that child class is available.
        return new Child();
    }
});
</code></pre> %}
    *)
  method singleton : bool Js.t Js.prop
  (** {% <p>When set to true, the class will be instantiated as singleton.  For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Logger', {
    singleton: true,
    log: function(msg) {
        console.log(msg);
    }
});

Logger.log('Hello');
</code></pre> %}
    *)
  method statics : _ Js.t Js.prop
  (** {% <p>List of static methods for this class. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Computer', {
     statics: {
         factory: function(brand) {
             // 'this' in static methods refer to the class itself
             return new this(brand);
         }
     },

     constructor: function() { ... }
});

var dellComputer = Computer.factory('Dell');
</code></pre> %}
    *)
  method uses : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>List of optional classes to load together with this class. These aren't neccessarily loaded before
this class is created, but are guaranteed to be available before <a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a> listeners are
invoked. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Mother', {
    uses: ['Child'],
    giveBirth: function() {
        // This code might, or might not work:
        // return new Child();

        // Instead use <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>() to load the class at the spot if not loaded already:
        return <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('Child');
    }
});
</code></pre> %}
    *)
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

