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
  inherit Ext_panel_Panel.t
  
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
  method applyState : _ Js.t -> unit Js.meth
  (** {% <p>Applies the state to the object. This should be overridden in subclasses to do
more complex state operations. By default it applies the state properties onto
the current object.</p> %}
    
    {b Parameters}:
    {ul {- state: [_ Js.t] {% <p>The state</p> %}
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
  method getState : _ Js.t Js.meth
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
  method initComponent : unit Js.meth
  (** {% <p>The initComponent template method is an important initialization step for a Component. It is intended to be
implemented by each subclass of <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> to provide any needed constructor logic. The
initComponent method of the class being created is called first, with each initComponent method
up the hierarchy to <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> being called thereafter. This makes it easy to implement and,
if needed, override the constructor logic of the Component at any step in the hierarchy.</p>

<p>The initComponent method <strong>must</strong> contain a call to <a href="#!/api/Ext.Base-method-callParent" rel="Ext.Base-method-callParent" class="docClass">callParent</a> in order
to ensure that the parent class' initComponent method is also called.</p>

<p>All config options passed to the constructor are applied to <code>this</code> before initComponent is called,
so you can simply access them with <code>this.someOption</code>.</p>

<p>The following example demonstrates using a dynamic string for the text of a button at the time of
instantiation of the class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', \{
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() \{
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    \}
\});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() \{
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
\});
</code></pre> %}
    *)
  method onDestroy : unit Js.meth
  (** {% <p>Allows addition of behavior to the destroy operation.
After calling the superclass's onDestroy, the Component will be destroyed.</p> %}
    *)
  method hasView : bool Js.t Js.prop
  (** {% <p>True to indicate that a view has been injected into the panel.</p> %}
    
    Defaults to: [false]
    *)
  method optimizedColumnMove : bool Js.t Js.prop
  (** {% <p>If you are writing a grid plugin or a \{<a href="#!/api/Ext.grid.feature.Feature" rel="Ext.grid.feature.Feature" class="docClass">Ext.grid.feature.Feature</a> Feature\} which creates a column-based structure which
needs a view refresh when columns are moved, then set this property in the grid.</p>

<p>An example is the built in <a href="#!/api/Ext.grid.feature.AbstractSummary" rel="Ext.grid.feature.AbstractSummary" class="docClass">Summary</a> Feature. This creates summary rows, and the
summary columns must be in the same order as the data columns. This plugin sets the <code>optimizedColumnMove</code> to `false.</p> %}
    *)
  
end

class type configs =
object('self)
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
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method allowDeselect : bool Js.t Js.prop
  (** {% <p>True to allow deselecting a record. This config is forwarded to <a href="#!/api/Ext.selection.Model-cfg-allowDeselect" rel="Ext.selection.Model-cfg-allowDeselect" class="docClass">Ext.selection.Model.allowDeselect</a>.</p> %}
    
    Defaults to: [false]
    *)
  method columnLines : bool Js.t Js.prop
  (** {% <p>Adds column line styling</p> %}
    *)
  method columns : _ Js.t Js.prop
  (** {% <p>An array of <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column</a> definition objects which define all columns that appear in this
grid. Each column definition provides the header text for the column, and a definition of where the data for that
column comes from.</p>

<p>This can also be a configuration object for a \{<a href="#!/api/Ext.grid.header.Container" rel="Ext.grid.header.Container" class="docClass">Ext.grid.header.Container</a> HeaderContainer\} which may override
certain default configurations if necessary. For example, the special layout may be overridden to use a simpler
layout, or one can set default values shared by all columns:</p>

<pre><code>columns: \{
    items: [
        \{
            text: "Column A"
            dataIndex: "field_A"
        \},\{
            text: "Column B",
            dataIndex: "field_B"
        \}, 
        ...
    ],
    defaults: \{
        flex: 1
    \}
\}
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
  (** {% <p>Configure as <code>true</code> to enable locking support for this grid. Alternatively, locking will also be automatically
enabled if any of the columns in the <a href="#!/api/Ext.panel.Table-cfg-columns" rel="Ext.panel.Table-cfg-columns" class="docClass">columns</a> configuration contain a <a href="#!/api/Ext.grid.column.Column-cfg-locked" rel="Ext.grid.column.Column-cfg-locked" class="docClass">locked</a> config option.</p>

<p>A locking grid is processed in a special way. The configuration options are cloned and <em>two</em> grids are created to be the locked (left) side
and the normal (right) side. This Panel becomes merely a <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">container</a> which arranges both in an <a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">HBox</a> layout.</p>

<p><a href="#!/api/Ext.panel.Table-cfg-plugins" rel="Ext.panel.Table-cfg-plugins" class="docClass">Plugins</a> may be targeted at either locked, or unlocked grid, or, both, in which case the plugin is cloned and used on both sides.</p>

<p>Plugins may also be targeted at the containing locking Panel.</p>

<p>This is configured by specifying a <code>lockableScope</code> property in your plugin which may have the following values:</p>

<ul>
<li><code>"both"</code> (the default) - The plugin is added to both grids</li>
<li><code>"top"</code> - The plugin is added to the containing Panel</li>
<li><code>"locked"</code> - The plugin is added to the locked (left) grid</li>
<li><code>"normal"</code> - The plugin is added to the normal (right) grid</li>
</ul>


<p>If <code>both</code> is specified, then each copy of the plugin gains a property <code>lockingPartner</code> which references its sibling on the other side so that they
can synchronize operations is necessary.</p>

<p><a href="#!/api/Ext.panel.Table-cfg-features" rel="Ext.panel.Table-cfg-features" class="docClass">Features</a> may also be configured with <code>lockableScope</code> and may target the locked grid, the normal grid or both grids. Features
also get a <code>lockingPartner</code> reference injected.</p> %}
    
    Defaults to: [false]
    *)
  method features : _ Js.t Js.prop
  (** {% <p>An array of grid Features to be added to this grid. Can also be just a single feature instead of array.</p>

<p>Features config behaves much like <a href="#!/api/Ext.panel.Table-cfg-plugins" rel="Ext.panel.Table-cfg-plugins" class="docClass">plugins</a>.
A feature can be added by either directly referencing the instance:</p>

<pre><code>features: [<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.feature.GroupingSummary" rel="Ext.grid.feature.GroupingSummary" class="docClass">Ext.grid.feature.GroupingSummary</a>', \{groupHeaderTpl: 'Subject: \{name\}'\})],
</code></pre>

<p>By using config object with ftype:</p>

<pre><code>features: [\{ftype: 'groupingsummary', groupHeaderTpl: 'Subject: \{name\}'\}],
</code></pre>

<p>Or with just a ftype:</p>

<pre><code>features: ['grouping', 'groupingsummary'],
</code></pre>

<p>See <a href="#!/api/Ext.enums.Feature" rel="Ext.enums.Feature" class="docClass">Ext.enums.Feature</a> for list of all ftypes.</p> %}
    *)
  method forceFit : bool Js.t Js.prop
  (** {% <p>True to force the columns to fit into the available width. Headers are first sized according to configuration,
whether that be a specific width, or flex. Then they are all proportionally changed in width so that the entire
content width is used. For more accurate control, it is more optimal to specify a flex setting on the columns
that are to be stretched &amp; explicit widths on columns that are not.</p> %}
    *)
  method hideHeaders : bool Js.t Js.prop
  (** {% <p>True to hide column headers.</p> %}
    
    Defaults to: [false]
    *)
  method layout : _ Js.t Js.prop
  (** {% <p><strong>Important</strong>: In order for child items to be correctly sized and
positioned, typically a layout manager <strong>must</strong> be specified through
the <code>layout</code> configuration option.</p>

<p>The sizing and positioning of child <a href="#!/api/Ext.panel.Table-cfg-items" rel="Ext.panel.Table-cfg-items" class="docClass">items</a> is the responsibility of
the Container's layout manager which creates and manages the type of layout
you have in mind.  For example:</p>

<p>If the layout configuration is not explicitly specified for
a general purpose container (e.g. Container or Panel) the
<a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used
which does nothing but render child components sequentially into the
Container (no sizing or positioning will be performed in this situation).</p>

<p><strong>layout</strong> may be specified as either as an Object or as a String:</p>

<h2>Specify as an Object</h2>

<p>Example usage:</p>

<pre><code>layout: \{
    type: 'vbox',
    align: 'left'
\}
</code></pre>

<ul>
<li><p><strong>type</strong></p>

<p>The layout type to be used for this container.  If not specified,
a default <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Ext.layout.container.Auto</a> will be created and used.</p>

<p>Valid layout <code>type</code> values are listed in <a href="#!/api/Ext.enums.Layout" rel="Ext.enums.Layout" class="docClass">Ext.enums.Layout</a>.</p></li>
<li><p>Layout specific configuration properties</p>

<p>Additional layout specific configuration properties may also be
specified. For complete details regarding the valid config options for
each layout type, see the layout class corresponding to the <code>type</code>
specified.</p></li>
</ul>


<h2>Specify as a String</h2>

<p>Example usage:</p>

<pre><code>layout: 'vbox'
</code></pre>

<ul>
<li><p><strong>layout</strong></p>

<p>The layout <code>type</code> to be used for this container (see <a href="#!/api/Ext.enums.Layout" rel="Ext.enums.Layout" class="docClass">Ext.enums.Layout</a>
for list of valid values).</p>

<p>Additional layout specific configuration properties. For complete
details regarding the valid config options for each layout type, see the
layout class corresponding to the <code>layout</code> specified.</p></li>
</ul>


<h2>Configuring the default layout type</h2>

<p>If a certain Container class has a default layout (For example a <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Toolbar</a>
with a default <code>Box</code> layout), then to simply configure the default layout,
use an object, but without the <code>type</code> property:</p>

<pre><code>xtype: 'toolbar',
layout: \{
    pack: 'center'
\}
</code></pre> %}
    
    Defaults to: ['fit']
    *)
  method rowLines : bool Js.t Js.prop
  (** {% <p>Adds row line styling</p> %}
    
    Defaults to: [true]
    *)
  method scroll : _ Js.t Js.prop
  (** {% <p>Scrollers configuration. Valid values are 'both', 'horizontal' or 'vertical'.
True implies 'both'. False implies 'none'.</p> %}
    
    Defaults to: [true]
    *)
  method sealedColumns : bool Js.t Js.prop
  (** {% <p>True to constrain column dragging so that a column cannot be dragged in or out of it's
current group. Only relevant while <a href="#!/api/Ext.panel.Table-cfg-enableColumnMove" rel="Ext.panel.Table-cfg-enableColumnMove" class="docClass">enableColumnMove</a> is enabled.</p> %}
    
    Defaults to: [false]
    *)
  method selModel : _ Js.t Js.prop
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
  method verticalScroller : _ Js.t Js.prop
  (** {% <p>A config object to be used when configuring the <a href="#!/api/Ext.grid.plugin.BufferedRenderer" rel="Ext.grid.plugin.BufferedRenderer" class="docClass">scroll monitor</a> to control
refreshing of data in an "infinite grid".</p>

<p>Configurations of this object allow fine tuning of data caching which can improve performance and usability
of the infinite grid.</p> %}
    *)
  method view : Ext_view_Table.t Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a> used by the grid. Use <a href="#!/api/Ext.panel.Table-cfg-viewConfig" rel="Ext.panel.Table-cfg-viewConfig" class="docClass">viewConfig</a> to just supply some config options to
view (instead of creating an entire View instance).</p> %}
    *)
  method viewConfig : _ Js.t Js.prop
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
  inherit Ext_panel_Panel.events
  
  method beforecellclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before the cell click is processed. Return false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecellcontextmenu : (Ext_view_Table.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired before the cell right click is processed. Return false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecelldblclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t
    -> Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before the cell double click is processed. Return false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecellkeydown : (Ext_view_Table.t Js.t -> Dom_html.element Js.t
    -> Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before the cell key down is processed. Return false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecellmousedown : (Ext_view_Table.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired before the cell mouse down is processed. Return false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecellmouseup : (Ext_view_Table.t Js.t -> Dom_html.element Js.t
    -> Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before the cell mouse up is processed. Return false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainerclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the click event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the contextmenu event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainerdblclick : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the dblclick event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermousedown : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mousedown event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseout : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseout event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseover : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseover event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseup : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseup event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforedeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t -> unit) Js.callback
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemcontextmenu : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseenter : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseleave : (Ext_view_View.t Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t
    -> Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeselect : (Ext_selection_RowModel.t Js.t ->
    Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t -> unit) Js.callback
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method cellclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when table cell is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method cellcontextmenu : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when table cell is right clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method celldblclick : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when table cell is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method cellkeydown : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when the keydown event is captured on the cell.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method cellmousedown : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when the mousedown event is captured on the cell.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method cellmouseup : (Ext_view_Table.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when the mouseup event is captured on the cell.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_Table.t Js.t]
    }
    {- td: [Dom_html.element Js.t]
    {% <p>The TD element for the cell.</p> %}
    }
    {- cellIndex: [Js.number Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    }
    {- tr: [Dom_html.element Js.t]
    {% <p>The TR element for the cell.</p> %}
    }
    {- rowIndex: [Js.number Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method columnhide : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnmove : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> Js.number Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  method columnresize : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.number Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method columnschanged : (Ext_grid_header_Container.t Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after the columns change in any way, when a column has been hidden or shown, or when a column
is added to or removed from this header container.</p> %}
    
    {b Parameters}:
    {ul {- ct: [Ext_grid_header_Container.t Js.t]
    {% <p>The grid's header Container which encapsulates all column headers.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method columnshow : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method containerclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containercontextmenu : (Ext_view_View.t Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is right clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containerdblclick : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseout : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when you move the mouse out of the container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseover : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when you move the mouse over the container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseup : (Ext_view_View.t Js.t -> Ext_EventObject.t Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse up on the container</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deselect : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t
    -> Js.number Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
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
  method headerclick : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headercontextmenu : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headertriggerclick : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method itemclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemcontextmenu : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemdblclick : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmousedown : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseenter : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseleave : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseup : (Ext_view_View.t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method select : (Ext_selection_RowModel.t Js.t -> Ext_data_Model.t Js.t ->
    Js.number Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method selectionchange : (#Ext_selection_Model.t Js.t ->
    Ext_data_Model.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired after a selection change has occurred</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- selected: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The selected records</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method sortchange : (Ext_grid_header_Container.t Js.t ->
    Ext_grid_column_Column.t Js.t -> Js.js_string Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  method viewready : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the grid view is available (use this for selecting a default row).</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_panel_Table.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_panel_Panel.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

