(** This is an abstract superclass and should not be u ...
  
  {% <p>This is an abstract superclass and should not be used directly. Please see <a href="#!/api/Ext.view.View" rel="Ext.view.View" class="docClass">Ext.view.View</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_util_Bindable.t
  
  method afterRender : unit Js.meth
  (** {% <p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
    *)
  method bindStore_view : Ext_data_Store.t Js.t -> unit Js.meth
  (** {% <p>Changes the data store bound to this view and refreshes it.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store to bind to this view</p> %}
    }
    }
    *)
  method collectData : Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    'a Js.t Js.js_array Js.t Js.meth
  (** {% <p>Function which can be overridden which returns the data object passed to this
DataView's <a href="#!/api/Ext.view.AbstractView-cfg-tpl" rel="Ext.view.AbstractView-cfg-tpl" class="docClass">template</a> to render the whole DataView.</p>


<p>This is usually an Array of data objects, each element of which is processed by an
<a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> which uses <tt>'&lt;tpl for="."&gt;'</tt> to iterate over its supplied
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
    {ul {- ['a Js.t Js.js_array Js.t]
    {% <p>An Array of data objects to be processed by a repeating XTemplate. May also
contain <i>named</i> properties.</p> %}
    }
    }
    *)
  method deselect : 'a Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>Deselects a record instance by record instance or index.</p> %}
    
    {b Parameters}:
    {ul {- records: ['a Js.t]
    {% <p>An array of records or an index</p> %}
    }
    {- suppressEvent: [bool Js.t]
    {% <p>Set to false to not fire a deselect event</p> %}
    }
    }
    *)
  method findItemByChild : Dom_html.element Js.t -> Dom_html.element Js.t
    Js.meth
  (** {% <p>Returns the template node the passed child belongs to, or null if it doesn't belong to one.</p> %}
    
    {b Parameters}:
    {ul {- node: [Dom_html.element Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t] {% <p>The template node</p> %}
    }
    }
    *)
  method findTargetByEvent : Ext_EventObject.t Js.t -> unit Js.meth
  (** {% <p>Returns the template node by the <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a> or null if it is not found.</p> %}
    
    {b Parameters}:
    {ul {- e: [Ext_EventObject.t Js.t]
    }
    }
    *)
  method getNode : 'a Js.t -> Dom_html.element Js.t Js.meth
  (** {% <p>Gets a template node.</p> %}
    
    {b Parameters}:
    {ul {- nodeInfo: ['a Js.t]
    {% <p>An HTMLElement template node, index of a template node,
the id of a template node or the record associated with the node.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t]
    {% <p>The node or null if it wasn't found</p> %}
    }
    }
    *)
  method getNodes : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets a range nodes.</p> %}
    
    {b Parameters}:
    {ul {- start: [Js.number Js.t]
    {% <p>The index of the first node in the range</p> %}
    }
    {- _end: [Js.number Js.t]
    {% <p>The index of the last node in the range</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>An array of nodes</p> %}
    }
    }
    *)
  method getRecord : 'a Js.t -> Ext_data_Model.t Js.t Js.meth
  (** {% <p>Gets a record from a node</p> %}
    
    {b Parameters}:
    {ul {- node: ['a Js.t]
    {% <p>The node to evaluate</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t]
    {% <p>record The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> object</p> %}
    }
    }
    *)
  method getRecords : Dom_html.element Js.t Js.js_array Js.t ->
    Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Gets an array of the records from an array of nodes</p> %}
    
    {b Parameters}:
    {ul {- nodes: [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>The nodes to evaluate</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>records The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> objects</p> %}
    }
    }
    *)
  method getSelectedNodes : Dom_html.element Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets the currently selected nodes.</p> %}
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>An array of HTMLElements</p> %}
    }
    }
    *)
  method getSelectionModel : #Ext_selection_Model.t Js.t Js.meth
  (** {% <p>Gets the selection model for this view.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_selection_Model.t Js.t] {% <p>The selection model</p> %}
    }
    }
    *)
  method getStore_view : Ext_data_Store.t Js.t Js.meth
  (** {% <p>Returns the store associated with this DataView.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Store.t Js.t] {% <p>The store</p> %}
    }
    }
    *)
  method getStoreListeners : 'a Js.t Js.meth
  (** {% <p>Gets the listeners to bind to a new store.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The listeners to be bound to the store in object literal form. The scope
may be omitted, it is assumed to be the current instance.</p> %}
    }
    }
    *)
  method indexOf : 'a Js.t -> Js.number Js.t Js.meth
  (** {% <p>Finds the index of the passed node.</p> %}
    
    {b Parameters}:
    {ul {- nodeInfo: ['a Js.t]
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
  (** {% <p>private</p>

<p>The initComponent template method is an important initialization step for a Component. It is intended to be
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

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', {
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() {
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    }
});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() {
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
});
</code></pre> %}
    *)
  method isSelected : 'a Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed node is selected, else false.</p> %}
    
    {b Parameters}:
    {ul {- node: ['a Js.t]
    {% <p>The node, node index or record to check</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if selected, else false</p> %}
    }
    }
    *)
  method onBindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  (** {% <p>Template method, it is called when a new store is bound
to the current instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store being bound</p> %}
    }
    {- initial: [bool Js.t]
    {% <p>True if this store is being bound as initialization of the instance.</p> %}
    }
    }
    *)
  method onDestroy : unit Js.meth
  (** {% <p>Allows addition of behavior to the destroy operation.
After calling the superclass’s onDestroy, the Component will be destroyed.</p> %}
    *)
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Template method called when this Component's DOM structure is created.</p>

