(** This class specifies the definition for a column i ...
  
  {% <p>This class specifies the definition for a column inside a <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>. It encompasses
both the grid header configuration as well as displaying data within the grid itself. If the
<a href="#!/api/Ext.grid.column.Column-cfg-columns" rel="Ext.grid.column.Column-cfg-columns" class="docClass">columns</a> configuration is specified, this column will become a column group and can
contain other columns inside. In general, this class will not be created directly, rather
an array of column configurations will be passed to the grid:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    storeId:'employeeStore',
    fields:['firstname', 'lastname', 'seniority', 'dep', 'hired'],
    data:[
        {firstname:"Michael", lastname:"Scott", seniority:7, dep:"Management", hired:"01/10/2004"},
        {firstname:"Dwight", lastname:"Schrute", seniority:2, dep:"Sales", hired:"04/01/2004"},
        {firstname:"Jim", lastname:"Halpert", seniority:3, dep:"Sales", hired:"02/22/2006"},
        {firstname:"Kevin", lastname:"Malone", seniority:4, dep:"Accounting", hired:"06/10/2007"},
        {firstname:"Angela", lastname:"Martin", seniority:5, dep:"Accounting", hired:"10/21/2008"}
    ]
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    title: 'Column Demo',
    store: <a href="#!/api/Ext.data.StoreManager-method-lookup" rel="Ext.data.StoreManager-method-lookup" class="docClass">Ext.data.StoreManager.lookup</a>('employeeStore'),
    columns: [
        {text: 'First Name',  dataIndex:'firstname'},
        {text: 'Last Name',  dataIndex:'lastname'},
        {text: 'Hired Month',  dataIndex:'hired', xtype:'datecolumn', format:'M'},
        {text: 'Department (Yrs)', xtype:'templatecolumn', tpl:'{dep} ({seniority})'}
    ],
    width: 400,
    forceFit: true,
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre>

<h1>Convenience Subclasses</h1>

<p>There are several column subclasses that provide default rendering for various data types</p>

<ul>
<li><a href="#!/api/Ext.grid.column.Action" rel="Ext.grid.column.Action" class="docClass">Ext.grid.column.Action</a>: Renders icons that can respond to click events inline</li>
<li><a href="#!/api/Ext.grid.column.Boolean" rel="Ext.grid.column.Boolean" class="docClass">Ext.grid.column.Boolean</a>: Renders for boolean values</li>
<li><a href="#!/api/Ext.grid.column.Date" rel="Ext.grid.column.Date" class="docClass">Ext.grid.column.Date</a>: Renders for date values</li>
<li><a href="#!/api/Ext.grid.column.Number" rel="Ext.grid.column.Number" class="docClass">Ext.grid.column.Number</a>: Renders for numeric values</li>
<li><a href="#!/api/Ext.grid.column.Template" rel="Ext.grid.column.Template" class="docClass">Ext.grid.column.Template</a>: Renders a value using an <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a> using the record data</li>
</ul>


<h1>Setting Sizes</h1>

<p>The columns are laid out by a <a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">Ext.layout.container.HBox</a> layout, so a column can either
be given an explicit width value or a flex configuration. If no width is specified the grid will
automatically the size the column to 100px. For column groups, the size is calculated by measuring
the width of the child columns, so a width option should not be specified in that case.</p>

<h1>Header Options</h1>

<ul>
<li><a href="#!/api/Ext.grid.column.Column-cfg-text" rel="Ext.grid.column.Column-cfg-text" class="docClass">text</a>: Sets the header text for the column</li>
<li><a href="#!/api/Ext.grid.column.Column-cfg-sortable" rel="Ext.grid.column.Column-cfg-sortable" class="docClass">sortable</a>: Specifies whether the column can be sorted by clicking the header or using the column menu</li>
<li><a href="#!/api/Ext.grid.column.Column-cfg-hideable" rel="Ext.grid.column.Column-cfg-hideable" class="docClass">hideable</a>: Specifies whether the column can be hidden using the column menu</li>
<li><a href="#!/api/Ext.grid.column.Column-cfg-menuDisabled" rel="Ext.grid.column.Column-cfg-menuDisabled" class="docClass">menuDisabled</a>: Disables the column header menu</li>
<li><a href="#!/api/Ext.grid.column.Column-cfg-draggable" rel="Ext.grid.column.Column-cfg-draggable" class="docClass">draggable</a>: Specifies whether the column header can be reordered by dragging</li>
<li><a href="#!/api/Ext.grid.column.Column-cfg-groupable" rel="Ext.grid.column.Column-cfg-groupable" class="docClass">groupable</a>: Specifies whether the grid can be grouped by the column dataIndex. See also <a href="#!/api/Ext.grid.feature.Grouping" rel="Ext.grid.feature.Grouping" class="docClass">Ext.grid.feature.Grouping</a></li>
</ul>


<h1>Data Options</h1>

<ul>
<li><a href="#!/api/Ext.grid.column.Column-cfg-dataIndex" rel="Ext.grid.column.Column-cfg-dataIndex" class="docClass">dataIndex</a>: The dataIndex is the field in the underlying <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> to use as the value for the column.</li>
<li><a href="#!/api/Ext.grid.column.Column-cfg-renderer" rel="Ext.grid.column.Column-cfg-renderer" class="docClass">renderer</a>: Allows the underlying store value to be transformed before being displayed in the grid</li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_grid_header_Container.t
  
  method isHeader : bool Js.t Js.prop
  (** {% <p>Set in this class to identify, at runtime, instances which are not instances of the
HeaderContainer base class, but are in fact, the subclass: Header.</p> %}
    
    Defaults to: [true]
    *)
  method textEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>Element that contains the text in column header.</p> %}
    *)
  method triggerEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>Element that acts as button for column header dropdown menu.</p> %}
    *)
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>private
Inform the header container about the resize</p>

