(** Create simple buttons with this component. Customi ...
  
  {% <p>Create simple buttons with this component. Customisations include <a href="#!/api/Ext.button.Button-cfg-iconAlign" rel="Ext.button.Button-cfg-iconAlign" class="docClass">aligned</a>
<a href="#!/api/Ext.button.Button-cfg-iconCls" rel="Ext.button.Button-cfg-iconCls" class="docClass">icons</a>, <a href="#!/api/Ext.button.Button-cfg-menu" rel="Ext.button.Button-cfg-menu" class="docClass">dropdown menus</a>, <a href="#!/api/Ext.button.Button-cfg-tooltip" rel="Ext.button.Button-cfg-tooltip" class="docClass">tooltips</a>
and <a href="#!/api/Ext.button.Button-cfg-scale" rel="Ext.button.Button-cfg-scale" class="docClass">sizing options</a>. Specify a <a href="#!/api/Ext.button.Button-cfg-handler" rel="Ext.button.Button-cfg-handler" class="docClass">handler</a> to run code when
a user clicks the button, or use <a href="#!/api/Ext.button.Button-cfg-listeners" rel="Ext.button.Button-cfg-listeners" class="docClass">listeners</a> for other events such as
<a href="#!/api/Ext.button.Button-event-mouseover" rel="Ext.button.Button-event-mouseover" class="docClass">mouseover</a>. Example usage:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.Button</a>', {
    text: 'Click me',
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    handler: function() {
        alert('You clicked the button!');
    }
});
</code></pre>

<p>The <a href="#!/api/Ext.button.Button-cfg-handler" rel="Ext.button.Button-cfg-handler" class="docClass">handler</a> configuration can also be updated dynamically using the <a href="#!/api/Ext.button.Button-method-setHandler" rel="Ext.button.Button-method-setHandler" class="docClass">setHandler</a>
method.  Example usage:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.Button</a>', {
    text    : 'Dynamic Handler Button',
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    handler : function() {
        // this button will spit out a different number every time you click it.
        // so firstly we must check if that number is already set:
        if (this.clickCount) {
            // looks like the property is already set, so lets just add 1 to that number and alert the user
            this.clickCount++;
            alert('You have clicked the button "' + this.clickCount + '" times.\n\nTry clicking it again..');
        } else {
            // if the clickCount property is not set, we will set it and alert the user
            this.clickCount = 1;
            alert('You just clicked the button for the first time!\n\nTry pressing it again..');
        }
    }
});
</code></pre>

<p>A button within a container:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.Container</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    items   : [
        {
            xtype: 'button',
            text : 'My Button'
        }
    ]
});
</code></pre>

<p>A useful option of Button is the <a href="#!/api/Ext.button.Button-cfg-scale" rel="Ext.button.Button-cfg-scale" class="docClass">scale</a> configuration. This configuration has three different options:</p>

<ul>
<li><code>'small'</code></li>
<li><code>'medium'</code></li>
<li><code>'large'</code></li>
</ul>


<p>Example usage:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.Button</a>', {
    renderTo: document.body,
    text    : 'Click me',
    scale   : 'large'
});
</code></pre>

<p>Buttons can also be toggled. To enable this, you simple set the <a href="#!/api/Ext.button.Button-cfg-enableToggle" rel="Ext.button.Button-cfg-enableToggle" class="docClass">enableToggle</a> property to <code>true</code>.
Example usage:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.Button</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    text: 'Click Me',
    enableToggle: true
});
</code></pre>

<p>You can assign a menu to a button by using the <a href="#!/api/Ext.button.Button-cfg-menu" rel="Ext.button.Button-cfg-menu" class="docClass">menu</a> configuration. This standard configuration
can either be a reference to a <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">menu</a> object, a <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">menu</a> id or a
<a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">menu</a> config blob. When assigning a menu to a button, an arrow is automatically
added to the button.  You can change the alignment of the arrow using the <a href="#!/api/Ext.button.Button-cfg-arrowAlign" rel="Ext.button.Button-cfg-arrowAlign" class="docClass">arrowAlign</a> configuration
on button.  Example usage:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.Button</a>', {
    text      : 'Menu button',
    renderTo  : <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    arrowAlign: 'bottom',
    menu      : [
        {text: 'Item 1'},
        {text: 'Item 2'},
        {text: 'Item 3'},
        {text: 'Item 4'}
    ]
});
</code></pre>

