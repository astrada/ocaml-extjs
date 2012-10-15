(** A specialized tooltip class for tooltips that can ...
  
  {% <p>A specialized tooltip class for tooltips that can be specified in markup and automatically managed
by the global <a href="#!/api/Ext.tip.QuickTipManager" rel="Ext.tip.QuickTipManager" class="docClass">Ext.tip.QuickTipManager</a> instance.  See the QuickTipManager documentation for
additional usage details and examples.</p> %}
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
  inherit Ext_tip_Tip.t
  inherit Ext_tip_ToolTip.t
  
  method cancelShow : 'a Js.t -> unit Js.meth
  (** {% <p>Hides a visible tip or cancels an impending show for a particular element.</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The element that is the target of
the tip or ID of the element.</p> %}
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
  method register : 'a Js.t -> unit Js.meth
  (** {% <p>Configures a new quick tip instance and assigns it to a target element.</p>

<p>For example usage, see the <a href="#!/api/Ext.tip.QuickTipManager" rel="Ext.tip.QuickTipManager" class="docClass">Ext.tip.QuickTipManager</a> class header.</p> %}
    
    {b Parameters}:
    {ul {- config: ['a Js.t]
    {% <p>The config object with the following properties:</p> %}
    }
    }
    *)
  method unregister : 'a Js.t -> unit Js.meth
  (** {% <p>Removes this quick tip from its element and destroys it.</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The element from which the quick tip
is to be removed or ID of the element.</p> %}
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
  inherit Ext_tip_Tip.configs
  inherit Ext_tip_ToolTip.configs
  
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  method interceptTitles : bool Js.t Js.prop
  (** {% <p>True to automatically use the element's DOM title value if available.</p> %}
    
    Defaults to: [false]
    *)
  method target : 'a Js.t Js.prop
  (** {% <p>The target HTMLElement, <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> or id to associate with this Quicktip.</p>

<p>Defaults to the document.</p> %}
    *)
  method title : Js.js_string Js.t Js.prop
  (** {% <p>Force creation of header Component</p>

<p>The title text to be used to display in the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">panel header</a>. When a
<code>title</code> is specified the <a href="#!/api/Ext.panel.Header" rel="Ext.panel.Header" class="docClass">Ext.panel.Header</a> will automatically be created and displayed unless
<a href="#!/api/Ext.tip.QuickTip-cfg-header" rel="Ext.tip.QuickTip-cfg-header" class="docClass">header</a> is set to <code>false</code>.</p> %}
    
    Defaults to: ['&#160;']
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
  inherit Ext_tip_Tip.events
  inherit Ext_tip_ToolTip.events
  
  
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
  inherit Ext_tip_Tip.statics
  inherit Ext_tip_ToolTip.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

