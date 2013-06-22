(** A simple class that provides the basic implementat ...
  
  {% <p>A simple class that provides the basic implementation needed to make any element draggable.</p> %}
  *)

class type t =
object('self)
  inherit Ext_dd_DDProxy.t
  
  method dragData : _ Js.t Js.prop
  (** {% <p>This property contains the data representing the dragged object. This data is set up by the implementation of the
<a href="#!/api/Ext.dd.DragSource-method-getDragData" rel="Ext.dd.DragSource-method-getDragData" class="docClass">getDragData</a> method. It must contain a ddel property, but can contain any other data according to the
application's needs.</p> %}
    *)
  method afterDragDrop : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
after a valid drag drop has occurred by providing an implementation.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t] {% <p>The id of the dropped element</p> %}
    }
    }
    *)
  method afterDragEnter : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
when the dragged item enters the drop target by providing an implementation.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t] {% <p>The id of the dragged element</p> %}
    }
    }
    *)
  method afterDragOut : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
after the dragged item is dragged out of the target without dropping.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t] {% <p>The id of the dragged element</p> %}
    }
    }
    *)
  method afterDragOver : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> unit Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
while the dragged item is over the drop target by providing an implementation.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t] {% <p>The id of the dragged element</p> %}
    }
    }
    *)
  method afterInvalidDrop : Dom_html.event Js.t -> Js.js_string Js.t -> unit
    Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
after an invalid drop has occurred by providing an implementation.</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t] {% <p>The id of the dropped element</p> %}
    }
    }
    *)
  method afterValidDrop : _ Js.t -> Dom_html.event Js.t -> Js.js_string Js.t
    -> unit Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
after a valid drop has occurred by providing an implementation.</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t]
    {% <p>The target DD</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t] {% <p>The id of the dropped element</p> %}
    }
    }
    *)
  method alignElWithMouse : Dom_html.element Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  (** {% <p>Sets the element to the location of the mousedown or click event,
maintaining the cursor location relative to the location on the element
that was clicked.  Override this if you want to place the element in a
location other than where the cursor is.</p> %}
    
    {b Parameters}:
    {ul {- el: [Dom_html.element Js.t]
    {% <p>the element to move</p> %}
    }
    {- iPageX: [Js.number Js.t]
    {% <p>the X coordinate of the mousedown or drag event</p> %}
    }
    {- iPageY: [Js.number Js.t]
    {% <p>the Y coordinate of the mousedown or drag event</p> %}
    }
    }
    *)
  method beforeDragDrop : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action before the dragged
item is dropped onto the target and optionally cancel the onDragDrop.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t]
    {% <p>The id of the dragged element</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>isValid True if the drag drop event is valid, else false to cancel</p> %}
    }
    }
    *)
  method beforeDragEnter : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
before the dragged item enters the drop target and optionally cancel the onDragEnter.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t]
    {% <p>The id of the dragged element</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>isValid True if the drag event is valid, else false to cancel</p> %}
    }
    }
    *)
  method beforeDragOut : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action before the dragged
item is dragged out of the target without dropping, and optionally cancel the onDragOut.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t]
    {% <p>The id of the dragged element</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>isValid True if the drag event is valid, else false to cancel</p> %}
    }
    }
    *)
  method beforeDragOver : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t ->
    Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action
while the dragged item is over the drop target and optionally cancel the onDragOver.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t]
    {% <p>The id of the dragged element</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>isValid True if the drag event is valid, else false to cancel</p> %}
    }
    }
    *)
  method beforeInvalidDrop : #Ext_dd_DragDrop.t Js.t -> Dom_html.event Js.t
    -> Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action after an invalid
