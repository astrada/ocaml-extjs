(** This class provides an abstract grid editing plugi ...
  
  {% <p>This class provides an abstract grid editing plugin on selected <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">columns</a>.
The editable columns are specified by providing an <a href="#!/api/Ext.grid.column.Column-cfg-editor" rel="Ext.grid.column.Column-cfg-editor" class="docClass">editor</a>
in the <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column configuration</a>.</p>

<p><strong>Note:</strong> This class should not be used directly. See <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">Ext.grid.plugin.CellEditing</a> and
<a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">Ext.grid.plugin.RowEditing</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_AbstractPlugin.t
  inherit Ext_util_Observable.t
  
  method editing : bool Js.t Js.prop
  (** {% <p>Set to <code>true</code> while the editing plugin is active and an Editor is visible.</p> %}
    *)
  method cancelEdit : unit Js.meth
  (** {% <p>Cancels any active edit that is in progress.</p> %}
    *)
  method completeEdit : unit Js.meth
  (** {% <p>Completes the edit if there is an active edit in progress.</p> %}
    *)
  method startEdit : _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Starts editing the specified record, using the specified Column definition to define which field is being edited.</p> %}
    
    {b Parameters}:
    {ul {- record: [_ Js.t]
    {% <p>The Store data record which backs the row to be edited, or index of the record in Store.</p> %}
    }
    {- columnHeader: [_ Js.t]
    {% <p>The Column object defining the column to be edited, or index of the column.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_AbstractPlugin.configs
  inherit Ext_util_Observable.configs
  
  method clicksToEdit : Js.number Js.t Js.prop
  (** {% <p>The number of clicks on a grid required to display the editor.
The only accepted values are <strong>1</strong> and <strong>2</strong>.</p> %}
    
    Defaults to: [2]
    *)
  method triggerEvent : Js.js_string Js.t Js.prop
  (** {% <p>The event which triggers editing. Supercedes the <a href="#!/api/Ext.grid.plugin.Editing-cfg-clicksToEdit" rel="Ext.grid.plugin.Editing-cfg-clicksToEdit" class="docClass">clicksToEdit</a> configuration. Maybe one of:</p>

<ul>
<li>cellclick</li>
<li>celldblclick</li>
<li>cellfocus</li>
<li>rowfocus</li>
</ul> %}
    *)
  
end

class type events =
object
  inherit Ext_AbstractPlugin.events
  inherit Ext_util_Observable.events
  
  method beforeedit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before editing is triggered. Return false from event handler to stop the editing.</p> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- context: [_ Js.t]
    {% <p>The editing context with the following properties:</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method canceledit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the user started editing but then cancelled the edit.</p> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- context: [_ Js.t]
    {% <p>The editing context with the following properties:</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method edit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after a editing. Usage example:</p>

<pre><code>grid.on('edit', function(editor, e) \{
    // commit the changes right after editing finished
    e.record.commit();
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- context: [_ Js.t]
    {% <p>The editing context with the following properties:</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method validateedit : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after editing, but before the value is set in the record. Return false from event handler to
cancel the change.</p>

<p>Usage example showing how to remove the red triangle (dirty record indicator) from some records (not all). By
observing the grid's validateedit event, it can be cancelled if the edit occurs on a targeted row (for example)
and then setting the field's new value in the Record directly:</p>

<pre><code>grid.on('validateedit', function(editor, e) \{
  var myTargetRow = 6;

  if (e.rowIdx == myTargetRow) \{
    e.cancel = true;
    e.record.data[e.field] = e.value;
  \}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- context: [_ Js.t]
    {% <p>The editing context with the following properties:</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_AbstractPlugin.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

