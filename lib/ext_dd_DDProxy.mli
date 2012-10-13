(** A DragDrop implementation that inserts an empty, b ...
  
  {% <p>A DragDrop implementation that inserts an empty, bordered div into
the document that follows the cursor during drag operations.  At the time of
the click, the frame div is resized to the dimensions of the linked html
element, and moved to the exact location of the linked element.</p>

<p>References to the "frame" element refer to the single proxy element that
was created to be dragged in place of all DDProxy elements on the
page.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_dd_DragDrop.t
  inherit Ext_dd_DD.t
  
  method centerFrame : bool Js.t Js.prop
  (** {% <p>By default the frame is positioned exactly where the drag element is, so
we use the cursor offset provided by <a href="#!/api/Ext.dd.DD" rel="Ext.dd.DD" class="docClass">Ext.dd.DD</a>.  Another option that works only if
you do not have constraints on the obj is to have the drag frame centered
around the cursor.  Set centerFrame to true for this effect.</p> %}
    
    Defaults to: [false]
    *)
  method resizeFrame : bool Js.t Js.prop
  (** {% <p>By default we resize the drag frame to be the same size as the element
we want to drag (this is to get the frame effect).  We can turn it off
if we want a different behavior.</p> %}
    
    Defaults to: [true]
    *)
  method applyConfig : unit Js.meth
  (** {% <p>Sets up config options specific to this class. Overrides
<a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>, but all versions of this method through the
inheritance chain are called</p> %}
    *)
  method b4MouseDown : 'a Js.t -> unit Js.meth
  (** {% <p>overrides <a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a></p>

<p>Event that fires prior to the onMouseDown event.  Overrides
<a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>.</p> %}
    
    {b Parameters}:
    {ul {- e: ['a Js.t]
    }
    }
    *)
  method createFrame : unit Js.meth
  (** {% <p>Creates the proxy element if it does not yet exist</p> %}
    *)
  method endDrag : Dom_html.event Js.t -> unit Js.meth
  (** {% <p>overrides <a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>
By default we try to move the element to the last location of the frame.
This is so that the default behavior mirrors that of <a href="#!/api/Ext.dd.DD" rel="Ext.dd.DD" class="docClass">Ext.dd.DD</a>.</p>

<p>Called when we are done dragging the object</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>the mouseup event</p> %}
    }
    }
    *)
  method initFrame : unit Js.meth
  (** {% <p>Initialization for the drag frame element.  Must be called in the
constructor of all subclasses</p> %}
    *)
  method toString : Js.js_string Js.t Js.meth
  (** {% <p>toString method</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>string representation of the dd obj</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_dd_DragDrop.configs
  inherit Ext_dd_DD.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_dd_DragDrop.events
  inherit Ext_dd_DD.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_dd_DragDrop.statics
  inherit Ext_dd_DD.statics
  
  method dragElId : Js.js_string Js.t Js.prop
  (** {% <p>The default drag frame div id</p> %}
    
    Defaults to: ["ygddfdiv"]
    *)
  
end

val static : statics Js.t
(** Static instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

