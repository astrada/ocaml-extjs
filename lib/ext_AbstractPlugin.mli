(** The AbstractPlugin class is the base class from wh ...
  
  {% <p>The AbstractPlugin class is the base class from which user-implemented plugins should inherit.</p>

<p>This class defines the essential API of plugins as used by Components by defining the following methods:</p>

<ul>
<li><p><code>init</code> : The plugin initialization method which the owning Component calls at Component initialization time.</p>

<p>The Component passes itself as the sole parameter.</p>

<p>Subclasses should set up bidirectional links between the plugin and its client Component here.</p></li>
<li><p><code>destroy</code> : The plugin cleanup method which the owning Component calls at Component destruction time.</p>

<p>Use this method to break links between the plugin and the Component and to free any allocated resources.</p></li>
<li><p><code>enable</code> : The base implementation just sets the plugin's <code>disabled</code> flag to <code>false</code></p></li>
<li><p><code>disable</code> : The base implementation just sets the plugin's <code>disabled</code> flag to <code>true</code></p></li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method destroy : unit Js.meth
  (** {% <p>The destroy method is invoked by the owning Component at the time the Component is being destroyed.</p>

<p>The supplied implementation is empty. Subclasses should perform plugin cleanup in their own implementation of
this method.</p> %}
    *)
  method disable : unit Js.meth
  (** {% <p>The base implementation just sets the plugin's <code>disabled</code> flag to <code>true</code></p>

<p>Plugin subclasses which need more complex processing may implement an overriding implementation.</p> %}
    *)
  method enable : unit Js.meth
  (** {% <p>The base implementation just sets the plugin's <code>disabled</code> flag to <code>false</code></p>

<p>Plugin subclasses which need more complex processing may implement an overriding implementation.</p> %}
    *)
  method init : _ Js.t -> unit Js.meth
  (** {% <p>The init method is invoked after initComponent method has been run for the client Component.</p>

<p>The supplied implementation is empty. Subclasses should perform plugin initialization, and set up bidirectional
links between the plugin and its client Component in their own implementation of this method.</p> %}
    
    {b Parameters}:
    {ul {- client: [#Ext_Component.t Js.t]
    {% <p>The client Component which owns this plugin.</p> %}
    }
    }
    *)
  method isPlugin : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Plugin, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method pluginId : Js.js_string Js.t Js.prop
  (** {% <p>A name for the plugin that can be set at creation time to then retrieve the plugin
through <a href="#!/api/Ext.AbstractComponent-method-getPlugin" rel="Ext.AbstractComponent-method-getPlugin" class="docClass">getPlugin</a> method.  For example:</p>

<pre><code>var grid = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', \{
    plugins: [\{
        ptype: 'cellediting',
        clicksToEdit: 2,
        pluginId: 'cellplugin'
    \}]
\});

// later on:
var plugin = grid.getPlugin('cellplugin');
</code></pre> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

