(** TablePanel is the basis of both TreePanel and Grid ...
  
  {% <p>TablePanel is the basis of both <a href="#!/api/Ext.tree.Panel" rel="Ext.tree.Panel" class="docClass">TreePanel</a> and <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">GridPanel</a>.</p>

<p>TablePanel aggregates:</p>

<ul>
<li>a Selection Model</li>
<li>a View</li>
<li>a Store</li>
<li>Scrollers</li>
<li><a href="#!/api/Ext.grid.header.Container" rel="Ext.grid.header.Container" class="docClass">Ext.grid.header.Container</a></li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  
  method hasView : bool Js.t Js.prop
  (** {% <p>True to indicate that a view has been injected into the panel.</p> %}
    
    Defaults to: [false]
    *)
  method optimizedColumnMove : bool Js.t Js.prop
  (** {% <p>If you are writing a grid plugin or a {<a href="#!/api/Ext.grid.feature.Feature" rel="Ext.grid.feature.Feature" class="docClass">Ext.grid.feature.Feature</a> Feature} which creates a column-based structure which
needs a view refresh when columns are moved, then set this property in the grid.</p>

<p>An example is the built in <a href="#!/api/Ext.grid.feature.AbstractSummary" rel="Ext.grid.feature.AbstractSummary" class="docClass">Summary</a> Feature. This creates summary rows, and the
summary columns must be in the same order as the data columns. This plugin sets the <code>optimizedColumnMove</code> to `false.</p> %}
    *)
  method afterCollapse : bool Js.t -> unit Js.meth
  (** {% <p>Invoked after the Panel is Collapsed.</p> %}
    
    {b Parameters}:
    {ul {- animated: [bool Js.t]
    }
    }
    *)
  method afterExpand : bool Js.t -> unit Js.meth
  (** {% <p>Invoked after the Panel is Expanded.</p> %}
    
    {b Parameters}:
    {ul {- animated: [bool Js.t]
    }
    }
    *)
  method applyState : 'a Js.t -> unit Js.meth
  (** {% <p>Applies the state to the object. This should be overridden in subclasses to do
more complex state operations. By default it applies the state properties onto
the current object.</p> %}
    
    {b Parameters}:
    {ul {- state: ['a Js.t] {% <p>The state</p> %}
    }
    }
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method getSelectionModel : #Ext_selection_Model.t Js.t Js.meth
  (** {% <p>Returns the selection model being used and creates it via the configuration if it has not been created already.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_selection_Model.t Js.t] {% <p>selModel</p> %}
    }
    }
    *)
  method getState : 'a Js.t Js.meth
  (** {% <p>The supplied default state gathering method for the AbstractComponent class.</p>

<p>This method returns dimension settings such as <code>flex</code>, <code>anchor</code>, <code>width</code> and <code>height</code> along with <code>collapsed</code>
state.</p>

<p>Subclasses which implement more complex state should call the superclass's implementation, and apply their state
to the result if this basic state is to be saved.</p>

<p>Note that Component state will only be saved if the Component has a <a href="#!/api/Ext.panel.Table-cfg-stateId" rel="Ext.panel.Table-cfg-stateId" class="docClass">stateId</a> and there as a StateProvider
configured for the document.</p> %}
    *)
  method getStore : Ext_data_Store.t Js.t Js.meth
  (** {% <p>Returns the store associated with this Panel.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Store.t Js.t] {% <p>The store</p> %}
    }
    }
    *)
  method getView : Ext_view_Table.t Js.t Js.meth
  (** {% <p>Gets the view for this panel.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  
  method afterCollapse : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterCollapse] *)
  method afterExpand : ('self Js.t, bool Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterExpand] *)
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method allowDeselect : bool Js.t Js.prop
  (** {% <p>True to allow deselecting a record. This config is forwarded to <a href="#!/api/Ext.selection.Model-cfg-allowDeselect" rel="Ext.selection.Model-cfg-allowDeselect" class="docClass">Ext.selection.Model.allowDeselect</a>.</p> %}
    
    Defaults to: [false]
    *)
  method columnLines : bool Js.t Js.prop
  (** {% <p>Adds column line styling</p> %}
    *)
  method columns : 'a Js.t Js.prop
  (** {% <p>An array of <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column</a> definition objects which define all columns that appear in this
grid. Each column definition provides the header text for the column, and a definition of where the data for that
column comes from.</p>

<p>This can also be a configuration object for a {<a href="#!/api/Ext.grid.header.Container" rel="Ext.grid.header.Container" class="docClass">Ext.grid.header.Container</a> HeaderContainer} which may override
certain default configurations if necessary. For example, the special layout may be overridden to use a simpler
layout, or one can set default values shared by all columns:</p>

<pre><code>columns: {
    items: [
        {
            text: "Column A"
            dataIndex: "field_A"
        },{
            text: "Column B",
            dataIndex: "field_B"
        }, 
        ...
    ],
    defaults: {
        flex: 1
    }
}
</code></pre> %}
    *)
  method deferRowRender : bool Js.t Js.prop
  (** {% <p>Defaults to true to enable deferred row rendering.</p>

<p>This allows the View to execute a refresh quickly, with the expensive update of the row structure deferred so
that layouts with GridPanels appear, and lay out more quickly.</p> %}
    *)
  method disableSelection : bool Js.t Js.prop
  (** {% <p>True to disable selection model.</p> %}
    
    Defaults to: [false]
    *)
  method emptyText : Js.js_string Js.t Js.prop
  (** {% <p>Default text (html tags are accepted) to display in the Panel body when the Store
is empty. When specified, and the Store is empty, the text will be rendered inside a DIV with the CSS class "x-grid-empty".</p> %}
    *)
  method enableColumnHide : bool Js.t Js.prop
  (** {% <p>False to disable column hiding within this grid.</p> %}
    
    Defaults to: [true]
    *)
  method enableColumnMove : bool Js.t Js.prop
  (** {% <p>False to disable column dragging within this grid.</p> %}
    
    Defaults to: [true]
    *)
  method enableColumnResize : bool Js.t Js.prop
  (** {% <p>False to disable column resizing within this grid.</p> %}
    
    Defaults to: [true]
    *)
  method enableLocking : bool Js.t Js.prop
  (** {% <p>True to enable locking support for this grid. Alternatively, locking will also be automatically
enabled if any of the columns in the column configuration contain the locked config option.</p> %}
    
    Defaults to: [false]
    *)
  method features : Ext_grid_feature_Feature.t Js.js_array Js.t Js.prop
  (** {% <p>An array of grid Features to be added to this grid. See <a href="#!/api/Ext.grid.feature.Feature" rel="Ext.grid.feature.Feature" class="docClass">Ext.grid.feature.Feature</a> for usage.</p> %}
    *)
  method forceFit : bool Js.t Js.prop
  (** {% <p>Ttrue to force the columns to fit into the available width. Headers are first sized according to configuration,
whether that be a specific width, or flex. Then they are all proportionally changed in width so that the entire
content width is used. For more accurate control, it is more optimal to specify a flex setting on the columns
that are to be stretched &amp; explicit widths on columns that are not.</p> %}
    *)
  method hideHeaders : bool Js.t Js.prop
  (** {% <p>True to hide column headers.</p> %}
    
    Defaults to: [false]
    *)
  method layout_2 : Js.js_string Js.t Js.prop
  (** {% <p><strong>Important</strong>: In order for child items to be correctly sized and
positioned, typically a layout manager <strong>must</strong> be specified through
the <code>layout</code> configuration option.</p>

<p>The sizing and positioning of child <a href="#!/api/Ext.panel.Table-cfg-items" rel="Ext.panel.Table-cfg-items" class="docClass">items</a> is the responsibility of
the Container's layout manager which creates and manages the type of layout
you have in mind.  For example:</p>

<p>If the <a href="#!/api/Ext.panel.Table-cfg-layout" rel="Ext.panel.Table-cfg-layout" class="docClass">layout</a> configuration is not explicitly specified for
a general purpose container (e.g. Container or Panel) the
<a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used
which does nothing but render child components sequentially into the
Container (no sizing or positioning will be performed in this situation).</p>

<p><strong>layout</strong> may be specified as either as an Object or as a String:</p>

<h1>Specify as an Object</h1>

<p>Example usage:</p>

<pre><code>layout: {
    type: 'vbox',
    align: 'left'
}
</code></pre>

<ul>
<li><p><strong>type</strong></p>

<p>The layout type to be used for this container.  If not specified,
a default <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Ext.layout.container.Auto</a> will be created and used.</p>

<p>Valid layout <code>type</code> values are:</p>

<ul>
<li><a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Auto</a> - <strong>Default</strong></li>
<li><a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">card</a></li>
<li><a href="#!/api/Ext.layout.container.Fit" rel="Ext.layout.container.Fit" class="docClass">fit</a></li>
<li><a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">hbox</a></li>
<li><a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">vbox</a></li>
<li><a href="#!/api/Ext.layout.container.Anchor" rel="Ext.layout.container.Anchor" class="docClass">anchor</a></li>
<li><a href="#!/api/Ext.layout.container.Table" rel="Ext.layout.container.Table" class="docClass">table</a></li>
</ul>
</li>
<li><p>Layout specific configuration properties</p>

<p>Additional layout specific configuration properties may also be
specified. For complete details regarding the valid config options for
each layout type, see the layout class corresponding to the <code>type</code>
specified.</p></li>
</ul>


<h1>Specify as a String</h1>

<p>Example usage:</p>

<pre><code>layout: 'vbox'
</code></pre>

<ul>
<li><p><strong>layout</strong></p>

<p>The layout <code>type</code> to be used for this container (see list
of valid layout type values above).</p>

<p>Additional layout specific configuration properties. For complete
details regarding the valid config options for each layout type, see the
layout class corresponding to the <code>layout</code> specified.</p></li>
</ul>


<h1>Configuring the default layout type</h1>

<pre><code>If a certain Container class has a default layout (For example a <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Toolbar</a>
with a default `Box` layout), then to simply configure the default layout,
use an object, but without the `type` property:


xtype: 'toolbar',
layout: {
    pack: 'center'
}
</code></pre> %}
    
    Defaults to: ['fit']
    *)
  method rowLines : bool Js.t Js.prop
  (** {% <p>Adds row line styling</p> %}
    
    Defaults to: [true]
    *)
  method scroll : 'a Js.t Js.prop
  (** {% <p>Scrollers configuration. Valid values are 'both', 'horizontal' or 'vertical'.
True implies 'both'. False implies 'none'.</p> %}
    
    Defaults to: [true]
    *)
  method sealedColumns : bool Js.t Js.prop
  (** {% <p>True to constrain column dragging so that a column cannot be dragged in or out of it's
current group. Only relevant while <a href="#!/api/Ext.panel.Table-cfg-enableColumnMove" rel="Ext.panel.Table-cfg-enableColumnMove" class="docClass">enableColumnMove</a> is enabled.</p> %}
    
    Defaults to: [false]
    *)
  method selModel : 'a Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.selection.Model" rel="Ext.selection.Model" class="docClass">selection model</a> instance or config object.  In latter case the <a href="#!/api/Ext.panel.Table-cfg-selType" rel="Ext.panel.Table-cfg-selType" class="docClass">selType</a>
config option determines to which type of selection model this config is applied.</p> %}
    *)
  method selType : Js.js_string Js.t Js.prop
  (** {% <p>An xtype of selection model to use. Defaults to 'rowmodel'. This is used to create selection model if just
a config object or nothing at all given in <a href="#!/api/Ext.panel.Table-cfg-selModel" rel="Ext.panel.Table-cfg-selModel" class="docClass">selModel</a> config.</p> %}
    
    Defaults to: ['rowmodel']
    *)
  method sortableColumns : bool Js.t Js.prop
  (** {% <p>False to disable column sorting via clicking the header and via the Sorting menu items.</p> %}
    
    Defaults to: [true]
    *)
  method store : Ext_data_Store.t Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> the grid should use as its data source.</p> %}
    *)
  method verticalScroller : 'a Js.t Js.prop
  (** {% <p>A config object to be used when configuring the <a href="#!/api/Ext.grid.PagingScroller" rel="Ext.grid.PagingScroller" class="docClass">scroll monitor</a> to control
refreshing of data in an "infinite grid".</p>

<p>Configurations of this object allow fine tuning of data caching which can improve performance and usability
of the infinite grid.</p> %}
    *)
  method view : Ext_view_Table.t Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a> used by the grid. Use <a href="#!/api/Ext.panel.Table-cfg-viewConfig" rel="Ext.panel.Table-cfg-viewConfig" class="docClass">viewConfig</a> to just supply some config options to
view (instead of creating an entire View instance).</p> %}
    *)
  method viewConfig : 'a Js.t Js.prop
  (** {% <p>A config object that will be applied to the grid's UI view. Any of the config options available for
<a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a> can be specified here. This option is ignored if <a href="#!/api/Ext.panel.Table-cfg-view" rel="Ext.panel.Table-cfg-view" class="docClass">view</a> is specified.</p> %}
    *)
  method viewType : Js.js_string Js.t Js.prop
  (** {% <p>An xtype of view to use. This is automatically set to 'gridview' by <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Grid</a>
and to 'treeview' by <a href="#!/api/Ext.tree.Panel" rel="Ext.tree.Panel" class="docClass">Tree</a>.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_panel_AbstractPanel.events
  inherit Ext_panel_Panel.events
  
  method beforecontainerclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the click event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the contextmenu event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainerdblclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the dblclick event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermousedown : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mousedown event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseout : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseout event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseover : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseover event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseup : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseup event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforedeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before a record is deselected. If any listener returns false, the
deselection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index deselected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeedit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Forwarded event from <a href="#!/api/Ext.grid.plugin.Editing" rel="Ext.grid.plugin.Editing" class="docClass">Ext.grid.plugin.Editing</a>.</p>

<p>Fires before editing is triggered. Return false from event handler to stop the editing.</p> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record being edited</li>
<li>field * The field name being edited</li>
<li>value * The value for the field being edited.</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that is being edited.</li>
<li>rowIdx * The row index that is being edited</li>
<li>colIdx * The column index that is being edited</li>
<li>cancel * Set this to true to cancel the edit or return false from your handler.</li>
<li>originalValue * Alias for value (only when using <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a>).</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the click event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemcontextmenu : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the contextmenu event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the dblclick event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mousedown event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseenter : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseenter event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseleave : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseleave event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseup event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before a record is selected. If any listener returns false, the
selection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index selected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method canceledit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Forwarded event from <a href="#!/api/Ext.grid.plugin.Editing" rel="Ext.grid.plugin.Editing" class="docClass">Ext.grid.plugin.Editing</a>.</p>

<p>Fires when the user started editing but then cancelled the edit.</p> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record that was edited</li>
<li>field * The field name that was edited</li>
<li>value * The value being set</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that was edited.</li>
<li>rowIdx * The row index that was edited</li>
<li>colIdx * The column index that was edited</li>
<li>view * The grid view</li>
<li>store * The grid store</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method cellclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when table cell is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element that was clicked.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element that was clicked.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method celldblclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when table cell is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element that was clicked.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element that was clicked.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method columnhide : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnmove : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> Js.number Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  method columnresize : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method columnshow : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  method containerclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is right clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containerdblclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseout : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when you move the mouse out of the container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseover : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when you move the mouse over the container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseup : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse up on the container</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deselect : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t
    -> Js.number Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is deselected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index deselected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method edit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Forwarded event from <a href="#!/api/Ext.grid.plugin.Editing" rel="Ext.grid.plugin.Editing" class="docClass">Ext.grid.plugin.Editing</a>.</p>

<p>Fires after a editing. Usage example:</p>

<pre><code>grid.on('edit', function(editor, e) {
    // commit the changes right after editing finished
    e.record.commit();
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record that was edited</li>
<li>field * The field name that was edited</li>
<li>value * The value being set</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that was edited.</li>
<li>rowIdx * The row index that was edited</li>
<li>colIdx * The column index that was edited</li>
<li>originalValue * The original value for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a>)</li>
<li>originalValues * The original values for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>newValues * The new values being set (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>view * The grid view (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>store * The grid store (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemcontextmenu : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is right clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse down on an item</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseenter : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse enters an item.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseleave : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse leaves an item.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse up on an item</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method select : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t ->
    Js.number Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is selected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_RowModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index selected</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method selectionchange : (#Ext_selection_Model.t Js.t ->
    Ext_data_Model.t Js.js_array Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired after a selection change has occurred</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- selected: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The selected records</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method sortchange : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.js_string Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  method validateedit : (Ext_grid_plugin_Editing.t Js.t -> 'a Js.t -> 'b Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Forwarded event from <a href="#!/api/Ext.grid.plugin.Editing" rel="Ext.grid.plugin.Editing" class="docClass">Ext.grid.plugin.Editing</a>.</p>

<p>Fires after editing, but before the value is set in the record. Return false from event handler to
cancel the change.</p>

<p>Usage example showing how to remove the red triangle (dirty record indicator) from some records (not all). By
observing the grid's validateedit event, it can be cancelled if the edit occurs on a targeted row (for example)
and then setting the field's new value in the Record directly:</p>

<pre><code>grid.on('validateedit', function(editor, e) {
  var myTargetRow = 6;

  if (e.rowIdx == myTargetRow) {
    e.cancel = true;
    e.record.data[e.field] = e.value;
  }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- editor: [Ext_grid_plugin_Editing.t Js.t]
    }
    {- e: ['a Js.t]
    {% <p>An edit event with the following properties:</p>

<ul>
<li>grid * The grid</li>
<li>record * The record being edited</li>
<li>field * The field name being edited</li>
<li>value * The value being set</li>
<li>row * The grid table row</li>
<li>column * The grid <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">Column</a> defining the column that is being edited.</li>
<li>rowIdx * The row index that is being edited</li>
<li>colIdx * The column index that is being edited</li>
<li>cancel * Set this to true to cancel the edit or return false from your handler.</li>
<li>originalValue * The original value for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a>)</li>
<li>originalValues * The original values for the field, before the edit (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>newValues * The new values being set (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>view * The grid view (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
<li>store * The grid store (only when using <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>)</li>
</ul> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method viewready : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the grid view is available (use this for selecting a default row).</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_panel_Table.t Js.t]
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  inherit Ext_panel_Panel.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

