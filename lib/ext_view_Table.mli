(** This class encapsulates the user interface for a t ...
  
  {% <p>This class encapsulates the user interface for a tabular data set.
It acts as a centralized manager for controlling the various interface
elements of the view. This includes handling events, such as row and cell
level based DOM events. It also reacts to events from the underlying <a href="#!/api/Ext.selection.Model" rel="Ext.selection.Model" class="docClass">Ext.selection.Model</a>
to provide visual feedback to the user.</p>

<p>This class does not provide ways to manipulate the underlying data of the configured
<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>.</p>

<p>This is the base class for both <a href="#!/api/Ext.grid.View" rel="Ext.grid.View" class="docClass">Ext.grid.View</a> and <a href="#!/api/Ext.tree.View" rel="Ext.tree.View" class="docClass">Ext.tree.View</a> and is not
to be used directly.</p>

<p><strong>From override Ext.grid.plugin.BufferedRendererTableView:</strong> A set of overrides required by the presence of the BufferedRenderer plugin.</p>

<p>These overrides of <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a> take into account the affect of a buffered renderer and
divert execution from the default course where necessary.</p> %}
  *)

class type t =
object('self)
  inherit Ext_view_View.t
  
  method addRowCls : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Adds a CSS Class to a specific row.</p> %}
    
    {b Parameters}:
    {ul {- rowInfo: [_ Js.t]
    {% <p>An HTMLElement, index or instance of a model
representing this row</p> %}
    }
    {- cls: [Js.js_string Js.t]
    }
    }
    *)
  method autoSizeColumn : _ Js.t -> unit Js.meth
  (** {% <p>Sizes the passed header to fit the max content width.
<em>Note that group columns shrinkwrap around the size of leaf columns. Auto sizing a group column
autosizes descendant leaf columns.</em></p> %}
    
    {b Parameters}:
    {ul {- header: [_ Js.t]
    {% <p>The header (or index of header) to auto size.</p> %}
    }
    }
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method collectData : Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    _ Js.t Js.js_array Js.t Js.meth
  (** {% <p>Function which can be overridden which returns the data object passed to this
DataView's <a href="#!/api/Ext.view.Table-cfg-tpl" rel="Ext.view.Table-cfg-tpl" class="docClass">template</a> to render the whole DataView.</p>

<p>This is usually an Array of data objects, each element of which is processed by an
<a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> which uses <code>'&amp;lt;tpl for="."&amp;gt;'</code> to iterate over its supplied
data object as an Array. However, <i>named</i> properties may be placed into the data object to
provide non-repeating data such as headings, totals etc.</p> %}
    
    {b Parameters}:
    {ul {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>An Array of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>s to be rendered into the DataView.</p> %}
    }
    {- startIndex: [Js.number Js.t]
    {% <p>the index number of the Record being prepared for rendering.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t Js.js_array Js.t]
    {% <p>An Array of data objects to be processed by a repeating XTemplate. May also
contain <i>named</i> properties.</p> %}
    }
    }
    *)
  method focus_table : bool Js.t Js.optdef -> _ Js.t Js.optdef ->
    #Ext_Component.t Js.t Js.meth
  (** {% <p>Try to focus this component.</p> %}
    
    {b Parameters}:
    {ul {- selectText: [bool Js.t] (optional)
    {% <p>If applicable, true to also select the text in this component</p> %}
    }
    {- delay: [_ Js.t] (optional)
    {% <p>Delay the focus this number of milliseconds (true for 10 milliseconds).</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The focused Component. Usually <code>this</code> Component. Some Containers may
delegate focus to a descendant Component (<a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s can do this through their
<a href="#!/api/Ext.window.Window-cfg-defaultFocus" rel="Ext.window.Window-cfg-defaultFocus" class="docClass">defaultFocus</a> config option.</p> %}
    }
    }
    *)
  method focusRow : _ Js.t -> unit Js.meth
  (** {% <p>Focuses a particular row and brings it into view. Will fire the rowfocus event.</p> %}
    
    {b Parameters}:
    {ul {- rowIdx: [_ Js.t]
    {% <p>An HTMLElement template node, index of a template node, the id of a template node or the
record associated with the node.</p> %}
    }
    }
    *)
  method getBodySelector : unit Js.meth
  (** {% <p>Returns a CSS selector which selects the outermost element(s) in this view.</p> %}
    *)
  method getCellSelector : Ext_grid_column_Column.t Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Returns a CSS selector which selects a particular column if the desired header is passed,
or a general cell selector is no parameter is passed.</p> %}
    
    {b Parameters}:
    {ul {- header: [Ext_grid_column_Column.t Js.t] (optional)
    {% <p>The column for which to return the selector. If
omitted, the general cell selector which matches <strong>ant cell</strong> will be returned.</p> %}
    }
    }
    *)
  method getColumnSizerSelector : _ Js.t -> unit Js.meth
  (** {% <p>Returns a CSS selector which selects the element(s) which define the width of a column.</p>

<p>This is used by the <a href="#!/api/Ext.view.TableLayout" rel="Ext.view.TableLayout" class="docClass">Ext.view.TableLayout</a> when resizing columns.</p> %}
    
    {b Parameters}:
    {ul {- header: [_ Js.t]
    }
    }
    *)
  method getDataRowSelector : unit Js.meth
  (** {% <p>Returns a CSS selector which selects a row which contains cells.</p>

<p>These <em>may not</em> correspond to actual records in the store. This selector may be used
to identify things like total rows or header rows as injected by features which modify
the rowTpl.</p> %}
    *)
  method getFeature : Js.js_string Js.t -> Ext_grid_feature_Feature.t Js.t
    Js.meth
  (** {% <p>Get a reference to a feature</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The id of the feature</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_grid_feature_Feature.t Js.t]
    {% <p>The feature. Undefined if not found</p> %}
    }
    }
    *)
  method getItemSelector : unit Js.meth
  (** {% <p>Returns a CSS selector which selects items of the view rendered by the rowTpl</p> %}
    *)
  method getNode_table : _ Js.t -> bool Js.t Js.optdef ->
    Dom_html.element Js.t Js.meth
  (** {% <p>Returns the node given the passed Record, or index or node.</p> %}
    
    {b Parameters}:
    {ul {- nodeInfo: [_ Js.t]
    {% <p>The node or record</p> %}
    }
    {- dataRow: [bool Js.t] (optional)
    {% <p><code>true</code> to return the data row (not the top level row if wrapped), <code>false</code>
to return the top level row.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t]
    {% <p>The node or null if it wasn't found</p> %}
    }
    }
    *)
  method getNodeContainerSelector : unit Js.meth
  (** {% <p>Returns a CSS selector which selects the element which contains record nodes.</p> %}
    *)
  method getPosition : bool Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t
    Js.meth
  (** {% <p>TODO: have this use the new Ext.grid.CellContext class</p>

<p>Gets the current XY position of the component's underlying element.</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t] (optional)
    {% <p>If true the element's left and top are returned instead of page XY.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The XY position of the element (e.g., [100, 200])</p> %}
    }
    }
    *)
  method getRecord : _ Js.t -> Ext_data_Model.t Js.t Js.meth
  (** {% <p>Gets a record from a node</p> %}
    
    {b Parameters}:
    {ul {- node: [_ Js.t]
    {% <p>The node to evaluate</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t]
    {% <p>record The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> object</p> %}
    }
    }
    *)
  method getRowClass : Ext_data_Model.t Js.t -> Js.number Js.t -> _ Js.t ->
    Ext_data_Store.t Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Override this function to apply custom CSS classes to rows during rendering. This function should return the
CSS class name (or empty string '' for none) that will be added to the row's wrapping div. To apply multiple
class names, simply return them space-delimited within the string (e.g. 'my-class another-class').
Example usage:</p>

<pre><code>viewConfig: \{
    getRowClass: function(record, rowIndex, rowParams, store)\{
        return record.get("valid") ? "row-valid" : "row-error";
    \}
\}
</code></pre> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The record corresponding to the current row.</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The row index.</p> %}
    }
    {- rowParams: [_ Js.t]
    {% <p><strong>DEPRECATED.</strong> For row body use the
<a href="#!/api/Ext.grid.feature.RowBody-method-getAdditionalData" rel="Ext.grid.feature.RowBody-method-getAdditionalData" class="docClass">getAdditionalData</a> method of the rowbody feature.</p> %}
    }
    {- store: [Ext_data_Store.t Js.t]
    {% <p>The store this grid is bound to</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>a CSS class name to add to the row.</p> %}
    }
    }
    *)
  method indexOf : _ Js.t -> Js.number Js.t Js.meth
  (** {% <p>Finds the index of the passed node.</p> %}
    
    {b Parameters}:
    {ul {- nodeInfo: [_ Js.t]
    {% <p>An HTMLElement template node, index of a template node, the id of a template node
or a record associated with a node.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The index of the node or -1</p> %}
    }
    }
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
  method refresh : unit Js.meth
  (** {% <p>Refreshes the grid view. Saves and restores the scroll state, generates a new template, stripes rows and
invalidates the scrollers.</p> %}
    *)
  method removeRowCls : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  (** {% <p>Removes a CSS Class from a specific row.</p> %}
    
    {b Parameters}:
    {ul {- rowInfo: [_ Js.t]
    {% <p>An HTMLElement, index or instance of a model
representing this row</p> %}
    }
    {- cls: [Js.js_string Js.t]
    }
    }
    *)
  method walkRecs : Ext_data_Model.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Navigates from the passed record by the passed increment which may be +ve or -ve</p>

<p>Skips hidden records.</p>

<p>If no record is visible in the specified direction, returns the starting record index unchanged.</p> %}
    
    {b Parameters}:
    {ul {- startRec: [Ext_data_Model.t Js.t]
    {% <p>The Record to start from.</p> %}
    }
    {- distance: [Js.number Js.t]
    {% <p>The distance to move from the record. May be +ve or -ve.</p> %}
    }
    }
    *)
  method walkRows : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Increments the passed row index by the passed increment which may be +ve or -ve</p>