<p>Using listeners, you can easily listen to events fired by any component, using the <a href="#!/api/Ext.button.Button-cfg-listeners" rel="Ext.button.Button-cfg-listeners" class="docClass">listeners</a>
configuration or using the <a href="#!/api/Ext.button.Button-method-addListener" rel="Ext.button.Button-method-addListener" class="docClass">addListener</a> method.  Button has a variety of different listeners:</p>

<ul>
<li><code>click</code></li>
<li><code>toggle</code></li>
<li><code>mouseover</code></li>
<li><code>mouseout</code></li>
<li><code>mouseshow</code></li>
<li><code>menuhide</code></li>
<li><code>menutriggerover</code></li>
<li><code>menutriggerout</code></li>
</ul>


<p>Example usage:</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.Button</a>', {
    text     : 'Button',
    renderTo : <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    listeners: {
        click: function() {
            // this == the button, as we are in the local scope
            this.setText('I was clicked!');
        },
        mouseover: function() {
            // set a new config which says we moused over, if not already set
            if (!this.mousedOver) {
                this.mousedOver = true;
                alert('You moused over a button!\n\nI wont do this again.');
            }
        }
    }
});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  
  method disabled : bool Js.t Js.readonly_prop
  (** {% <p>True if this button is disabled.</p> %}
    
    Defaults to: [false]
    *)
  method hidden : bool Js.t Js.readonly_prop
  (** {% <p>True if this button is hidden.</p> %}
    
    Defaults to: [false]
    *)
  method menu : Ext_menu_Menu.t Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.menu.Menu" rel="Ext.menu.Menu" class="docClass">Menu</a> object associated with this Button when configured with the <a href="#!/api/Ext.button.Button-cfg-menu" rel="Ext.button.Button-cfg-menu" class="docClass">menu</a> config
option.</p> %}
    *)
  method pressed : bool Js.t Js.readonly_prop
  (** {% <p>True if this button is pressed (only if enableToggle = true).</p> %}
    
    Defaults to: [false]
    *)
  method template : Ext_Template.t Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Template</a> used to create the Button's DOM structure.</p>

