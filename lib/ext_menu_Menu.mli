(** A menu object. This is the container to which you ...
  
  {% <p>A menu object. This is the container to which you may add <a href="#!/api/Ext.menu.Item" rel="Ext.menu.Item" class="docClass">menu items</a>.</p>

<p>Menus may contain either <a href="#!/api/Ext.menu.Item" rel="Ext.menu.Item" class="docClass">menu items</a>, or general <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Components</a>.
Menus may also contain <a href="#!/api/Ext.panel.AbstractPanel-cfg-dockedItems" rel="Ext.panel.AbstractPanel-cfg-dockedItems" class="docClass">docked items</a> because it extends <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>.</p>

<p>To make a contained general <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a> line up with other <a href="#!/api/Ext.menu.Item" rel="Ext.menu.Item" class="docClass">menu items</a>,
specify <code><a href="#!/api/Ext.menu.Item-cfg-plain" rel="Ext.menu.Item-cfg-plain" class="docClass">plain</a>: true</code>. This reserves a space for an icon, and indents the Component
in line with the other menu items.</p>

<p>By default, Menus are absolutely positioned, floating Components. By configuring a Menu with <code><a href="#!/api/Ext.menu.Menu-cfg-floating" rel="Ext.menu.Menu-cfg-floating" class="docClass">floating</a>: false</code>,
a Menu may be used as a child of a <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>.</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Ext.menu.Menu</a>', {
    width: 100,
    margin: '0 0 10 0',
    floating: false,  // usually you want this set to True (default)
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),  // usually rendered by it's containing component
    items: [{
        text: 'regular item 1'
    },{
        text: 'regular item 2'
    },{
        text: 'regular item 3'
    }]
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Ext.menu.Menu</a>', {
    width: 100,
    plain: true,
    floating: false,  // usually you want this set to True (default)
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),  // usually rendered by it's containing component
    items: [{
        text: 'plain item 1'
    },{
        text: 'plain item 2'
    },{
        text: 'plain item 3'
    }]
});
</code></pre> %}
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
  
  method isMenu : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Menu, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method parentMenu : 'self Js.t Js.prop
  (** {% <p>The parent Menu of this Menu.</p> %}
    *)
  method afterComponentLayout : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Called by the layout system after the Component has been layed out.</p> %}
    
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
  method canActivateItem : 'a Js.t -> bool Js.t Js.meth
  (** {% <p>Returns whether a menu item can be activated or not.</p> %}
    
    {b Parameters}:
    {ul {- item: ['a Js.t]
    }
    }
    *)
  method deactivateActiveItem : 'a Js.t -> unit Js.meth
  (** {% <p>Deactivates the current active item on the menu, if one exists.</p> %}
    
    {b Parameters}:
    {ul {- andBlurFocusedItem: ['a Js.t]
    }
    }
    *)
  method getBubbleTarget_container : #Ext_container_Container.t Js.t Js.meth
  (** {% <p>Provides the link for Observable's fireEvent method to bubble up the ownership hierarchy.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_container_Container.t Js.t]
    {% <p>the Container which owns this Component.</p> %}
    }
    }
    *)
  method hide_menu : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>inherit docs</p>

<p>Hides this Component, setting it to invisible using the configured <a href="#!/api/Ext.menu.Menu-cfg-hideMode" rel="Ext.menu.Menu-cfg-hideMode" class="docClass">hideMode</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: ['a Js.t]
    {% <p><strong>only valid for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components
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
  method onDestroy : unit Js.meth
  (** {% <p>Allows addition of behavior to the destroy operation.
After calling the superclass’s onDestroy, the Component will be destroyed.</p> %}
    *)
  method show_menu : 'a Js.t Js.optdef -> 'b Js.callback Js.optdef ->
    'c Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Shows this Component, rendering it first if <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">autoRender</a> or <a href="#!/api/Ext.menu.Menu-cfg-floating" rel="Ext.menu.Menu-cfg-floating" class="docClass">floating</a> are <code>true</code>.</p>

<p>After being shown, a <a href="#!/api/Ext.menu.Menu-cfg-floating" rel="Ext.menu.Menu-cfg-floating" class="docClass">floating</a> Component (such as a <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>), is activated it and
brought to the front of its <a href="#!/api/Ext.menu.Menu-property-zIndexManager" rel="Ext.menu.Menu-property-zIndexManager" class="docClass">z-index stack</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: ['a Js.t]
    {% <p><strong>only valid for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have been configured
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
  method showBy : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Shows the floating menu by the specified <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a> or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Element</a>.</p> %}
    
    {b Parameters}:
    {ul {- component: ['a Js.t]
    {% <p>The <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> to show the menu by.</p> %}
    }
    {- position: [Js.js_string Js.t]
    {% <p>Alignment position as used by <a href="#!/api/Ext.dom.Element-method-getAlignToXY" rel="Ext.dom.Element-method-getAlignToXY" class="docClass">Ext.Element.getAlignToXY</a>.
Defaults to <code><a href="#!/api/Ext.menu.Menu-cfg-defaultAlign" rel="Ext.menu.Menu-cfg-defaultAlign" class="docClass">defaultAlign</a></code>.</p> %}
    }
    {- offsets: [Js.number Js.t Js.js_array Js.t]
    {% <p>Alignment offsets as used by <a href="#!/api/Ext.dom.Element-method-getAlignToXY" rel="Ext.dom.Element-method-getAlignToXY" class="docClass">Ext.Element.getAlignToXY</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_menu_Menu.t Js.t] {% <p>This Menu.</p> %}
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
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  
  method afterComponentLayout : ('self Js.t, Js.number Js.t -> Js.number Js.t
    -> Js.number Js.t -> Js.number Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterComponentLayout] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method allowOtherMenus : bool Js.t Js.prop
  (** {% <p>True to allow multiple menus to be displayed at the same time.</p> %}
    
    Defaults to: [false]
    *)
  method defaultAlign : Js.js_string Js.t Js.prop
  (** {% <p>The default <a href="#!/api/Ext.dom.Element-method-getAlignToXY" rel="Ext.dom.Element-method-getAlignToXY" class="docClass">Ext.Element#getAlignToXY</a> anchor position value for this menu
relative to its element of origin.</p> %}
    
    Defaults to: ["tl-bl?"]
    *)
  method enableKeyNav : bool Js.t Js.prop
  (** {% <p>True to enable keyboard navigation for controlling the menu.
This option should generally be disabled when form fields are
being used inside the menu.</p> %}
    
    Defaults to: [true]
    *)
  method floating : bool Js.t Js.prop
  (** {% <p>A Menu configured as <code>floating: true</code> (the default) will be rendered as an absolutely positioned,
<a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a>. If configured as <code>floating: false</code>, the Menu may be
used as a child item of another <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a>.</p> %}
    
    Defaults to: [true]
    *)
  method hidden : bool Js.t Js.prop
  (** {% <p>True to initially render the Menu as hidden, requiring to be shown manually.</p>

<p>Defaults to <code>true</code> when <code>floating: true</code>, and defaults to <code>false</code> when <code>floating: false</code>.</p> %}
    
    Defaults to: [undefined]
    *)
  method hideMode : Js.js_string Js.t Js.prop
  (** {% <p>A String which specifies how this Component's encapsulating DOM element will be hidden. Values may be:</p>

<ul>
<li><code>'display'</code> : The Component will be hidden using the <code>display: none</code> style.</li>
<li><code>'visibility'</code> : The Component will be hidden using the <code>visibility: hidden</code> style.</li>
<li><code>'offsets'</code> : The Component will be hidden by absolutely positioning it out of the visible area of the document.
This is useful when a hidden Component must maintain measurable dimensions. Hiding using <code>display</code> results in a
Component having zero dimensions.</li>
</ul> %}
    
    Defaults to: ['visibility']
    *)
  method ignoreParentClicks : bool Js.t Js.prop
  (** {% <p>True to ignore clicks on any item in this menu that is a parent item (displays a submenu)
so that the submenu is not dismissed when clicking the parent item.</p> %}
    
    Defaults to: [false]
    *)
  method minWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum width of the Menu. The default minWidth only applies when the <a href="#!/api/Ext.menu.Menu-cfg-floating" rel="Ext.menu.Menu-cfg-floating" class="docClass">floating</a> config is true.</p> %}
    
    Defaults to: [120]
    *)
  method plain : bool Js.t Js.prop
  (** {% <p>True to remove the incised line down the left side of the menu and to not indent general Component items.</p> %}
    
    Defaults to: [false]
    *)
  method showSeparator : bool Js.t Js.prop
  (** {% <p>True to show the icon separator.</p> %}
    
    Defaults to: [true]
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
  
  method click : (t Js.t -> #Ext_Component.t Js.t -> Ext_EventObject.t Js.t
    -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when this menu is clicked</p> %}
    
    {b Parameters}:
    {ul {- menu: [Ext_menu_Menu.t Js.t]
    {% <p>The menu which has been clicked</p> %}
    }
    {- item: [#Ext_Component.t Js.t]
    {% <p>The menu item that was clicked. <code>undefined</code> if not applicable.</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The underlying <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a>.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseenter : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse enters this menu</p> %}
    
    {b Parameters}:
    {ul {- menu: [Ext_menu_Menu.t Js.t]
    {% <p>The menu</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The underlying <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a></p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseleave : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse leaves this menu</p> %}
    
    {b Parameters}:
    {ul {- menu: [Ext_menu_Menu.t Js.t]
    {% <p>The menu</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The underlying <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a></p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseover : (t Js.t -> #Ext_Component.t Js.t ->
    Ext_EventObject.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse is hovering over this menu</p> %}
    
    {b Parameters}:
    {ul {- menu: [Ext_menu_Menu.t Js.t]
    {% <p>The menu</p> %}
    }
    {- item: [#Ext_Component.t Js.t]
    {% <p>The menu item that the mouse is over. <code>undefined</code> if not applicable.</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The underlying <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a></p> %}
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