<p>Skips hidden rows.</p>

<p>If no row is visible in the specified direction, returns the input row index unchanged.</p> %}
    
    {b Parameters}:
    {ul {- startRow: [Js.number Js.t]
    {% <p>The zero-based row index to start from.</p> %}
    }
    {- distance: [Js.number Js.t]
    {% <p>The distance to move the row by. May be +ve or -ve.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_view_View.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this component's element. This will also be prepended to elements within this
component like Panel's body will get a class <code>x-panel-body</code>. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the <code>baseCls</code> <code>x-panel</code> and use
<code>componentCls</code> to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'grid-view']
    *)
  method componentLayout : _ Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.view.Table-method-setSize" rel="Ext.view.Table-method-setSize" class="docClass">setSize</a> method.</p> %}
    
    Defaults to: ['tableview']
    *)
  method enableTextSelection : bool Js.t Js.prop
  (** {% <p>True to enable text selections.</p> %}
    *)
  method firstCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to add to the <em>first</em> cell in every row to enable special styling for the first column.
If no styling is needed on the first column, this may be configured as <code>null</code>.</p> %}
    
    Defaults to: ['x-grid-cell-first']
    *)
  method itemSelector : Js.js_string Js.t Js.prop
  (** {% <p>view item (may be a wrapper)</p>

<p><b>This is a required setting</b>. A simple CSS selector (e.g. <tt>div.some-class</tt> or
<tt>span:first-child</tt>) that will be used to determine what nodes this DataView will be
working with. The itemSelector is used to map DOM nodes to records. As such, there should
only be one root level element that matches the selector for each record.</p> %}
    
    Defaults to: ['tr.' + Ext.baseCSSPrefix + 'grid-row']
    *)
  method lastCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to add to the <em>last</em> cell in every row to enable special styling for the last column.
