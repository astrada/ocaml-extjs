(**  ...
  
  {%  %} *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method addDocked : _ Js.t -> Js.number Js.t Js.optdef ->
    Ext_Component.t Js.js_array Js.t Js.meth
  (** {% <p>Adds docked item(s) to the container.</p> %}
    
    {b Parameters}:
    {ul {- component: [_ Js.t]
    {% <p>The Component or array of components to add. The components
must include a 'dock' parameter on each component to indicate where it should be docked
('top', 'right', 'bottom', 'left').</p> %}
    }
    {- pos: [Js.number Js.t] (optional)
    {% <p>The index at which the Component will be added</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>The added components.</p> %}
    }
    }
    *)
  method getDockedComponent : _ Js.t -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Finds a docked component by id, itemId or position. Also see <a href="#!/api/Ext.container.DockingContainer-method-getDockedItems" rel="Ext.container.DockingContainer-method-getDockedItems" class="docClass">getDockedItems</a></p> %}
    
    {b Parameters}:
    {ul {- comp: [_ Js.t]
    {% <p>The id, itemId or position of the docked component (see <a href="#!/api/Ext.panel.AbstractPanel-method-getComponent" rel="Ext.panel.AbstractPanel-method-getComponent" class="docClass">getComponent</a> for details)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The docked component (if found)</p> %}
    }
    }
    *)
  method getDockedItems : Js.js_string Js.t -> bool Js.t ->
    Ext_Component.t Js.js_array Js.t Js.meth
  (** {% <p>Retrieves an array of all currently docked Components.</p>

<p>For example to find a toolbar that has been docked at top:</p>

<pre><code>panel.getDockedItems('toolbar[dock="top"]');
</code></pre> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>A <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a> selector string to filter the returned items.</p> %}
    }
    {- beforeBody: [bool Js.t]
    {% <p>An optional flag to limit the set of items to only those
 before the body (true) or after the body (false). All components are returned by
 default.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>The array of docked components meeting the specified criteria.</p> %}
    }
    }
    *)
  method insertDocked : Js.number Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Inserts docked item(s) to the panel at the indicated position.</p> %}
    
    {b Parameters}:
    {ul {- pos: [Js.number Js.t]
    {% <p>The index at which the Component will be inserted</p> %}
    }
    {- component: [_ Js.t]
    {% <p>The Component or array of components to add. The components
must include a 'dock' paramater on each component to indicate where it should be docked ('top', 'right',
'bottom', 'left').</p> %}
    }
    }
    *)
  method onDockedAdd : #Ext_Component.t Js.t -> unit Js.meth
  (** {% <p>Invoked after a docked item is added to the Panel.</p> %}
    
    {b Parameters}:
    {ul {- component: [#Ext_Component.t Js.t]
    }
    }
    *)
  method onDockedRemove : #Ext_Component.t Js.t -> unit Js.meth
  (** {% <p>Invoked after a docked item is removed from the Panel.</p> %}
    
    {b Parameters}:
    {ul {- component: [#Ext_Component.t Js.t]
    }
    }
    *)
  method removeDocked : #Ext_Component.t Js.t -> bool Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Removes the docked item from the panel.</p> %}
    
    {b Parameters}:
    {ul {- item: [#Ext_Component.t Js.t]
    {% <p>The Component to remove.</p> %}
    }
    {- autoDestroy: [bool Js.t] (optional)
    {% <p>Destroy the component after removal.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method onDockedAdd : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onDockedAdd] *)
  method onDockedRemove : ('self Js.t, #Ext_Component.t Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onDockedRemove] *)
  method defaultDockWeights : _ Js.t Js.prop
  (** {% <p>This object holds the default weights applied to dockedItems that have no weight. These start with a
weight of 1, to allow negative weights to insert before top items and are odd numbers
so that even weights can be used to get between different dock orders.</p>

<p>To make default docking order match border layout, do this:</p>

<pre><code> Ext.panel.AbstractPanel.prototype.defaultDockWeights = \{ top: 1, bottom: 3, left: 5, right: 7 \};
</code></pre>

<p>Changing these defaults as above or individually on this object will effect all Panels.
To change the defaults on a single panel, you should replace the entire object:</p>

<pre><code> initComponent: function () \{
     // NOTE: Don't change members of defaultDockWeights since the object is shared.
     this.defaultDockWeights = \{ top: 1, bottom: 3, left: 5, right: 7 \};

     this.callParent();
 \}
</code></pre>

<p>To change only one of the default values, you do this:</p>

<pre><code> initComponent: function () \{
     // NOTE: Don't change members of defaultDockWeights since the object is shared.
     this.defaultDockWeights = <a href="#!/api/Ext-method-applyIf" rel="Ext-method-applyIf" class="docClass">Ext.applyIf</a>(\{ top: 10 \}, this.defaultDockWeights);

     this.callParent();
 \}
</code></pre> %}
    
    Defaults to: [\{top: \{render: 1, visual: 1\}, left: \{render: 3, visual: 5\}, right: \{render: 5, visual: 7\}, bottom: \{render: 7, visual: 3\}\}]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  method dockedadd : (_ Js.t -> #Ext_Component.t Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> is added or inserted as a docked item.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_panel_Panel.t Js.t]
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The component being added</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index at which the component will be added docked items collection</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method dockedremove : (_ Js.t -> #Ext_Component.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> is removed from the docked items.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_panel_Panel.t Js.t]
    }
    {- component: [#Ext_Component.t Js.t]
    {% <p>The component being removed</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