drop has occurred.</p> %}
    
    {b Parameters}:
    {ul {- target: [#Ext_dd_DragDrop.t Js.t]
    {% <p>The drop target</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    {- id: [Js.js_string Js.t]
    {% <p>The id of the dragged element</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>isValid True if the invalid drop should proceed, else false to cancel</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroy this DragDrop instance</p> %}
    *)
  method getDragData : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Returns the data object associated with this drag source</p> %}
    
    {b Parameters}:
    {ul {- e: [_ Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>data An object containing arbitrary data</p> %}
    }
    }
    *)
  method getProxy : Ext_dd_StatusProxy.t Js.t Js.meth
  (** {% <p>Returns the drag source's underlying <a href="#!/api/Ext.dd.StatusProxy" rel="Ext.dd.StatusProxy" class="docClass">Ext.dd.StatusProxy</a></p> %}
    
    {b Returns}:
    {ul {- [Ext_dd_StatusProxy.t Js.t] {% <p>proxy The StatusProxy</p> %}
    }
    }
    *)
  method hideProxy : unit Js.meth
  (** {% <p>Hides the drag source's <a href="#!/api/Ext.dd.StatusProxy" rel="Ext.dd.StatusProxy" class="docClass">Ext.dd.StatusProxy</a></p> %}
    *)
  method onBeforeDrag : _ Js.t -> Dom_html.event Js.t -> bool Js.t Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action before the initial
drag event begins and optionally cancel it.</p> %}
    
    {b Parameters}:
    {ul {- data: [_ Js.t]
    {% <p>An object containing arbitrary data to be shared with drop targets</p> %}
    }
    {- e: [Dom_html.event Js.t]
    {% <p>The event object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>isValid True if the drag event is valid, else false to cancel</p> %}
    }
    }
    *)
  method onStartDrag : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>An empty function by default, but provided so that you can perform a custom action once the initial
drag event has begun.  The drag cannot be canceled from this function.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>The x position of the click on the dragged object</p> %}
    }
    {- y: [Js.number Js.t]
    {% <p>The y position of the click on the dragged object</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_dd_DDProxy.configs
  
  method animRepair : bool Js.t Js.prop
  (** {% <p>If true, animates the proxy element back to the position of the handle element used to trigger the drag.</p> %}
    
    Defaults to: [true]
    *)
  method ddGroup : Js.js_string Js.t Js.prop
  (** {% <p>A named drag drop group to which this object belongs.  If a group is specified, then this object will only
interact with other drag drop objects in the same group.</p> %}
    *)
  method dropAllowed : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class returned to the drag source when drop is allowed.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'dd-drop-ok']
    *)
  method dropNotAllowed : Js.js_string Js.t Js.prop
  (** {% <p>The CSS class returned to the drag source when drop is not allowed.</p> %}
    
    Defaults to: [Ext.baseCSSPrefix + 'dd-drop-nodrop']
    *)
  method repairHighlightColor : Js.js_string Js.t Js.prop
  (** {% <p>The color to use when visually highlighting the drag source in the afterRepair
method after a failed drop (defaults to light blue). The color must be a 6 digit hex value, without
a preceding '#'.</p> %}
    
    Defaults to: ['c3daf9']
    *)
  method beforeDragDrop : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDragDrop] *)
  method beforeDragEnter : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDragEnter] *)
  method beforeDragOut : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDragOut] *)
  method beforeDragOver : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeDragOver] *)
  method beforeInvalidDrop : ('self Js.t, #Ext_dd_DragDrop.t Js.t ->
    Dom_html.event Js.t -> Js.js_string Js.t -> bool Js.t) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.beforeInvalidDrop] *)
  method onBeforeDrag : ('self Js.t, _ Js.t -> Dom_html.event Js.t ->
    bool Js.t) Js.meth_callback Js.writeonly_prop
  (** See method [t.onBeforeDrag] *)
  method onStartDrag : ('self Js.t, Js.number Js.t -> Js.number Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.onStartDrag] *)
  
end

class type events =
object
  inherit Ext_dd_DDProxy.events
  
  
end

class type statics =
object
  inherit Ext_dd_DDProxy.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

