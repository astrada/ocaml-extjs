(** A class that manages a group of Ext.Component.floa ...
  
  {% <p>A class that manages a group of <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">Ext.Component.floating</a> Components and provides z-order management,
and Component activation behavior, including masking below the active (topmost) Component.</p>

<p><a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">Floating</a> Components which are rendered directly into the document (such as
<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s) which are <a href="#!/api/Ext.Component-method-show" rel="Ext.Component-method-show" class="docClass">show</a>n are managed by a
<a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">global instance</a>.</p>

<p><a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">Floating</a> Components which are descendants of <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a>
<em>Containers</em> (for example a <a href="#!/api/Ext.view.BoundList" rel="Ext.view.BoundList" class="docClass">BoundList</a> within an <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>,
or a <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Menu</a>), are managed by a ZIndexManager owned by that floating Container. Therefore
ComboBox dropdowns within Windows will have managed z-indices guaranteed to be correct, relative to the Window.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method bringToFront : _ Js.t -> bool Js.t Js.meth
  (** {% <p>Brings the specified Component to the front of any other active Components in this ZIndexManager.</p> %}
    
    {b Parameters}:
    {ul {- comp: [_ Js.t]
    {% <p>The id of the Component or a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the dialog was brought to the front, else false
if it was already in front</p> %}
    }
    }
    *)
  method each : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Executes the specified function once for every Component in this ZIndexManager, passing each
Component as the only parameter. Returning false from the function will stop the iteration.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to execute for each item</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (this reference) in which the function
is executed. Defaults to the current Component in the iteration.</p> %}
    }
    }
    *)
  method eachBottomUp : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Executes the specified function once for every Component in this ZIndexManager, passing each
Component as the only parameter. Returning false from the function will stop the iteration.
The components are passed to the function starting at the bottom and proceeding to the top.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to execute for each item</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (this reference) in which the function
is executed. Defaults to the current Component in the iteration.</p> %}
    }
    }
    *)
  method eachTopDown : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Executes the specified function once for every Component in this ZIndexManager, passing each
Component as the only parameter. Returning false from the function will stop the iteration.
The components are passed to the function starting at the top and proceeding to the bottom.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The function to execute for each item</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (this reference) in which the function
is executed. Defaults to the current Component in the iteration.</p> %}
    }
    }
    *)
  method get : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Gets a registered Component by id.</p> %}
    
    {b Parameters}:
    {ul {- id: [_ Js.t]
    {% <p>The id of the Component or a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> instance</p> %}
    }
    }
    *)
  method getActive : _ Js.t Js.meth
  (** {% <p>Gets the currently-active Component in this ZIndexManager.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>The active Component</p> %}
    }
    }
    *)
  method getBy : _ Js.callback -> _ Js.t Js.optdef -> _ Js.js_array Js.t
    Js.meth
  (** {% <p>Returns zero or more Components in this ZIndexManager using the custom search function passed to this method.
The function should accept a single <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> reference as its only argument and should
return true if the Component matches the search criteria, otherwise it should return false.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback]
    {% <p>The search function</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (this reference) in which the function is executed.
Defaults to the Component being tested. That gets passed to the function if not specified.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t]
    {% <p>An array of zero or more matching windows</p> %}
    }
    }
    *)
  method hideAll : unit Js.meth
  (** {% <p>Hides all Components managed by this ZIndexManager.</p> %}
    *)
  method register : _ Js.t -> unit Js.meth
  (** {% <p>Registers a floating <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> with this ZIndexManager. This should not
need to be called under normal circumstances. Floating Components (such as Windows,
BoundLists and Menus) are automatically registered with a
<a href="#!/api/Ext.Component-property-zIndexManager" rel="Ext.Component-property-zIndexManager" class="docClass">zIndexManager</a> at render time.</p>

<p>Where this may be useful is moving Windows between two ZIndexManagers. For example,
to bring the <a href="#!/api/Ext.MessageBox" rel="Ext.MessageBox" class="docClass">Ext.MessageBox</a> dialog under the same manager as the Desktop's
ZIndexManager in the desktop sample app:</p>

<pre><code>MyDesktop.getDesktop().getManager().register(<a href="#!/api/Ext.MessageBox" rel="Ext.MessageBox" class="docClass">Ext.MessageBox</a>);
</code></pre> %}
    
    {b Parameters}:
    {ul {- comp: [#Ext_Component.t Js.t]
    {% <p>The Component to register.</p> %}
    }
    }
    *)
  method sendToBack : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Sends the specified Component to the back of other active Components in this ZIndexManager.</p> %}
    
    {b Parameters}:
    {ul {- comp: [_ Js.t]
    {% <p>The id of the Component or a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>The Component</p> %}
    }
    }
    *)
  method unregister : _ Js.t -> unit Js.meth
  (** {% <p>Unregisters a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> from this ZIndexManager. This should not
need to be called. Components are automatically unregistered upon destruction.
See <a href="#!/api/Ext.ZIndexManager-method-register" rel="Ext.ZIndexManager-method-register" class="docClass">register</a>.</p> %}
    
    {b Parameters}:
    {ul {- comp: [#Ext_Component.t Js.t]
    {% <p>The Component to unregister.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
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

