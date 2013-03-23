(** A specialized tooltip class for tooltips that can ...
  
  {% <p>A specialized tooltip class for tooltips that can be specified in markup and automatically managed
by the global <a href="#!/api/Ext.tip.QuickTipManager" rel="Ext.tip.QuickTipManager" class="docClass">Ext.tip.QuickTipManager</a> instance.  See the QuickTipManager documentation for
additional usage details and examples.</p> %}
  *)

class type t =
object('self)
  inherit Ext_tip_ToolTip.t
  
  method cancelShow : _ Js.t -> unit Js.meth
  (** {% <p>Hides a visible tip or cancels an impending show for a particular element.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The element that is the target of
the tip or ID of the element.</p> %}
    }
    }
    *)
  method register : _ Js.t -> unit Js.meth
  (** {% <p>Configures a new quick tip instance and assigns it to a target element.</p>

<p>For example usage, see the <a href="#!/api/Ext.tip.QuickTipManager" rel="Ext.tip.QuickTipManager" class="docClass">Ext.tip.QuickTipManager</a> class header.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t]
    {% <p>The config object with the following properties:</p> %}
    }
    }
    *)
  method unregister : _ Js.t -> unit Js.meth
  (** {% <p>Removes this quick tip from its element and destroys it.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The element from which the quick tip
is to be removed or ID of the element.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_tip_ToolTip.configs
  
  method interceptTitles : bool Js.t Js.prop
  (** {% <p><code>true</code> to automatically use the element's DOM title value if available.</p> %}
    
    Defaults to: [false]
    *)
  method target : _ Js.t Js.prop
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
  inherit Ext_tip_ToolTip.events
  
  
end

class type statics =
object
  inherit Ext_tip_ToolTip.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