<p>At this point, this Component's (and all descendants') DOM structure <em>exists</em> but it has not
been layed out (positioned and sized).</p>

<p>Subclasses which override this to gain access to the structure at render time should
call the parent class's method before attempting to access any child elements of the Component.</p> %}
    
    {b Parameters}:
    {ul {- parentNode: [Ext_dom_Element.t Js.t]
    {% <p>The parent Element in which this Component's encapsulating element is contained.</p> %}
    }
    {- containerIdx: [Js.number Js.t]
    {% <p>The index within the parent Container's child collection of this Component.</p> %}
    }
    }
    *)
  method onUnbindStore : #Ext_data_AbstractStore.t Js.t -> bool Js.t -> unit
    Js.meth
  (** {% <p>Template method, it is called when an existing store is unbound
from the current instance.</p> %}
    
    {b Parameters}:
    {ul {- store: [#Ext_data_AbstractStore.t Js.t]
    {% <p>The store being unbound</p> %}
    }
    {- initial: [bool Js.t]
    {% <p>True if this store is being bound as initialization of the instance.</p> %}
    }
    }
    *)
  method prepareData : 'a Js.t -> Js.number Js.t -> Ext_data_Model.t Js.t ->
    'b Js.t Js.meth
  (** {% <p>Function which can be overridden to provide custom formatting for each Record that is used by this
DataView's <a href="#!/api/Ext.view.AbstractView-cfg-tpl" rel="Ext.view.AbstractView-cfg-tpl" class="docClass">template</a> to render each node.</p> %}
    
    {b Parameters}:
    {ul {- data: ['a Js.t]
    {% <p>The raw data object that was used to create the Record.</p> %}
    }
    {- recordIndex: [Js.number Js.t]
    {% <p>the index number of the Record being prepared for rendering.</p> %}
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The Record being prepared for rendering.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The formatted data in a format expected by the internal <a href="#!/api/Ext.view.AbstractView-cfg-tpl" rel="Ext.view.AbstractView-cfg-tpl" class="docClass">template</a>'s overwrite() method.
(either an array if your params are numeric (i.e. {0}) or an object (i.e. {foo: 'bar'}))</p> %}
    }
    }
    *)
  method refresh : unit Js.meth
  (** {% <p>Refreshes the view by reloading the data from the store and re-rendering the template.</p> %}
    *)
  method refreshNode : Js.number Js.t -> unit Js.meth
  (** {% <p>Refreshes an individual node's data from the store.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The item's data index in the store</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_util_Bindable.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onRender] *)
  method blockRefresh : bool Js.t Js.prop
  (** {% <p>Set this to true to ignore refresh events on the bound store. This is useful if
you wish to provide custom transition animations via a plugin</p> %}
    
    Defaults to: [false]
    *)
  method deferEmptyText : bool Js.t Js.prop
  (** {% <p>True to defer emptyText being applied until the store's first load.</p> %}
    
    Defaults to: [true]
    *)
  method deferInitialRefresh : bool Js.t Js.prop
  (** {% <p>Defaults to <code>true</code> to defer the initial refresh of the view.</p>


<p>This allows the View to execute its render and initial layout more quickly because the process will not be encumbered
by the expensive update of the view structure.</p>


<p><b>Important: </b>Be aware that this will mean that the View's item elements will not be available immediately upon render, so
<i>selection</i> may not take place at render time. To access a View's item elements as soon as possible, use the <a href="#!/api/Ext.view.AbstractView-event-viewready" rel="Ext.view.AbstractView-event-viewready" class="docClass">viewready</a> event.
Or set <code>deferInitialrefresh</code> to false, but this will be at the cost of slower rendering.</p> %}
    
    Defaults to: [true]
    *)
  method disableSelection : bool Js.t Js.prop
  (** {% <p>True to disable selection within the DataView. This configuration will lock the selection model
that the DataView uses.</p> %}
    *)
  method emptyText : Js.js_string Js.t Js.prop
  (** {% <p>The text to display in the view when there is no data to display.
Note that when using local data the emptyText will not be displayed unless you set
the <a href="#!/api/Ext.view.AbstractView-cfg-deferEmptyText" rel="Ext.view.AbstractView-cfg-deferEmptyText" class="docClass">deferEmptyText</a> option to false.</p> %}
    
    Defaults to: [""]
    *)
  method itemCls : Js.js_string Js.t Js.prop
  (** {% <p>Specifies the class to be assigned to each element in the view when used in conjunction with the
<a href="#!/api/Ext.view.AbstractView-cfg-itemTpl" rel="Ext.view.AbstractView-cfg-itemTpl" class="docClass">itemTpl</a> configuration.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'dataview-item']
    *)
  method itemSelector : Js.js_string Js.t Js.prop
  (** {% <p><b>This is a required setting</b>. A simple CSS selector (e.g. <tt>div.some-class</tt> or
<tt>span:first-child</tt>) that will be used to determine what nodes this DataView will be
working with. The itemSelector is used to map DOM nodes to records. As such, there should
only be one root level element that matches the selector for each record.</p> %}
    *)
  method itemTpl : 'a Js.t Js.prop
  (** {% <p>The inner portion of the item template to be rendered. Follows an XTemplate
structure and will be placed inside of a tpl.</p> %}
    *)
  method loadMask : 'a Js.t Js.prop
  (** {% <p>False to disable a load mask from displaying while the view is loading. This can also be a
<a href="#!/api/Ext.LoadMask" rel="Ext.LoadMask" class="docClass">Ext.LoadMask</a> configuration object.</p> %}
    
    Defaults to: [true]
    *)
  method loadingCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to the loading message element. Defaults to Ext.LoadMask.prototype.msgCls "x-mask-loading".</p> %}
    *)
  method loadingHeight : Js.number Js.t Js.prop
  (** {% <p>If specified, gives an explicit height for the data view when it is showing the <a href="#!/api/Ext.view.AbstractView-cfg-loadingText" rel="Ext.view.AbstractView-cfg-loadingText" class="docClass">loadingText</a>,
if that is specified. This is useful to prevent the view's height from collapsing to zero when the
loading mask is applied and there are no other contents in the data view.</p> %}
    *)
  method loadingText : Js.js_string Js.t Js.prop
  (** {% <p>A string to display during data load operations.  If specified, this text will be
displayed in a loading div and the view's contents will be cleared while loading, otherwise the view's
contents will continue to display normally until the new data is loaded and the contents are replaced.</p> %}
    
    Defaults to: ['Loading...']
    *)
  method overItemCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to apply to each item in the view on mouseover.
Setting this will automatically set <a href="#!/api/Ext.view.AbstractView-cfg-trackOver" rel="Ext.view.AbstractView-cfg-trackOver" class="docClass">trackOver</a> to <code>true</code>.</p> %}
    *)
  method preserveScrollOnRefresh : bool Js.t Js.prop
  (** {% <p>=false
True to preserve scroll position across refresh operations.</p> %}
    
    Defaults to: [false]
    *)
  method selectedItemCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class to apply to each selected item in the view.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'item-selected']
    *)
  method singleSelect : bool Js.t Js.prop
  (** {% <p>Allows selection of exactly one item at a time. As this is the default selection mode anyway, this config
is completely ignored.</p> %}
    *)
  method store : Ext_data_Store.t Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> to bind this DataView to.</p> %}
    *)
  method tpl : 'a Js.t Js.prop
  (** {% <p>The HTML fragment or an array of fragments that will make up the template used by this DataView.  This should
be specified in the same format expected by the constructor of <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a>.</p> %}
    *)
  method trackOver : bool Js.t Js.prop
  (** {% <p>When <code>true</code> the <a href="#!/api/Ext.view.AbstractView-cfg-overItemCls" rel="Ext.view.AbstractView-cfg-overItemCls" class="docClass">overItemCls</a> will be applied to rows when hovered over.
This in return will also cause <a href="#!/api/Ext.view.View-event-highlightitem" rel="Ext.view.View-event-highlightitem" class="docClass">highlightitem</a> and
<a href="#!/api/Ext.view.View-event-unhighlightitem" rel="Ext.view.View-event-unhighlightitem" class="docClass">unhighlightitem</a> events to be fired.</p>

<p>Enabled automatically when the <a href="#!/api/Ext.view.AbstractView-cfg-overItemCls" rel="Ext.view.AbstractView-cfg-overItemCls" class="docClass">overItemCls</a> config is set.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_util_Bindable.events
  
  method beforerefresh : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before the view is refreshed</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    {% <p>The DataView object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemadd : (Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t ->
    Dom_html.element Js.t Js.js_array Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the nodes associated with an recordset have been added to the underlying store</p> %}
    
    {b Parameters}:
    {ul {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The model instance</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index at which the set of record/nodes starts</p> %}
    }
    {- node: [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>The node that has just been updated</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemremove : (Ext_data_Model.t Js.t -> Js.number Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the node associated with an individual record is removed</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The model instance</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index of the record/node</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemupdate : (Ext_data_Model.t Js.t -> Js.number Js.t ->
    Dom_html.element Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the node associated with an individual record is updated</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The model instance</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index of the record/node</p> %}
    }
    {- node: [Dom_html.element Js.t]
    {% <p>The node that has just been updated</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method refresh : (t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the view is refreshed</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    {% <p>The DataView object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method viewready : (t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the View's item elements representing Store items has been rendered. If the <a href="#!/api/Ext.view.AbstractView-cfg-deferInitialRefresh" rel="Ext.view.AbstractView-cfg-deferInitialRefresh" class="docClass">deferInitialRefresh</a> flag
was set (and it is <code>true</code> by default), this will be <b>after</b> initial render, and no items will be available
for selection until this event fires.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
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
  inherit Ext_util_Bindable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

