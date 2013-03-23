(** A base class which provides methods common to Pane ...
  
  {% <p>A base class which provides methods common to Panel classes across the Sencha product range.</p>

<p>Please refer to sub class's documentation</p> %}
  *)

class type t =
object('self)
  inherit Ext_container_DockingContainer.t
  inherit Ext_container_Container.t
  
  method addBodyCls : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds a CSS class to the body element. If not rendered, the class will
be added when the panel is rendered.</p> %}
    
    {b Parameters}:
    {ul {- cls: [Js.js_string Js.t]
    {% <p>The class to add</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_panel_Panel.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method addUIClsToElement : Js.js_string Js.t -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Method which adds a specified UI + <code>uiCls</code> to the components element. Can be overridden to remove the UI from more
than just the components element.</p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The UI to remove from the element.</p> %}
    }
    }
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>Invoked before the Component is destroyed.</p> %}
    *)
  method getComponent : _ Js.t -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Attempts a default component lookup (see <a href="#!/api/Ext.container.Container-method-getComponent" rel="Ext.container.Container-method-getComponent" class="docClass">Ext.container.Container.getComponent</a>). If the component is not found in the normal
items, the dockedItems are searched and the matched component (if any) returned (see <a href="#!/api/Ext.panel.AbstractPanel-method-getDockedComponent" rel="Ext.panel.AbstractPanel-method-getDockedComponent" class="docClass">getDockedComponent</a>). Note that docked
items will only be matched by component id or itemId -- if you pass a numeric index only non-docked child components will be searched.</p> %}
    
    {b Parameters}:
    {ul {- comp: [_ Js.t]
    {% <p>The component id, itemId or position to find</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t] {% <p>The component (if found)</p> %}
    }
    }
    *)
  method getRefItems : _ Js.t -> unit Js.meth
  (** {% <p>Used by <a href="#!/api/Ext.ComponentQuery" rel="Ext.ComponentQuery" class="docClass">ComponentQuery</a>, <a href="#!/api/Ext.panel.AbstractPanel-method-child" rel="Ext.panel.AbstractPanel-method-child" class="docClass">child</a> and <a href="#!/api/Ext.panel.AbstractPanel-method-down" rel="Ext.panel.AbstractPanel-method-down" class="docClass">down</a> to retrieve all of the items
which can potentially be considered a child of this Container.</p>

<p>This may be overriden by Components which have ownership of Components
that are not contained in the <a href="#!/api/Ext.panel.AbstractPanel-property-items" rel="Ext.panel.AbstractPanel-property-items" class="docClass">items</a> collection.</p>

<p>NOTE: IMPORTANT note for maintainers:
Items are returned in tree traversal order. Each item is appended to the result array
followed by the results of that child's getRefItems call.
Floating child items are appended after internal child items.</p> %}
    
    {b Parameters}:
    {ul {- deep: [_ Js.t]
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
  method removeBodyCls : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Removes a CSS class from the body element.</p> %}
    
    {b Parameters}:
    {ul {- cls: [Js.js_string Js.t]
    {% <p>The class to remove</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_panel_Panel.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method removeUIClsFromElement : Js.js_string Js.t -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Method which removes a specified UI + <code>uiCls</code> from the components element. The <code>cls</code> which is added to the element
will be: <code>this.baseCls + '-' + ui</code>.</p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The UI to add to the element.</p> %}
    }
    }
    *)
  method setBodyStyle : _ Js.t -> Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the body style according to the passed parameters.</p> %}
    
    {b Parameters}:
    {ul {- style: [_ Js.t]
    {% <p>A full style specification string, or object, or the name of a style property to set.</p> %}
    }
    {- value: [Js.js_string Js.t]
    {% <p>If the first param was a style property name, the style property value.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_panel_Panel.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method body : Ext_dom_Element.t Js.t Js.readonly_prop
  (** {% <p>The Panel's body <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Element</a> which may be used to contain HTML content.
The content may be specified in the <a href="#!/api/Ext.panel.AbstractPanel-cfg-html" rel="Ext.panel.AbstractPanel-cfg-html" class="docClass">html</a> config, or it may be loaded using the
<a href="#!/api/Ext.panel.AbstractPanel-cfg-loader" rel="Ext.panel.AbstractPanel-cfg-loader" class="docClass">loader</a> config. Read-only.</p>

<p>If this is used to load visible HTML elements in either way, then
the Panel may not be used as a Layout for hosting nested Panels.</p>

<p>If this Panel is intended to be used as the host of a Layout (See <a href="#!/api/Ext.panel.AbstractPanel-cfg-layout" rel="Ext.panel.AbstractPanel-cfg-layout" class="docClass">layout</a>
then the body Element must not be loaded or changed - it is under the control
of the Panel's Layout.</p> %}
    *)
  method contentPaddingProperty : Js.js_string Js.t Js.prop
  (** {% <p>The name of the padding property that is used by the layout to manage
padding.  See <a href="#!/api/Ext.layout.container.Auto-property-managePadding" rel="Ext.layout.container.Auto-property-managePadding" class="docClass">managePadding</a></p> %}
    
    Defaults to: ['bodyPadding']
    *)
  method isPanel : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Panel, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type configs =
object('self)
  inherit Ext_container_DockingContainer.configs
  inherit Ext_container_Container.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this panel's element.</p> %}
    
    Defaults to: [x-panel]
    *)
  method bodyBorder : bool Js.t Js.prop
  (** {% <p>A shortcut to add or remove the border on the body of a panel. In the classic theme
this only applies to a panel which has the <a href="#!/api/Ext.panel.AbstractPanel-cfg-frame" rel="Ext.panel.AbstractPanel-cfg-frame" class="docClass">frame</a> configuration set to <code>true</code>.</p> %}
    *)
  method bodyCls : _ Js.t Js.prop
  (** {% <p>A CSS class, space-delimited string of classes, or array of classes to be applied to the panel's body element.
The following examples are all valid:</p>

<pre><code>bodyCls: 'foo'
bodyCls: 'foo bar'
bodyCls: ['foo', 'bar']
</code></pre> %}
    *)
  method bodyPadding : _ Js.t Js.prop
  (** {% <p>A shortcut for setting a padding style on the body element. The value can either be
a number to be applied to all sides, or a normal css string describing padding.
Defaults to <code>undefined</code>.</p> %}
    *)
  method bodyStyle : _ Js.t Js.prop
  (** {% <p>Custom CSS styles to be applied to the panel's body element, which can be supplied as a valid CSS style string,
an object containing style property name/value pairs or a function that returns such a string or object.
For example, these two formats are interpreted to be equivalent:</p>

<pre><code>bodyStyle: 'background:#ffc; padding:10px;'

bodyStyle: \{
    background: '#ffc',
    padding: '10px'
\}
</code></pre> %}
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
  method componentLayout : _ Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.panel.AbstractPanel-method-setSize" rel="Ext.panel.AbstractPanel-method-setSize" class="docClass">setSize</a> method.</p> %}
    
    Defaults to: ['dock']
    *)
  method dockedItems : _ Js.t Js.prop
  (** {% <p>A component or series of components to be added as docked items to this panel.
The docked items can be docked to either the top, right, left or bottom of a panel.
This is typically used for things like toolbars or tab bars:</p>

<pre><code>var panel = new <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>(\{
    fullscreen: true,
    dockedItems: [\{
        xtype: 'toolbar',
        dock: 'top',
        items: [\{
            text: 'Docked to the top'
        \}]
    \}]
\});</code></pre> %}
    *)
  method renderTpl : _ Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.panel.AbstractPanel-method-getEl" rel="Ext.panel.AbstractPanel-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.panel.AbstractPanel-method-getEl" rel="Ext.panel.AbstractPanel-method-getEl" class="docClass">Element</a> empty. The more specialized Ext JS and Sencha Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.panel.AbstractPanel-cfg-renderSelectors" rel="Ext.panel.AbstractPanel-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.panel.AbstractPanel-cfg-childEls" rel="Ext.panel.AbstractPanel-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    *)
  method shrinkWrapDock : _ Js.t Js.prop
  (** {% <p>Allows for this panel to include the <a href="#!/api/Ext.panel.AbstractPanel-cfg-dockedItems" rel="Ext.panel.AbstractPanel-cfg-dockedItems" class="docClass">dockedItems</a> when trying to determine the overall
size of the panel. This option is only applicable when this panel is also shrink wrapping in the
same dimensions. See <a href="#!/api/Ext.AbstractComponent-cfg-shrinkWrap" rel="Ext.AbstractComponent-cfg-shrinkWrap" class="docClass">Ext.AbstractComponent.shrinkWrap</a> for an explanation of the configuration options.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_container_DockingContainer.events
  inherit Ext_container_Container.events
  
  
end

class type statics =
object
  inherit Ext_container_Container.statics
  inherit Ext_container_DockingContainer.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