If no styling is needed on the last column, this may be configured as <code>null</code>.</p> %}
    
    Defaults to: ['x-grid-cell-last']
    *)
  method markDirty : bool Js.t Js.prop
  (** {% <p>True to show the dirty cell indicator when a cell has been modified.</p> %}
    
    Defaults to: [true]
    *)
  method overItemCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to apply to each item in the view on mouseover.
Setting this will automatically set <a href="#!/api/Ext.view.Table-cfg-trackOver" rel="Ext.view.Table-cfg-trackOver" class="docClass">trackOver</a> to <code>true</code>.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'grid-row-over']
    *)
  method selectedItemCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to apply to each selected item in the view.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'grid-row-selected']
    *)
  method stripeRows : bool Js.t Js.prop
  (** {% <p>True to stripe the rows.</p>

<p>This causes the CSS class <strong><code>x-grid-row-alt</code></strong> to be added to alternate rows of
the grid. A default CSS rule is provided which sets a background color, but you can override this
with a rule which either overrides the <strong>background-color</strong> style using the <code>!important</code>
modifier, or which uses a CSS selector of higher specificity.</p> %}
    
    Defaults to: [true]
    *)
  method trackOver : bool Js.t Js.prop
  (** {% <p>cfg docs inherited</p>

<p>When <code>true</code> the <a href="#!/api/Ext.view.Table-cfg-overItemCls" rel="Ext.view.Table-cfg-overItemCls" class="docClass">overItemCls</a> will be applied to rows when hovered over.
This in return will also cause <a href="#!/api/Ext.view.View-event-highlightitem" rel="Ext.view.View-event-highlightitem" class="docClass">highlightitem</a> and
<a href="#!/api/Ext.view.View-event-unhighlightitem" rel="Ext.view.View-event-unhighlightitem" class="docClass">unhighlightitem</a> events to be fired.</p>

<p>Enabled automatically when the <a href="#!/api/Ext.view.Table-cfg-overItemCls" rel="Ext.view.Table-cfg-overItemCls" class="docClass">overItemCls</a> config is set.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_view_View.events
  
  method beforecellclick : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t
    -> Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  method beforecellcontextmenu : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
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
  method beforecelldblclick : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
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
  method beforecellkeydown : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
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
  method beforecellmousedown : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
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
  method beforecellmouseup : (t Js.t -> Dom_html.element Js.t ->
    Js.number Js.t -> Ext_data_Model.t Js.t -> Dom_html.element Js.t ->
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
  method cellclick : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  method cellcontextmenu : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t
    -> Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  method celldblclick : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  method cellkeydown : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  method cellmousedown : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t
    -> Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  method cellmouseup : (t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> Dom_html.element Js.t -> Js.number Js.t ->
    Ext_EventObject.t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
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
  
end

class type statics =
object
  inherit Ext_view_View.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