<p>Instances, or subclasses which need a different DOM structure may provide a different template layout in
conjunction with an implementation of <a href="#!/api/Ext.button.Button-method-getTemplateArgs" rel="Ext.button.Button-method-getTemplateArgs" class="docClass">getTemplateArgs</a>.</p> %}
    *)
  method beforeDestroy : unit Js.meth
  (** {% <p>private</p>

<p>Invoked before the Component is destroyed.</p> %}
    *)
  method disable : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Disable the component.</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>Passing true will supress the 'disable' event from being fired.</p> %}
     Defaults to: false
    }
    }
    *)
  method enable : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Enable the component</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>Passing true will supress the 'enable' event from being fired.</p> %}
     Defaults to: false
    }
    }
    *)
  method getTemplateArgs : _ Js.t Js.meth
  (** {% <p>This method returns an object which provides substitution parameters for the <a href="#!/api/Ext.button.Button-cfg-renderTpl" rel="Ext.button.Button-cfg-renderTpl" class="docClass">XTemplate</a> used to
create this Button's DOM structure.</p>

<p>Instances or subclasses which use a different Template to create a different DOM structure may need to provide
their own implementation of this method.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>Substitution data for a Template. The default implementation which provides data for the default
<a href="#!/api/Ext.button.Button-property-template" rel="Ext.button.Button-property-template" class="docClass">template</a> returns an Object containing the following properties:</p> %}
    }
    }
    *)
  method getText : Js.js_string Js.t Js.meth
  (** {% <p>Gets the text for this Button</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The button text</p> %}
    }
    }
    *)
  method hasVisibleMenu : bool Js.t Js.meth
  (** {% <p>Returns true if the button has a menu and it is visible</p> %}
    *)
  method hideMenu : 'self Js.t Js.meth
  (** {% <p>Hides this button's menu (if it has one)</p> %}
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method initComponent : unit Js.meth
  (** {% <p>inherit docs</p>

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
  method onDestroy : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior to the destroy operation.
After calling the superclass’s onDestroy, the Component will be destroyed.</p> %}
    *)
  method onDisable : unit Js.meth
  (** {% <p>See comments in onFocus</p>

<p>Allows addition of behavior to the disable operation.
After calling the superclass’s onDisable, the Component will be disabled.</p> %}
    *)
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>private</p>

<p>Template method called when this Component's DOM structure is created.</p>

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
  method setHandler : _ Js.callback -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Assigns this Button's click handler</p> %}
    
    {b Parameters}:
    {ul {- handler: [_ Js.callback]
    {% <p>The function to call when the button is clicked</p> %}
    }
    {- scope: [_ Js.t] (optional)
    {% <p>The scope (<code>this</code> reference) in which the handler function is executed.
Defaults to this Button.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setIcon : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the background image (inline style) of the button. This method also changes the value of the <a href="#!/api/Ext.button.Button-cfg-icon" rel="Ext.button.Button-cfg-icon" class="docClass">icon</a>
config internally.</p> %}
    
    {b Parameters}:
    {ul {- icon: [Js.js_string Js.t]
    {% <p>The path to an image to display in the button</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setIconCls : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the CSS class that provides a background image to use as the button's icon. This method also changes the
value of the <a href="#!/api/Ext.button.Button-cfg-iconCls" rel="Ext.button.Button-cfg-iconCls" class="docClass">iconCls</a> config internally.</p> %}
    
    {b Parameters}:
    {ul {- cls: [Js.js_string Js.t]
    {% <p>The CSS class providing the icon image</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setParams : _ Js.t -> unit Js.meth
  (** {% <p>Sets the href of the link dynamically according to the params passed, and any <a href="#!/api/Ext.button.Button-cfg-baseParams" rel="Ext.button.Button-cfg-baseParams" class="docClass">baseParams</a> configured.</p>

<p><strong>Only valid if the Button was originally configured with a <a href="#!/api/Ext.button.Button-cfg-href" rel="Ext.button.Button-cfg-href" class="docClass">href</a></strong></p> %}
    
    {b Parameters}:
    {ul {- params: [_ Js.t]
    {% <p>Parameters to use in the href URL.</p> %}
    }
    }
    *)
  method setScale : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Method to change the scale of the button. See <a href="#!/api/Ext.button.Button-cfg-scale" rel="Ext.button.Button-cfg-scale" class="docClass">scale</a> for allowed configurations.</p> %}
    
    {b Parameters}:
    {ul {- scale: [Js.js_string Js.t]
    {% <p>The scale to change to.</p> %}
    }
    }
    *)
  method setText : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets this Button's text</p> %}
    
    {b Parameters}:
    {ul {- text: [Js.js_string Js.t]
    {% <p>The button text</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setTextAlign : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Sets the text alignment for this button.</p> %}
    
    {b Parameters}:
    {ul {- align: [Js.js_string Js.t]
    {% <p>The new alignment of the button text. See <a href="#!/api/Ext.button.Button-cfg-textAlign" rel="Ext.button.Button-cfg-textAlign" class="docClass">textAlign</a>.</p> %}
    }
    }
    *)
  method setTooltip : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the tooltip for this Button.</p> %}
    
    {b Parameters}:
    {ul {- tooltip: [_ Js.t]
    {% <p>This may be:</p>

<ul>
<li><strong>String</strong> : A string to be used as innerHTML (html tags are accepted) to show in a tooltip</li>
<li><strong>Object</strong> : A configuration object for <a href="#!/api/Ext.tip.QuickTipManager-method-register" rel="Ext.tip.QuickTipManager-method-register" class="docClass">Ext.tip.QuickTipManager.register</a>.</li>
</ul> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setUI : Js.js_string Js.t -> unit Js.meth
  (** {% <p>inherit docs</p>

<p>Sets the UI for the component. This will remove any existing UIs on the component. It will also loop through any
uiCls set on the component and rename them so they include the new UI</p> %}
    
    {b Parameters}:
    {ul {- ui: [Js.js_string Js.t]
    {% <p>The new UI for the component</p> %}
    }
    }
    *)
  method showMenu : unit Js.meth
  (** {% <p>Shows this button's menu (if it has one)</p> %}
    *)
  method toggle : bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>If a state it passed, it becomes the pressed state otherwise the current state is toggled.</p> %}
    
    {b Parameters}:
    {ul {- state: [bool Js.t] (optional)
    {% <p>Force a particular state</p> %}
    }
    {- suppressEvent: [bool Js.t] (optional)
    {% <p>True to stop events being fired when calling this method.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_button_Button.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  
  method beforeDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDestroy] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDisable] *)
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onRender] *)
  method allowDepress : bool Js.t Js.prop
  (** {% <p>False to not allow a pressed Button to be depressed. Only valid when <a href="#!/api/Ext.button.Button-cfg-enableToggle" rel="Ext.button.Button-cfg-enableToggle" class="docClass">enableToggle</a> is true.</p> %}
    
    Defaults to: [true]
    *)
  method arrowAlign : Js.js_string Js.t Js.prop
  (** {% <p>The side of the Button box to render the arrow if the button has an associated <a href="#!/api/Ext.button.Button-cfg-menu" rel="Ext.button.Button-cfg-menu" class="docClass">menu</a>. Two
values are allowed:</p>

<ul>
<li>'right'</li>
<li>'bottom'</li>
</ul> %}
    
    Defaults to: ['right']
    *)
  method arrowCls : Js.js_string Js.t Js.prop
  (** {% <p>The className used for the inner arrow element if the button has a menu.</p> %}
    
    Defaults to: ['arrow']
    *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to add to all buttons.</p> %}
    
    Defaults to: ['x-btn']
    *)
  method baseParams : _ Js.t Js.prop
  (** {% <p>An object literal of parameters to pass to the url when the <a href="#!/api/Ext.button.Button-cfg-href" rel="Ext.button.Button-cfg-href" class="docClass">href</a> property is specified.</p> %}
    *)
  method border_bool : bool Js.t Js.prop
  (** {% <p>Specifies the border size for this component. The border can be a single numeric value to apply to all sides or it can
be a CSS style specification for each style, for example: '10 5 3 10'.</p>

<p>For components that have no border by default, setting this won't make the border appear by itself.
You also need to specify border color and style:</p>

<pre><code>border: 5,
style: {
    borderColor: 'red',
    borderStyle: 'solid'
}
</code></pre>

<p>To turn off the border, use <code>border: false</code>.</p> %}
    
    Defaults to: [true]
    *)
  method clickEvent : Js.js_string Js.t Js.prop
  (** {% <p>The DOM event that will fire the handler of the button. This can be any valid event name (dblclick, contextmenu).</p> %}
    
    Defaults to: ['click']
    *)
  method cls : Js.js_string Js.t Js.prop
  (** {% <p>A CSS class string to apply to the button's main element.</p> %}
    *)
  method componentLayout_str : Js.js_string Js.t Js.prop
  (** {% <p>The sizing and positioning of a Component's internal Elements is the responsibility of the Component's layout
manager which sizes a Component's internal structure in response to the Component being sized.</p>

<p>Generally, developers will not use this configuration as all provided Components which need their internal
elements sizing (Such as <a href="#!/api/Ext.form.field.Base" rel="Ext.form.field.Base" class="docClass">input fields</a>) come with their own componentLayout managers.</p>

<p>The <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">default layout manager</a> will be used on instances of the base <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>
class which simply sizes the Component's encapsulating element to the height and width specified in the
<a href="#!/api/Ext.button.Button-method-setSize" rel="Ext.button.Button-method-setSize" class="docClass">setSize</a> method.</p> %}
    
    Defaults to: ['button']
    *)
  method disabled : bool Js.t Js.prop
  (** {% <p>True to start disabled.</p> %}
    
    Defaults to: [false]
    *)
  method enableToggle : bool Js.t Js.prop
  (** {% <p>True to enable pressed/not pressed toggling. If a <a href="#!/api/Ext.button.Button-cfg-toggleGroup" rel="Ext.button.Button-cfg-toggleGroup" class="docClass">toggleGroup</a> is specified, this
option will be set to true.</p> %}
    
    Defaults to: [false]
    *)
  method focusCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to add to a button when it is in the focussed state.</p> %}
    
    Defaults to: ['focus']
    *)
  method frame : bool Js.t Js.prop
  (** {% <p>Specify as <code>true</code> to have the Component inject framing elements within the Component at render time to provide a
graphical rounded frame around the Component content.</p>

<p>This is only necessary when running on outdated, or non standard-compliant browsers such as Microsoft's Internet
Explorer prior to version 9 which do not support rounded corners natively.</p>

<p>The extra space taken up by this framing is available from the read only property <a href="#!/api/Ext.button.Button-property-frameSize" rel="Ext.button.Button-property-frameSize" class="docClass">frameSize</a>.</p> %}
    
    Defaults to: [true]
    *)
  method handleMouseEvents : bool Js.t Js.prop
  (** {% <p>False to disable visual cues on mouseover, mouseout and mousedown.</p> %}
    
    Defaults to: [true]
    *)
  method handler : _ Js.callback Js.prop
  (** {% <p>A function called when the button is clicked (can be used instead of click event).</p> %}
    *)
  method hidden : bool Js.t Js.prop
  (** {% <p>True to start hidden.</p> %}
    
    Defaults to: [false]
    *)
  method href : Js.js_string Js.t Js.prop
  (** {% <p>The URL to open when the button is clicked. Specifying this config causes the Button to be
rendered with an anchor (An <code>&lt;a&gt;</code> element) as its active element, referencing the specified URL.</p>

<p>This is better than specifying a click handler of</p>

<pre><code>function() { window.location = "http://www.sencha.com" }
</code></pre>

<p>because the UI will provide meaningful hints to the user as to what to expect upon clicking
the button, and will also allow the user to open in a new tab or window, bookmark or drag the URL, or directly save
the URL stream to disk.</p>

<p>See also the <a href="#!/api/Ext.button.Button-cfg-hrefTarget" rel="Ext.button.Button-cfg-hrefTarget" class="docClass">hrefTarget</a> config.</p> %}
    *)
  method hrefTarget : Js.js_string Js.t Js.prop
  (** {% <p>The target attribute to use for the underlying anchor. Only used if the <a href="#!/api/Ext.button.Button-cfg-href" rel="Ext.button.Button-cfg-href" class="docClass">href</a>
property is specified.</p> %}
    
    Defaults to: ["_blank"]
    *)
  method icon : Js.js_string Js.t Js.prop
  (** {% <p>The path to an image to display in the button.</p> %}
    *)
  method iconAlign : Js.js_string Js.t Js.prop
  (** {% <p>The side of the Button box to render the icon. Four values are allowed:</p>

<ul>
<li>'top'</li>
<li>'right'</li>
<li>'bottom'</li>
<li>'left'</li>
</ul> %}
    
    Defaults to: ['left']
    *)
  method iconCls : Js.js_string Js.t Js.prop
  (** {% <p>A css class which sets a background image to be used as the icon for this button.</p> %}
    *)
  method menu : _ Js.t Js.prop
  (** {% <p>Standard menu attribute consisting of a reference to a menu object, a menu id or a menu config blob.</p> %}
    *)
  method menuActiveCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to add to a button when it's menu is active.</p> %}
    
    Defaults to: ['menu-active']
    *)
  method menuAlign : Js.js_string Js.t Js.prop
  (** {% <p>The position to align the menu to (see <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.Element.alignTo</a> for more details).</p> %}
    
    Defaults to: ['tl-bl?']
    *)
  method minWidth : Js.number Js.t Js.prop
  (** {% <p>The minimum width for this button (used to give a set of buttons a common width).
See also <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>.<a href="#!/api/Ext.panel.Panel-cfg-minButtonWidth" rel="Ext.panel.Panel-cfg-minButtonWidth" class="docClass">minButtonWidth</a>.</p> %}
    *)
  method overCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to add to a button when it is in the over (hovered) state.</p> %}
    
    Defaults to: ['over']
    *)
  method overflowText : Js.js_string Js.t Js.prop
  (** {% <p>If used in a <a href="#!/api/Ext.toolbar.Toolbar" rel="Ext.toolbar.Toolbar" class="docClass">Toolbar</a>, the text to be used if this item is shown in the overflow menu.
See also <a href="#!/api/Ext.toolbar.Item" rel="Ext.toolbar.Item" class="docClass">Ext.toolbar.Item</a>.<code><a href="#!/api/Ext.toolbar.Item-cfg-overflowText" rel="Ext.toolbar.Item-cfg-overflowText" class="docClass">overflowText</a></code>.</p> %}
    *)
  method params : _ Js.t Js.prop
  (** {% <p>An object literal of parameters to pass to the url when the <a href="#!/api/Ext.button.Button-cfg-href" rel="Ext.button.Button-cfg-href" class="docClass">href</a> property is specified. Any params
override <a href="#!/api/Ext.button.Button-cfg-baseParams" rel="Ext.button.Button-cfg-baseParams" class="docClass">baseParams</a>. New params can be set using the <a href="#!/api/Ext.button.Button-method-setParams" rel="Ext.button.Button-method-setParams" class="docClass">setParams</a> method.</p> %}
    *)
  method pressed : bool Js.t Js.prop
  (** {% <p>True to start pressed (only if enableToggle = true)</p> %}
    
    Defaults to: [false]
    *)
  method pressedCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to add to a button when it is in the pressed state.</p> %}
    
    Defaults to: ['pressed']
    *)
  method preventDefault : bool Js.t Js.prop
  (** {% <p>True to prevent the default action when the <a href="#!/api/Ext.button.Button-cfg-clickEvent" rel="Ext.button.Button-cfg-clickEvent" class="docClass">clickEvent</a> is processed.</p> %}
    
    Defaults to: [true]
    *)
  method renderTpl_arr : _ Js.js_array Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.button.Button-method-getEl" rel="Ext.button.Button-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.button.Button-method-getEl" rel="Ext.button.Button-method-getEl" class="docClass">Element</a> empty. The more specialized ExtJS and Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.button.Button-cfg-renderSelectors" rel="Ext.button.Button-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.button.Button-cfg-childEls" rel="Ext.button.Button-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    
    Defaults to: [['<em id="{id}-btnWrap"<tpl if="splitCls"> class="{splitCls}"</tpl>>', '<tpl if="href">', '<a id="{id}-btnEl" href="{href}" class="{btnCls}" target="{hrefTarget}"', '<tpl if="tabIndex"> tabIndex="{tabIndex}"</tpl>', '<tpl if="disabled"> disabled="disabled"</tpl>', ' role="link">', '<span id="{id}-btnInnerEl" class="{baseCls}-inner">', '{text}', '</span>', '<span id="{id}-btnIconEl" class="{baseCls}-icon {iconCls}"<tpl if="iconUrl"> style="background-image:url({iconUrl})"</tpl>></span>', '</a>', '<tpl else>', '<button id="{id}-btnEl" type="{type}" class="{btnCls}" hidefocus="true"', '<tpl if="tabIndex"> tabIndex="{tabIndex}"</tpl>', '<tpl if="disabled"> disabled="disabled"</tpl>', ' role="button" autocomplete="off">', '<span id="{id}-btnInnerEl" class="{baseCls}-inner" style="{innerSpanStyle}">', '{text}', '</span>', '<span id="{id}-btnIconEl" class="{baseCls}-icon {iconCls}"<tpl if="iconUrl"> style="background-image:url({iconUrl})"</tpl>></span>', '</button>', '</tpl>', '</em>', '<tpl if="closable">', '<a id="{id}-closeEl" href="#" class="{baseCls}-close-btn" title="{closeText}"></a>', '</tpl>']]
    *)
  method repeat : _ Js.t Js.prop
  (** {% <p>True to repeat fire the click event while the mouse is down. This can also be a
<a href="#!/api/Ext.util.ClickRepeater" rel="Ext.util.ClickRepeater" class="docClass">ClickRepeater</a> config object.</p> %}
    
    Defaults to: [false]
    *)
  method scale : Js.js_string Js.t Js.prop
  (** {% <p>The size of the Button. Three values are allowed:</p>

<ul>
<li>'small' - Results in the button element being 16px high.</li>
<li>'medium' - Results in the button element being 24px high.</li>
<li>'large' - Results in the button element being 32px high.</li>
</ul> %}
    
    Defaults to: ['small']
    *)
  method scope : _ Js.t Js.prop
  (** {% <p>The scope (<strong>this</strong> reference) in which the <code><a href="#!/api/Ext.button.Button-cfg-handler" rel="Ext.button.Button-cfg-handler" class="docClass">handler</a></code> and <code><a href="#!/api/Ext.button.Button-cfg-toggleHandler" rel="Ext.button.Button-cfg-toggleHandler" class="docClass">toggleHandler</a></code> is executed.
Defaults to this Button.</p> %}
    *)
  method shrinkWrap_num : Js.number Js.t Js.prop
  (** {% <p>If this property is a number, it is interpreted as follows:</p>

<ul>
<li>0: Neither width nor height depend on content. This is equivalent to <code>false</code>.</li>
<li>1: Width depends on content (shrink wraps), but height does not.</li>
<li>2: Height depends on content (shrink wraps), but width does not. The default.</li>
<li>3: Both width and height depend on content (shrink wrap). This is equivalent to <code>true</code>.</li>
</ul>


<p>In CSS terms, shrink-wrap width is analogous to an inline-block element as opposed
to a block-level element. Some container layouts always shrink-wrap their children,
effectively ignoring this property (e.g., <a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">Ext.layout.container.HBox</a>,
<a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">Ext.layout.container.VBox</a>, <a href="#!/api/Ext.layout.component.Dock" rel="Ext.layout.component.Dock" class="docClass">Ext.layout.component.Dock</a>).</p> %}
    
    Defaults to: [3]
    *)
  method tabIndex : Js.number Js.t Js.prop
  (** {% <p>Set a DOM tabIndex for this button.</p> %}
    *)
  method text : Js.js_string Js.t Js.prop
  (** {% <p>The button text to be used as innerHTML (html tags are accepted).</p> %}
    *)
  method textAlign : Js.js_string Js.t Js.prop
  (** {% <p>The text alignment for this button (center, left, right).</p> %}
    
    Defaults to: ['center']
    *)
  method toggleGroup : Js.js_string Js.t Js.prop
  (** {% <p>The group this toggle button is a member of (only 1 per group can be pressed). If a toggleGroup
is specified, the <a href="#!/api/Ext.button.Button-cfg-enableToggle" rel="Ext.button.Button-cfg-enableToggle" class="docClass">enableToggle</a> configuration will automatically be set to true.</p> %}
    *)
  method toggleHandler : _ Js.callback Js.prop
  (** {% <p>Function called when a Button with <a href="#!/api/Ext.button.Button-cfg-enableToggle" rel="Ext.button.Button-cfg-enableToggle" class="docClass">enableToggle</a> set to true is clicked.</p> %}
    *)
  method tooltip : _ Js.t Js.prop
  (** {% <p>The tooltip for the button - can be a string to be used as innerHTML (html tags are accepted) or
QuickTips config object.</p> %}
    *)
  method tooltipType : Js.js_string Js.t Js.prop
  (** {% <p>The type of tooltip to use. Either 'qtip' for QuickTips or 'title' for title attribute.</p> %}
    
    Defaults to: ['qtip']
    *)
  method _type : Js.js_string Js.t Js.prop
  (** {% <p>The type of <code>&lt;input&gt;</code> to create: submit, reset or button.</p> %}
    
    Defaults to: ['button']
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  
  method click : (t Js.t -> Dom_html.event Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when this button is clicked, before the configured <a href="#!/api/Ext.button.Button-cfg-handler" rel="Ext.button.Button-cfg-handler" class="docClass">handler</a> is invoked. Execution of the
<a href="#!/api/Ext.button.Button-cfg-handler" rel="Ext.button.Button-cfg-handler" class="docClass">handler</a> may be vetoed by returning <code>false</code> to this event.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The click event</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method menuhide : (t Js.t -> Ext_menu_Menu.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>If this button has a menu, this event fires when it is hidden</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- menu: [Ext_menu_Menu.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method menushow : (t Js.t -> Ext_menu_Menu.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>If this button has a menu, this event fires when it is shown</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- menu: [Ext_menu_Menu.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method menutriggerout : (t Js.t -> Ext_menu_Menu.t Js.t ->
    Dom_html.event Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>If this button has a menu, this event fires when the mouse leaves the menu triggering element</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- menu: [Ext_menu_Menu.t Js.t]
    }
    {- e: [Dom_html.event Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method menutriggerover : (t Js.t -> Ext_menu_Menu.t Js.t ->
    Dom_html.event Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>If this button has a menu, this event fires when the mouse enters the menu triggering element</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- menu: [Ext_menu_Menu.t Js.t]
    }
    {- e: [Dom_html.event Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseout : (t Js.t -> Dom_html.event Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse exits the button</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method mouseover : (t Js.t -> Dom_html.event Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse hovers over the button</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method toggle : (t Js.t -> bool Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the 'pressed' state of this button changes (only if enableToggle = true)</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_button_Button.t Js.t]
    }
    {- pressed: [bool Js.t]
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
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

