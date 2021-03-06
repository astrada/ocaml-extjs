(** Container which holds headers and is docked at the ...
  
  {% <p>Container which holds headers and is docked at the top or bottom of a TablePanel.
The HeaderContainer drives resizing/moving/hiding of columns within the TableView.
As headers are hidden, moved or resized the headercontainer is responsible for
triggering changes within the view.</p> %}
  *)

class type t =
object('self)
  inherit Ext_container_Container.t
  
  method isGroupHeader : bool Js.t Js.prop
  (** {% <p>True if this HeaderContainer is in fact a group header which contains sub headers.</p> %}
    *)
  method getColumnCount : unit Js.meth
  (** {% <p>Returns the number of <b>grid columns</b> descended from this HeaderContainer.
Group Columns are HeaderContainers. All grid columns are returned, including hidden ones.</p> %}
    *)
  method getColumnMenu : _ Js.t -> unit Js.meth
  (** {% <p>Returns an array of menu CheckItems corresponding to all immediate children
of the passed Container which have been configured as hideable.</p> %}
    
    {b Parameters}:
    {ul {- headerContainer: [_ Js.t]
    }
    }
    *)
  method getFullWidth : unit Js.meth
  (** {% <p>Gets the full width of all columns that are visible.</p> %}
    *)
  method getGridColumns : _ Js.t -> _ Js.t -> _ Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of all columns which appear in the grid's View. This goes down to the leaf column header
level, and does not return <strong>grouped</strong> headers which contain sub headers.</p>

<p>It includes hidden headers even though they are not rendered. This is for collection of menu items for the column hide/show menu.</p>

<p>Headers which have a hidden ancestor have a <code>hiddenAncestor: true</code> property injected so that they can also be rendered at zero width without interrogating
that header's ownerCt axis for a hidden ancestor.</p> %}
    
    {b Parameters}:
    {ul {- inResult: [_ Js.t]
    }
    {- hiddenAncestor: [_ Js.t]
    }
    }
    *)
  method getHeaderAtIndex : Js.number Js.t -> unit Js.meth
  (** {% <p>Get a leaf level header by index regardless of what the nesting
structure is.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The column index for which to retrieve the column.</p> %}
    }
    }
    *)
  method getHeaderIndex : 'self Js.t -> Js.number Js.t Js.meth
  (** {% <p>Returns the index of a leaf level header regardless of what the nesting
structure is.</p>

<p>If a group header is passed, the index of the first leaf level header within it is returned.</p> %}
    
    {b Parameters}:
    {ul {- header: [Ext_grid_column_Column.t Js.t]
    {% <p>The header to find the index of</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The index of the specified column header</p> %}
    }
    }
    *)
  method getMenuItems : _ Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of menu items to be placed into the shared menu
across all headers in this header container.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.js_array Js.t] {% <p>menuItems</p> %}
    }
    }
    *)
  method getVisibleGridColumns : _ Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of the <strong>visible</strong> columns in the grid. This goes down to the lowest column header
level, and does not return <strong>grouped</strong> headers which contain sub headers.</p> %}
    *)
  method getVisibleHeaderClosestToIndex : Js.number Js.t -> unit Js.meth
  (** {% <p>When passed a column index, returns the closet <em>visible</em> column to that. If the column at the passed index is visible,
that is returned. If it is hidden, either the next visible, or the previous visible column is returned.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>Position at which to find the closest visible column.</p> %}
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
  method isLayoutRoot : unit Js.meth
  (** {% <p>Determines whether this Component is the root of a layout. This returns <code>true</code> if
this component can run its layout without assistance from or impact on its owner.
If this component cannot run its layout given these restrictions, <code>false</code> is returned
and its owner will be considered as the next candidate for the layout root.</p>

<p>Setting the <a href="#!/api/Ext.grid.header.Container-property-_isLayoutRoot" rel="Ext.grid.header.Container-property-_isLayoutRoot" class="docClass">_isLayoutRoot</a> property to <code>true</code> causes this method to always
return <code>true</code>. This may be useful when updating a layout of a Container which shrink
wraps content, and you know that it will not change size, and so can safely be the
topmost participant in the layout run.</p> %}
    *)
  method onAdd : #Ext_Component.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Invalidate column cache on add
We cannot refresh the View on every add because this method is called
when the HeaderDropZone moves Headers around, that will also refresh the view</p>

<p>This method is invoked after a new Component has been added. It
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
After calling the superclass's onDestroy, the Component will be destroyed.</p> %}
    *)
  method onRemove : #Ext_Component.t Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>Invalidate column cache on remove