<p>Called by the layout system after the Component has been layed out.</p> %}
    
    {b Parameters}:
    {ul {- width: [Js.number Js.t]
    {% <p>The width that was set</p> %}
    }
    {- height: [Js.number Js.t]
    {% <p>The height that was set</p> %}
    }
    {- oldWidth: [Js.number Js.t]
    {% <p>The old width. <code>undefined</code> if this was the initial layout.</p> %}
    }
    {- oldHeight: [Js.number Js.t]
    {% <p>The old height. <code>undefined</code> if this was the initial layout.</p> %}
    }
    }
    *)
  method afterRender : unit Js.meth
  (** {% <p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
    *)
  method defaultRenderer : unit Js.meth
  (** {% <p>When defined this will take precedence over the <a href="#!/api/Ext.grid.column.Column-cfg-renderer" rel="Ext.grid.column.Column-cfg-renderer" class="docClass">renderer</a> config.
This is meant to be defined in subclasses that wish to supply their own renderer.</p> %}
    *)
  method getEditor : 'a Js.t -> 'b Js.t -> Ext_form_field_Field.t Js.t
    Js.meth
  (** {% <p>Retrieves the editing field for editing associated with this header. Returns false if there is no field
associated with the Header the method will return false. If the field has not been instantiated it will be
created. Note: These methods only has an implementation if a Editing plugin has been enabled on the grid.</p> %}
    
    {b Parameters}:
    {ul {- record: ['a Js.t]
    {% <p>The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> instance being edited.</p> %}
    }
    {- defaultField: ['a Js.t]
    {% <p>An object representing a default field to be created</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_form_field_Field.t Js.t] {% <p>field</p> %}
    }
    }
    *)
  method getIndex : Js.number Js.t Js.meth
  (** {% <p>Returns the index of this column only if this column is a base level Column. If it
is a group column, it returns <code>false</code>.</p> %}
    *)
  method getSortParam : Js.js_string Js.t Js.meth
  (** {% <p>Returns the parameter to sort upon when sorting this header. By default this returns the dataIndex and will not
need to be overriden in most cases.</p> %}
    *)
  method getVisibleIndex : Js.number Js.t Js.meth
  (** {% <p>Returns the index of this column in the list of <em>visible</em> columns only if this column is a base level Column. If it
is a group column, it returns <code>false</code>.</p> %}
    *)
  method hide_column : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Hides this Component, setting it to invisible using the configured <a href="#!/api/Ext.grid.column.Column-cfg-hideMode" rel="Ext.grid.column.Column-cfg-hideMode" class="docClass">hideMode</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: ['a Js.t]
    {% <p><strong>only valid for <a href="#!/api/Ext.grid.column.Column-cfg-floating" rel="Ext.grid.column.Column-cfg-floating" class="docClass">floating</a> Components
such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have
been configured with <code>floating: true</code>.</strong>. The target to which the Component should animate while hiding.</p> %}
     Defaults to: null
    }
    {- callback: ['a Js.callback]
    {% <p>A callback function to call after the Component is hidden.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.
Defaults to this Component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
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
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>This method is invoked after a new Component has been added. It
is passed the Component which has been added. This method may
be used to update any internal structure which may depend upon
the state of the child items.</p> %}
    
    {b Parameters}:
    {ul {- component: [#Ext_Component.t Js.t]
    }
    {- position: [Js.number Js.t]
    }
    }
    *)
  method onDestroy : unit Js.meth
  (** {% <p>Allows addition of behavior to the destroy operation.
After calling the superclass’s onDestroy, the Component will be destroyed.</p> %}
    *)
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>This method is invoked after a new Component has been
removed. It is passed the Component which has been
removed. This method may be used to update any internal
structure which may depend upon the state of the child items.</p> %}
    
    {b Parameters}:
    {ul {- component: [#Ext_Component.t Js.t]
    }
    {- autoDestroy: [bool Js.t]
    }
    }
    *)
  method setEditor : 'a Js.t -> unit Js.meth
  (** {% <p>Sets the form field to be used for editing. Note: This method only has an implementation if an Editing plugin has
been enabled on the grid.</p> %}
    
    {b Parameters}:
    {ul {- field: ['a Js.t]
    {% <p>An object representing a field to be created. If no xtype is specified a 'textfield' is
assumed.</p> %}
    }
    }
    *)
  method setText : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Sets the header text for this Column.</p> %}
    
    {b Parameters}:
    {ul {- text: [Js.js_string Js.t]
    {% <p>The header to display on this Column.</p> %}
    }
    }
    *)
  method show_column : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Shows this Component, rendering it first if <a href="#!/api/Ext.grid.column.Column-cfg-autoRender" rel="Ext.grid.column.Column-cfg-autoRender" class="docClass">autoRender</a> or <a href="#!/api/Ext.grid.column.Column-cfg-floating" rel="Ext.grid.column.Column-cfg-floating" class="docClass">floating</a> are <code>true</code>.</p>

<p>After being shown, a <a href="#!/api/Ext.grid.column.Column-cfg-floating" rel="Ext.grid.column.Column-cfg-floating" class="docClass">floating</a> Component (such as a <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>), is activated it and
brought to the front of its <a href="#!/api/Ext.grid.column.Column-property-zIndexManager" rel="Ext.grid.column.Column-property-zIndexManager" class="docClass">z-index stack</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: ['a Js.t]
    {% <p><strong>only valid for <a href="#!/api/Ext.grid.column.Column-cfg-floating" rel="Ext.grid.column.Column-cfg-floating" class="docClass">floating</a> Components such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have been configured
with <code>floating: true</code>.</strong> The target from which the Component should animate from while opening.</p> %}
     Defaults to: null
    }
    {- callback: ['a Js.callback]
    {% <p>A callback function to call after the Component is displayed.
Only necessary if animation was specified.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the callback is executed.
Defaults to this Component.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_grid_header_Container.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterComponentLayout] *)
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
  method defaultRenderer : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.defaultRenderer] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onAdd : ('self Js.t, #Ext_Component.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onAdd] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method onRemove : ('self Js.t, #Ext_Component.t Js.t -> bool Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onRemove] *)
  method align : Js.js_string Js.t Js.prop
  (** {% <p>Sets the alignment of the header and rendered columns.
Possible values are: <code>'left'</code>, <code>'center'</code>, and <code>'right'</code>.</p> %}
    
    Defaults to: ['left']
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this components's element. This will also be prepended to elements within this
component like Panel's body will get a class x-panel-body. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the baseCls x-panel and use
componentCls to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'column-header ' + Ext.baseCSSPrefix + 'unselectable']
    *)
  method columns : 'a Js.t Js.js_array Js.t Js.prop
  (** {% <p>An optional array of sub-column definitions. This column becomes a group, and houses the columns defined in the
<code>columns</code> config.</p>

<p>Group columns may not be sortable. But they may be hideable and moveable. And you may move headers into and out
of a group. Note that if all sub columns are dragged out of a group, the group is destroyed.</p> %}
    *)
  method componentLayout_str : Js.js_string Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.grid.column.Column-method-setSize" rel="Ext.grid.column.Column-method-setSize" class="docClass">setSize</a> method.</p> %}
    
    Defaults to: ['columncomponent']
    *)
  method dataIndex : Js.js_string Js.t Js.prop
  (** {% <p>The name of the field in the grid's <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>'s <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> definition from
which to draw the column's value. <strong>Required.</strong></p> %}
    *)
  method draggable : bool Js.t Js.prop
  (** {% <p>False to disable drag-drop reordering of this column.</p> %}
    
    Defaults to: [true]
    *)
  method editRenderer : 'a Js.callback Js.prop
  (** {% <p>A renderer to be used in conjunction with <a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a>. This renderer is used to
display a custom value for non-editable fields.</p> %}
    
    Defaults to: [false]
    *)
  method editor : 'a Js.t Js.prop
  (** {% <p>An optional xtype or config object for a <a href="#!/api/Ext.form.field.Field" rel="Ext.form.field.Field" class="docClass">Field</a> to use for editing.
Only applicable if the grid is using an <a href="#!/api/Ext.grid.plugin.Editing" rel="Ext.grid.plugin.Editing" class="docClass">Editing</a> plugin.</p> %}
    *)
  method emptyCellText : Js.js_string Js.t Js.prop
  (** {% <p>The text to diplay in empty cells (cells with a value of <code>undefined</code>, <code>null</code>, or <code>''</code>).</p>

<p>Defaults to <code>&amp;#160;</code> aka <code>&amp;nbsp;</code>.</p> %}
    
    Defaults to: [undefined]
    *)
  method groupable : bool Js.t Js.prop
  (** {% <p>If the grid uses a <a href="#!/api/Ext.grid.feature.Grouping" rel="Ext.grid.feature.Grouping" class="docClass">Ext.grid.feature.Grouping</a>, this option may be used to disable the header menu
item to group by the column selected. By default, the header menu group option is enabled. Set to false to
disable (but still show) the group option in the header menu for the column.</p> %}
    *)
  method hideable : bool Js.t Js.prop
  (** {% <p>False to prevent the user from hiding this column.</p> %}
    
    Defaults to: [true]
    *)
  method locked : bool Js.t Js.prop
  (** {% <p>True to lock this column in place.  Implicitly enables locking on the grid.
See also <a href="#!/api/Ext.grid.Panel-cfg-enableLocking" rel="Ext.grid.Panel-cfg-enableLocking" class="docClass">Ext.grid.Panel.enableLocking</a>.</p> %}
    
    Defaults to: [false]
    *)
  method menuDisabled : bool Js.t Js.prop
  (** {% <p>True to disable the column header menu containing sort/hide options.</p> %}
    
    Defaults to: [false]
    *)
  method menuText : Js.js_string Js.t Js.prop
  (** {% <p>The text to render in the column visibility selection menu for this column.  If not
specified, will default to the text value.</p> %}
    *)
  method renderTpl_str : Js.js_string Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.grid.column.Column-method-getEl" rel="Ext.grid.column.Column-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.grid.column.Column-method-getEl" rel="Ext.grid.column.Column-method-getEl" class="docClass">Element</a> empty. The more specialized ExtJS and Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.grid.column.Column-cfg-renderSelectors" rel="Ext.grid.column.Column-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.grid.column.Column-cfg-childEls" rel="Ext.grid.column.Column-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    
    Defaults to: ['<div id="{id}-titleEl" {tipMarkup}class="' + Ext.baseCSSPrefix + 'column-header-inner">' + '<span id="{id}-textEl" class="' + Ext.baseCSSPrefix + 'column-header-text">' + '{text}' + '</span>' + '<tpl if="!menuDisabled">' + '<div id="{id}-triggerEl" class="' + Ext.baseCSSPrefix + 'column-header-trigger"></div>' + '</tpl>' + '</div>' + '{%this.renderContainer(out,values)%}']
    *)
  method renderer : 'a Js.t Js.prop
  (** {% <p>A renderer is an 'interceptor' method which can be used to transform data (value, appearance, etc.)
before it is rendered. Example:</p>

<pre><code>{
    renderer: function(value){
        if (value === 1) {
            return '1 person';
        }
        return value + ' people';
    }
}
</code></pre>

<p>Additionally a string naming an <a href="#!/api/Ext.util.Format" rel="Ext.util.Format" class="docClass">Ext.util.Format</a> method can be passed:</p>

<pre><code>{
    renderer: 'uppercase'
}
</code></pre> %}
    
    Defaults to: [false]
    *)
  method resizable_bool : bool Js.t Js.prop
  (** {% <p>False to prevent the column from being resizable.</p> %}
    
    Defaults to: [true]
    *)
  method scope : 'a Js.t Js.prop
  (** {% <p>The scope to use when calling the <a href="#!/api/Ext.grid.column.Column-cfg-renderer" rel="Ext.grid.column.Column-cfg-renderer" class="docClass">renderer</a> function.</p> %}
    *)
  method sortable : bool Js.t Js.prop
  (** {% <p>False to disable sorting of this column. Whether local/remote sorting is used is specified in
<code><a href="#!/api/Ext.data.Store-cfg-remoteSort" rel="Ext.data.Store-cfg-remoteSort" class="docClass">Ext.data.Store.remoteSort</a></code>.</p> %}
    
    Defaults to: [true]
    *)
  method stateId : Js.js_string Js.t Js.prop
  (** {% <p>An identifier which identifies this column uniquely within the owning grid's <a href="#!/api/Ext.grid.column.Column-cfg-stateful" rel="Ext.grid.column.Column-cfg-stateful" class="docClass">state</a>.</p>

<p>This does not have to be <em>globally</em> unique. A column's state is not saved standalone. It is encapsulated within
the owning grid's state.</p> %}
    *)
  method tdCls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class names to apply to the table cells for this column.</p> %}
    *)
  method text : Js.js_string Js.t Js.prop
  (** {% <p>The header text to be used as innerHTML (html tags are accepted) to display in the Grid.
<strong>Note</strong>: to have a clickable header with no text displayed you can use the default of <code>&amp;#160;</code> aka <code>&amp;nbsp;</code>.</p> %}
    
    Defaults to: ['&#160;']
    *)
  method tooltip : Js.js_string Js.t Js.prop
  (** {% <p>A tooltip to display for this column header</p> %}
    *)
  method tooltipType : Js.js_string Js.t Js.prop
  (** {% <p>The type of <a href="#!/api/Ext.grid.column.Column-cfg-tooltip" rel="Ext.grid.column.Column-cfg-tooltip" class="docClass">tooltip</a> to use. Either 'qtip' for QuickTips or 'title' for title attribute.</p> %}
    
    Defaults to: ["qtip"]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_grid_header_Container.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_grid_header_Container.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

