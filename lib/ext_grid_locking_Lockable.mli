(** Lockable is a private mixin which injects lockable ...
  
  {% <p>Lockable is a private mixin which injects lockable behavior into any
TablePanel subclass such as GridPanel or TreePanel. TablePanel will
automatically inject the <a href="#!/api/Ext.grid.locking.Lockable" rel="Ext.grid.locking.Lockable" class="docClass">Ext.grid.locking.Lockable</a> mixin in when one of the
these conditions are met:</p>

<ul>
<li>The TablePanel has the lockable configuration set to true</li>
<li>One of the columns in the TablePanel has locked set to true/false</li>
</ul>


<p>Each TablePanel subclass must register an alias. It should have an array
of configurations to copy to the 2 separate tablepanel's that will be generated
to note what configurations should be copied. These are named normalCfgCopy and
lockedCfgCopy respectively.</p>

<p>Columns which are locked must specify a fixed width. They do NOT support a
flex width.</p>

<p>Configurations which are specified in this class will be available on any grid or
tree which is using the lockable functionality.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method syncRowHeights : unit Js.meth
  (** {% <p>Synchronizes the row heights between the locked and non locked portion of the grid for each
row. If one row is smaller than the other, the height will be increased to match the larger one.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method lockedGridConfig : _ Js.t Js.prop
  (** {% <p>Any special configuration options for the locked part of the grid</p> %}
    *)
  method lockedViewConfig : _ Js.t Js.prop
  (** {% <p>A view configuration to be applied to the
locked side of the grid. Any conflicting configurations between lockedViewConfig
and viewConfig will be overwritten by the lockedViewConfig.</p> %}
    *)
  method normalGridConfig : _ Js.t Js.prop
  (** {% <p>Any special configuration options for the normal part of the grid</p> %}
    *)
  method normalViewConfig : _ Js.t Js.prop
  (** {% <p>A view configuration to be applied to the
normal/unlocked side of the grid. Any conflicting configurations between normalViewConfig
and viewConfig will be overwritten by the normalViewConfig.</p> %}
    *)
  method scrollDelta : Js.number Js.t Js.prop
  (** {% <p>Number of pixels to scroll when scrolling the locked section with mousewheel.</p> %}
    
    Defaults to: [40]
    *)
  method subGridXType : Js.js_string Js.t Js.prop
  (** {% <p>The xtype of the subgrid to specify. If this is
not specified lockable will determine the subgrid xtype to create by the
following rule. Use the superclasses xtype if the superclass is NOT
tablepanel, otherwise use the xtype itself.</p> %}
    *)
  method syncRowHeight : bool Js.t Js.prop
  (** {% <p>Synchronize rowHeight between the normal and
locked grid view. This is turned on by default. If your grid is guaranteed
to have rows of all the same height, you should set this to false to
optimize performance.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  method filterchange : (Ext_data_Store.t Js.t ->
    Ext_util_Filter.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired whenever the filter set changes.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store.</p> %}
    }
    {- filters: [Ext_util_Filter.t Js.js_array Js.t]
    {% <p>The array of Filter objects.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method lockcolumn : (_ Js.t -> Ext_grid_column_Column.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a column is locked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_grid_Panel.t Js.t]
    {% <p>The gridpanel.</p> %}
    }
    {- column: [Ext_grid_column_Column.t Js.t]
    {% <p>The column being locked.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method processcolumns : (Ext_grid_column_Column.t Js.js_array Js.t ->
    Ext_grid_column_Column.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the configured (or <strong>reconfigured</strong>) column set is split into two depending on the <a href="#!/api/Ext.grid.column.Column-cfg-locked" rel="Ext.grid.column.Column-cfg-locked" class="docClass">locked</a> flag.</p> %}
    
    {b Parameters}:
    {ul {- lockedColumns: [Ext_grid_column_Column.t Js.js_array Js.t]
    {% <p>The locked columns.</p> %}
    }
    {- normalColumns: [Ext_grid_column_Column.t Js.js_array Js.t]
    {% <p>The normal columns.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method unlockcolumn : (_ Js.t -> Ext_grid_column_Column.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a column is unlocked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_grid_Panel.t Js.t]
    {% <p>The gridpanel.</p> %}
    }
    {- column: [Ext_grid_column_Column.t Js.t]
    {% <p>The column being unlocked.</p> %}
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

