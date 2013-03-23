(** A modal, floating Component which may be shown abo ...
  
  {% <p>A modal, floating Component which may be shown above a specified <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a> while loading data.
When shown, the configured owning Component will be covered with a modality mask, and the LoadMask's <a href="#!/api/Ext.LoadMask-cfg-msg" rel="Ext.LoadMask-cfg-msg" class="docClass">msg</a> will be
displayed centered, accompanied by a spinner image.</p>

<p>If the <a href="#!/api/Ext.LoadMask-cfg-store" rel="Ext.LoadMask-cfg-store" class="docClass">store</a> config option is specified, the masking will be automatically shown and then hidden synchronized with
the Store's loading process.</p>

<p>Because this is a floating Component, its z-index will be managed by the global <a href="#!/api/Ext.WindowManager" rel="Ext.WindowManager" class="docClass">ZIndexManager</a>
object, and upon show, it will place itsef at the top of the hierarchy.</p>

<p>Example usage:</p>

<pre><code>// Basic mask:
var myMask = new <a href="#!/api/Ext.LoadMask" rel="Ext.LoadMask" class="docClass">Ext.LoadMask</a>(myPanel, \{msg:"Please wait..."\});
myMask.show();
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_util_Bindable.t
  inherit Ext_util_Floating.t
  inherit Ext_Component.t
  
  method afterRender : unit Js.meth
  (** {% <p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
    *)
  method afterShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Invoked after the Component is shown (after <a href="#!/api/Ext.LoadMask-method-onShow" rel="Ext.LoadMask-method-onShow" class="docClass">onShow</a> is called).</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.LoadMask-method-show" rel="Ext.LoadMask-method-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method bindStore_store : Ext_data_Store.t Js.t -> unit Js.meth
  (** {% <p>Changes the data store bound to this LoadMask.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store to bind to this LoadMask</p> %}
    }
    }
    *)
  method getStoreListeners : Ext_data_Store.t Js.t -> _ Js.t Js.meth
  (** {% <p>Gets the listeners to bind to a new store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The Store which is being bound to for which a listeners object should be returned.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The listeners to be bound to the store in object literal form. The scope
may be omitted, it is assumed to be the current instance.</p> %}
    }
    }
    *)
  method hide_mask : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Hides this Component, setting it to invisible using the configured <a href="#!/api/Ext.LoadMask-cfg-hideMode" rel="Ext.LoadMask-cfg-hideMode" class="docClass">hideMode</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    {% <p><strong>only valid for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components
such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have
been configured with <code>floating: true</code>.</strong>. The target to which the Component should animate while hiding.</p> %}
     Defaults to: null
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>A callback function to call after the Component is hidden.</p> %}
    }
    {- scope: [_ Js.t] (optional)
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
After calling the superclass's onDestroy, the Component will be destroyed.</p> %}
    *)
  method onDisable : unit Js.meth
  (** {% <p>Allows addition of behavior to the disable operation.
After calling the superclass's <code>onDisable</code>, the Component will be disabled.</p> %}
    *)
  method onHide : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Possibly animates down to a target element.</p>

<p>Allows addition of behavior to the hide operation. After
calling the superclass’s onHide, the Component will be hidden.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.LoadMask-method-hide" rel="Ext.LoadMask-method-hide" class="docClass">hide</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method onShow : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Allows addition of behavior to the show operation. After
calling the superclass's onShow, the Component will be visible.</p>

<p>Override in subclasses where more complex behaviour is needed.</p>

<p>Gets passed the same parameters as <a href="#!/api/Ext.LoadMask-method-show" rel="Ext.LoadMask-method-show" class="docClass">show</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    }
    {- callback: [_ Js.callback] (optional)
    }
    {- scope: [_ Js.t] (optional)
    }
    }
    *)
  method show_mask : _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> #Ext_Component.t Js.t Js.meth
  (** {% <p>Shows this Component, rendering it first if <a href="#!/api/Ext.LoadMask-cfg-autoRender" rel="Ext.LoadMask-cfg-autoRender" class="docClass">autoRender</a> or <a href="#!/api/Ext.LoadMask-cfg-floating" rel="Ext.LoadMask-cfg-floating" class="docClass">floating</a> are <code>true</code>.</p>

<p>After being shown, a <a href="#!/api/Ext.LoadMask-cfg-floating" rel="Ext.LoadMask-cfg-floating" class="docClass">floating</a> Component (such as a <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a>), is activated it and
brought to the front of its <a href="#!/api/Ext.LoadMask-property-zIndexManager" rel="Ext.LoadMask-property-zIndexManager" class="docClass">z-index stack</a>.</p> %}
    
    {b Parameters}:
    {ul {- animateTarget: [_ Js.t] (optional)
    {% <p><strong>only valid for <a href="#!/api/Ext.Component-cfg-floating" rel="Ext.Component-cfg-floating" class="docClass">floating</a> Components such as <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Window</a>s or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">ToolTip</a>s, or regular Components which have been configured
with <code>floating: true</code>.</strong> The target from which the Component should animate from while opening.</p> %}
     Defaults to: null
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>A callback function to call after the Component is displayed.
Only necessary if animation was specified.</p> %}
    }
    {- scope: [_ Js.t] (optional)
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
  inherit Ext_util_Bindable.configs
  inherit Ext_util_Floating.configs
  inherit Ext_Component.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
  method afterShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef
    -> _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterShow] *)
  method onDestroy : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDestroy] *)
  method onDisable : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.onDisable] *)
  method onHide : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onHide] *)
  method onShow : ('self Js.t, _ Js.t Js.optdef -> _ Js.callback Js.optdef ->
    _ Js.t Js.optdef -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onShow] *)
  method baseCls : Js.js_string Js.t Js.prop
  (** {% <p>The base CSS class to apply to this component's element. This will also be prepended to elements within this
component like Panel's body will get a class <code>x-panel-body</code>. This means that if you create a subclass of Panel, and
you want it to get all the Panels styling for the element and the body, you leave the <code>baseCls</code> <code>x-panel</code> and use
<code>componentCls</code> to add specific styling for this component.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'mask-msg']
    *)
  method maskCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to the mask element</p> %}
    
    Defaults to: ["x-mask"]
    *)
  method msg : Js.js_string Js.t Js.prop
  (** {% <p>The text to display in a centered loading message box.</p> %}
    
    Defaults to: ["Loading..."]
    *)
  method msgCls : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class to apply to the loading message element.</p> %}
    
    Defaults to: ["x-mask-loading"]
    *)
  method renderTpl : _ Js.t Js.prop
  (** {% <p>An <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a> used to create the internal structure inside this Component's encapsulating
<a href="#!/api/Ext.LoadMask-method-getEl" rel="Ext.LoadMask-method-getEl" class="docClass">Element</a>.</p>

<p>You do not normally need to specify this. For the base classes <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> and
<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>, this defaults to <strong><code>null</code></strong> which means that they will be initially rendered
with no internal structure; they render their <a href="#!/api/Ext.LoadMask-method-getEl" rel="Ext.LoadMask-method-getEl" class="docClass">Element</a> empty. The more specialized Ext JS and Sencha Touch
classes which use a more complex DOM structure, provide their own template definitions.</p>

<p>This is intended to allow the developer to create application-specific utility Components with customized
internal structure.</p>

<p>Upon rendering, any created child elements may be automatically imported into object properties using the
<a href="#!/api/Ext.LoadMask-cfg-renderSelectors" rel="Ext.LoadMask-cfg-renderSelectors" class="docClass">renderSelectors</a> and <a href="#!/api/Ext.LoadMask-cfg-childEls" rel="Ext.LoadMask-cfg-childEls" class="docClass">childEls</a> options.</p> %}
    
    Defaults to: ['<div id=''\{id\}-msgEl'' class=''\{[values.$comp.msgCls]\} ', Ext.baseCSSPrefix, 'mask-msg-inner\{childElCls\}''>', '<div id=''\{id\}-msgTextEl'' class=''', Ext.baseCSSPrefix, 'mask-msg-text', '\{childElCls\}''></div>', '</div>']
    *)
  method store : Ext_data_Store.t Js.t Js.prop
  (** {% <p>Optional Store to which the mask is bound. The mask is displayed when a load request is issued, and
hidden on either load success, or load fail.</p> %}
    *)
  method target : #Ext_Component.t Js.t Js.prop
  (** {% <p>The Component you wish to mask. The the mask will be automatically sized
upon Component resize, and the message box will be kept centered.</p> %}
    *)
  method useMsg : bool Js.t Js.prop
  (** {% <p>Whether or not to use a loading message class or simply mask the bound element.</p> %}
    
    Defaults to: [true]
    *)
  method useTargetEl : bool Js.t Js.prop
  (** {% <p>True to mask the <a href="#!/api/Ext.Component-method-getTargetEl" rel="Ext.Component-method-getTargetEl" class="docClass">targetEl</a> of the bound Component. By default,
the <a href="#!/api/Ext.Component-method-getEl" rel="Ext.Component-method-getEl" class="docClass">el</a> will be masked.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_util_Bindable.events
  inherit Ext_util_Floating.events
  inherit Ext_Component.events
  
  
end

class type statics =
object
  inherit Ext_Component.statics
  inherit Ext_util_Bindable.statics
  inherit Ext_util_Floating.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