We cannot refresh the View on every remove because this method is called
when the HeaderDropZone moves Headers around, that will also refresh the view</p>

<p>This method is invoked after a new Component has been
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
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.grid.header.Container-method-show" rel="Ext.grid.header.Container-method-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_container_Container.configs
  
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this component's element. This will also be prepended to elements within this
component like Panel's body will get a class <code>x-panel-body</code>. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the <code>baseCls</code> <code>x-panel</code> and use
<code>componentCls</code> to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'grid-header-ct']
    *)
  method border : _ Js.t Js.prop
  (** {% <p>Specifies the border size for this component. The border can be a single numeric value to apply to all sides or it can
be a CSS style specification for each style, for example: '10 5 3 10' (top, right, bottom, left).</p>

<p>For components that have no border by default, setting this won't make the border appear by itself.
You also need to specify border color and style:</p>

<pre><code>border: 5,
style: \{
    borderColor: 'red',
    borderStyle: 'solid'
\}
</code></pre>

<p>To turn off the border, use <code>border: false</code>.</p> %}
    
    Defaults to: [true]
    *)
  method defaultType : Js.js_string Js.t Js.prop
  (** {% <p>The default <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">xtype</a> of child Components to create in this Container when
a child item is specified as a raw configuration object, rather than as an instantiated Component.</p> %}
    
    Defaults to: ['gridcolumn']
    *)
  method defaultWidth : Js.number Js.t Js.prop
  (** {% <p>Width of the header if no width or flex is specified.</p> %}
    
    Defaults to: [100]
    *)
  method detachOnRemove : bool Js.t Js.prop
  (** {% <p>True to move any component to the <a href="#!/api/Ext-method-getDetachedBody" rel="Ext-method-getDetachedBody" class="docClass">detachedBody</a> when the component is
removed from this container. This option is only applicable when the component is not destroyed while
being removed, see <a href="#!/api/Ext.grid.header.Container-cfg-autoDestroy" rel="Ext.grid.header.Container-cfg-autoDestroy" class="docClass">autoDestroy</a> and <a href="#!/api/Ext.grid.header.Container-method-remove" rel="Ext.grid.header.Container-method-remove" class="docClass">remove</a>. If this option is set to false, the DOM
of the component will remain in the current place until it is explicitly moved.</p> %}
    
    Defaults to: [false]
    *)
  method enableColumnHide : bool Js.t Js.prop
  (** {% <p>False to disable column hiding within this grid.</p> %}
    
    Defaults to: [true]
    *)
  method sealed : bool Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to constrain column dragging so that a column cannot be dragged into or out of this column.</p>

<p><strong>Note that this config is only valid for column headers which contain child column headers, eg:</strong>
    \{
        sealed: true
        text: 'ExtJS',
        columns: [\{
            text: '3.0.4',
            dataIndex: 'ext304'
        \}, \{
            text: '4.1.0',
            dataIndex: 'ext410'
        \}
    \}</p> %}
    
    Defaults to: [false]
    *)
  method sortable : bool Js.t Js.prop
  (** {% <p>Provides the default sortable state for all Headers within this HeaderContainer.
Also turns on or off the menus in the HeaderContainer. Note that the menu is
shared across every header and therefore turning it off will remove the menu
items for every header.</p> %}
    
    Defaults to: [true]
    *)
  method weight : Js.number Js.t Js.prop
  (** {% <p>HeaderContainer overrides the default weight of 0 for all docked items to 100.
This is so that it has more priority over things like toolbars.</p> %}
    
    Defaults to: [100]
    *)
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
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  
end

class type events =
object
  inherit Ext_container_Container.events
  
  method columnhide : (t Js.t -> t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method columnmove : (t Js.t -> t Js.t -> Js.number Js.t -> Js.number Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method columnresize : (t Js.t -> t Js.t -> Js.number Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  method columnschanged : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
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
  method columnshow : (t Js.t -> t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  method headerclick : (t Js.t -> t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headercontextmenu : (t Js.t -> t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method headertriggerclick : (t Js.t -> t Js.t -> Ext_EventObject.t Js.t ->
    Dom_html.element Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  method menucreate : (t Js.t -> Ext_menu_Menu.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired immediately after the column header menu is created.</p> %}
    
    {b Parameters}:
    {ul {- ct: [Ext_grid_header_Container.t Js.t]
    {% <p>This instance</p> %}
    }
    {- menu: [Ext_menu_Menu.t Js.t]
    {% <p>The Menu that was created</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method sortchange : (t Js.t -> t Js.t -> Js.js_string Js.t -> _ Js.t ->
    unit) Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_container_Container.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

