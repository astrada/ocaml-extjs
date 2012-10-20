(** Defines the interface and base operation of items ...
  
  {% <p>Defines the interface and base operation of items that that can be
dragged or can be drop targets.  It was designed to be extended, overriding
the event handlers for startDrag, onDrag, onDragOver and onDragOut.
Up to three html elements can be associated with a DragDrop instance:</p>

<ul>
<li><p>linked element: the element that is passed into the constructor.
This is the element which defines the boundaries for interaction with
other DragDrop objects.</p></li>
<li><p>handle element(s): The drag operation only occurs if the element that
was clicked matches a handle element.  By default this is the linked
element, but there are times that you will want only a portion of the
linked element to initiate the drag operation, and the setHandleElId()
method provides a way to define this.</p></li>
<li><p>drag element: this represents the element that would be moved along
with the cursor during a drag operation.  By default, this is the linked
element itself as in <a href="#!/api/Ext.dd.DD" rel="Ext.dd.DD" class="docClass">Ext.dd.DD</a>.  setDragElId() lets you define
a separate element that would be moved, as in <a href="#!/api/Ext.dd.DDProxy" rel="Ext.dd.DDProxy" class="docClass">Ext.dd.DDProxy</a>.</p></li>
</ul>


<p>This class should not be instantiated until the onload event to ensure that
the associated elements are available.
The following would define a DragDrop obj that would interact with any
other DragDrop obj in the "group1" group:</p>

<pre><code>dd = new <a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a>("div1", "group1");
</code></pre>

<p>Since none of the event handlers have been implemented, nothing would
actually happen if you were to run the code above.  Normally you would
override this class or one of the default implementations, but you can
also override the methods you want on an instance of the class...</p>

<pre><code>dd.onDragDrop = function(e, id) {
    alert("dd was dropped on " + id);
}
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method available : bool Js.t Js.prop
  (** {% <p>The available property is false until the linked dom element is accessible.</p> %}
    
    Defaults to: [false]
    *)
  method config : _ Js.t Js.prop
  (** {% <p>Configuration attributes passed into the constructor</p> %}
    *)
  method defaultPadding : _ Js.t Js.prop
  (** {% <p>Provides default constraint padding to "constrainTo" elements.</p> %}
    
    Defaults to: [{left: 0, right: 0, top: 0, bottom: 0}]
    *)
  method groups : _ Js.t Js.prop
  (** {% <p>The group defines a logical collection of DragDrop objects that are
related.  Instances only get events when interacting with other
DragDrop object in the same group.  This lets us define multiple
groups using a single DragDrop subclass if we want.</p>

<p>An object in the format {'group1':true, 'group2':true}</p> %}
    *)
  method hasOuterHandles : bool Js.t Js.prop
  (** {% <p>By default, drags can only be initiated if the mousedown occurs in the
region the linked element is.  This is done in part to work around a
bug in some browsers that mis-report the mousedown if the previous
mouseup happened outside of the window.  This property is set to true
if outer handles are defined. Defaults to false.</p> %}
    
    Defaults to: [false]
    *)
  method id : Js.js_string Js.t Js.prop
  (** {% <p>The id of the element associated with this object.  This is what we
refer to as the "linked element" because the size and position of
this element is used to determine when the drag and drop objects have
interacted.</p> %}
    *)
  method ignoreSelf : bool Js.t Js.prop
  (** {% <p>Set to false to enable a DragDrop object to fire drag events while dragging
over its own Element. Defaults to true - DragDrop objects do not by default
fire drag events to themselves.</p> %}
    *)
  method invalidHandleClasses : Js.js_string Js.t Js.js_array Js.t Js.prop
  (** {% <p>An Array of CSS class names for elements to be considered in valid as drag handles.</p> %}
    *)
  method invalidHandleIds : _ Js.t Js.prop
  (** {% <p>An object who's property names identify the IDs of elements to be considered invalid as drag handles.
A non-null property value identifies the ID as invalid. For example, to prevent
dragging from being initiated on element ID "foo", use:</p>

<pre><code>{
    foo: true
}
</code></pre> %}
    *)
  method invalidHandleTypes : _ Js.t Js.prop
  (** {% <p>An object who's property names identify HTML tags to be considered invalid as drag handles.
A non-null property value identifies the tag as invalid. Defaults to the
following value which prevents drag operations from being initiated by <code>&lt;a&gt;</code> elements:</p>

<pre><code>{
    A: "A"
}
</code></pre> %}
    *)
  method isTarget : bool Js.t Js.prop
  (** {% <p>By default, all instances can be a drop target.  This can be disabled by
setting isTarget to false.</p> %}
    
    Defaults to: [true]
    *)
  method maintainOffset : bool Js.t Js.prop
  (** {% <p>Maintain offsets when we resetconstraints.  Set to true when you want
the position of the element relative to its parent to stay the same
when the page changes</p> %}
    
    Defaults to: [false]
    *)
  method moveOnly : bool Js.t Js.prop
  (** {% <p>When set to true, other DD objects in cooperating DDGroups do not receive
notification events when this DD object is dragged over them.</p> %}
    
    Defaults to: [false]
    *)
  method padding : Js.number Js.t Js.js_array Js.t Js.prop
  (** {% <p>The padding configured for this drag and drop object for calculating
the drop zone intersection with this object.
An array containing the 4 padding values: [top, right, bottom, left]</p> %}
    *)
  method primaryButtonOnly : bool Js.t Js.prop
  (** {% <p>By default the drag and drop instance will only respond to the primary
button click (left button for a right-handed mouse).  Set to true to
allow drag and drop to start with any mouse click that is propogated
by the browser</p> %}
    
    Defaults to: [true]
    *)
  method xTicks : Js.number Js.t Js.js_array Js.t Js.prop
  (** {% <p>Array of pixel locations the element will snap to if we specified a
horizontal graduation/interval.  This array is generated automatically
when you define a tick interval.</p> %}
    *)
  method yTicks : Js.number Js.t Js.js_array Js.t Js.prop
  (** {% <p>Array of pixel locations the element will snap to if we specified a
vertical graduation/interval.  This array is generated automatically
when you define a tick interval.</p> %}
    *)
  method addInvalidHandleClass : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Lets you specify a css class of elements that will not initiate a drag</p> %}
    
    {b Parameters}:
    {ul {- cssClass: [Js.js_string Js.t]
    {% <p>the class of the elements you wish to ignore</p> %}
    }
    }
    *)
  method addInvalidHandleId : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Lets you to specify an element id for a child of a drag handle
that should not initiate a drag</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the element id of the element you wish to ignore</p> %}
    }
    }
    *)
  method addInvalidHandleType : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Allows you to specify a tag name that should not start a drag operation
when clicked.  This is designed to facilitate embedding links within a
drag handle that do something other than start the drag.</p> %}
    
    {b Parameters}:
    {ul {- tagName: [Js.js_string Js.t]
    {% <p>the type of element to exclude</p> %}
    }
    }
    *)
  method addToGroup : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Adds this instance to a group of related drag/drop objects.  All
instances belong to at least one group, and can belong to as many
groups as needed.</p> %}
    
    {b Parameters}:
    {ul {- sGroup: [Js.js_string Js.t] {% <p>the name of the group</p> %}
    }
    }
    *)
  method applyConfig : unit Js.meth
  (** {% <p>Applies the configuration parameters that were passed into the constructor.
This is supposed to happen at each level through the inheritance chain.  So
a DDProxy implentation will execute apply config on DDProxy, DD, and
DragDrop in order to get all of the parameters that are available in
each object.</p> %}
    *)
  method clearConstraints : unit Js.meth
  (** {% <p>Clears any constraints applied to this instance.  Also clears ticks
since they can't exist independent of a constraint at this time.</p> %}
    *)
  method clearTicks : unit Js.meth
  (** {% <p>Clears any tick interval defined for this instance</p> %}
    *)
  method constrainTo : _ Js.t -> _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Initializes the drag drop object's constraints to restrict movement to a certain element.</p>

<p>Usage:</p>

<pre><code>var dd = new <a href="#!/api/Ext.dd.DDProxy" rel="Ext.dd.DDProxy" class="docClass">Ext.dd.DDProxy</a>("dragDiv1", "proxytest",
               { dragElId: "existingProxyDiv" });
dd.startDrag = function(){
    this.constrainTo("parent-id");
};
</code></pre>

<p>Or you can initalize it using the <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> object:</p>

<pre><code><a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>("dragDiv1").initDDProxy("proxytest", {dragElId: "existingProxyDiv"}, {
    startDrag : function(){
        this.constrainTo("parent-id");
    }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- constrainTo: [_ Js.t]
    {% <p>The element or element ID to constrain to.</p> %}
    }
    {- pad: [_ Js.t] (optional)
    {% <p>Pad provides a way to specify "padding" of the constraints,
and can be either a number for symmetrical padding (4 would be equal to <code>{left:4, right:4, top:4, bottom:4}</code>) or
an object containing the sides to pad. For example: <code>{right:10, bottom:10}</code></p> %}
    }
    {- inContent: [bool Js.t] (optional)
    {% <p>Constrain the draggable in the content box of the element (inside padding and borders)</p> %}
    }
    }
    *)
  method endDrag : Dom_html.event Js.t -> unit Js.meth
  (** {% <p>Called when we are done dragging the object</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>the mouseup event</p> %}
    }
    }
    *)
  method getDragEl : Dom_html.element Js.t Js.meth
  (** {% <p>Returns a reference to the actual element to drag.  By default this is
the same as the html element, but it can be assigned to another
element. An example of this can be found in <a href="#!/api/Ext.dd.DDProxy" rel="Ext.dd.DDProxy" class="docClass">Ext.dd.DDProxy</a></p> %}
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t] {% <p>the html element</p> %}
    }
    }
    *)
  method getEl : Dom_html.element Js.t Js.meth
  (** {% <p>Returns a reference to the linked element</p> %}
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t] {% <p>the html element</p> %}
    }
    }
    *)
  method init : Js.js_string Js.t -> Js.js_string Js.t -> _ Js.t -> unit
    Js.meth
  (** {% <p>Sets up the DragDrop object.  Must be called in the constructor of any
<a href="#!/api/Ext.dd.DragDrop" rel="Ext.dd.DragDrop" class="docClass">Ext.dd.DragDrop</a> subclass</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the id of the linked element</p> %}
    }
    {- sGroup: [Js.js_string Js.t]
    {% <p>the group of related items</p> %}
    }
    {- config: [_ Js.t] {% <p>configuration attributes</p> %}
    }
    }
    *)
  method initTarget : Js.js_string Js.t -> Js.js_string Js.t -> _ Js.t ->
    unit Js.meth
  (** {% <p>Initializes Targeting functionality only... the object does not
get a mousedown handler.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the id of the linked element</p> %}
    }
    {- sGroup: [Js.js_string Js.t]
    {% <p>the group of related items</p> %}
    }
    {- config: [_ Js.t] {% <p>configuration attributes</p> %}
    }
    }
    *)
  method isLocked : bool Js.t Js.meth
  (** {% <p>Returns true if this instance is locked, or the drag drop mgr is locked
(meaning that all drag/drop is disabled on the page.)</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>true if this obj or all drag/drop is locked, else
false</p> %}
    }
    }
    *)
  method isValidHandleChild : Dom_html.element Js.t -> bool Js.t Js.meth
  (** {% <p>Checks the tag exclusion list to see if this click should be ignored</p> %}
    
    {b Parameters}:
    {ul {- node: [Dom_html.element Js.t]
    {% <p>the HTMLElement to evaluate</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>true if this is a valid tag type, false if not</p> %}
    }
    }
    *)
  method lock : unit Js.meth
  (** {% <p>Locks this instance</p> %}
    *)
  method onAvailable : unit Js.meth
  (** {% <p>Override the onAvailable method to do what is needed after the initial
position was determined.</p> %}
    *)
  method onDrag : Dom_html.event Js.t -> unit Js.meth
  (** {% <p>Abstract method called during the onMouseMove event while dragging an
object.</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>the mousemove event</p> %}
    }
    }
    *)
  method onDragDrop : Dom_html.event Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Abstract method called when this item is dropped on another DragDrop
obj</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t]
    {% <p>the mouseup event</p> %}
    }
    {- id: [_ Js.t]
    {% <p>In POINT mode, the element
id this was dropped on.  In INTERSECT mode, an array of dd items this
was dropped on.</p> %}
    }
    }
    *)
  method onDragEnter : Dom_html.event Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Abstract method called when this element fist begins hovering over
another DragDrop obj</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t]
    {% <p>the mousemove event</p> %}
    }
    {- id: [_ Js.t]
    {% <p>In POINT mode, the element
id this is hovering over.  In INTERSECT mode, an array of one or more
dragdrop items being hovered over.</p> %}
    }
    }
    *)
  method onDragOut : Dom_html.event Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Abstract method called when we are no longer hovering over an element</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t]
    {% <p>the mousemove event</p> %}
    }
    {- id: [_ Js.t]
    {% <p>In POINT mode, the element
id this was hovering over.  In INTERSECT mode, an array of dd items
that the mouse is no longer over.</p> %}
    }
    }
    *)
  method onDragOver : Dom_html.event Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Abstract method called when this element is hovering over another
DragDrop obj</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t]
    {% <p>the mousemove event</p> %}
    }
    {- id: [_ Js.t]
    {% <p>In POINT mode, the element
id this is hovering over.  In INTERSECT mode, an array of dd items
being hovered over.</p> %}
    }
    }
    *)
  method onInvalidDrop : Dom_html.event Js.t -> unit Js.meth
  (** {% <p>Abstract method called when this item is dropped on an area with no
drop target</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>the mouseup event</p> %}
    }
    }
    *)
  method onMouseDown : Dom_html.event Js.t -> unit Js.meth
  (** {% <p>Called when a drag/drop obj gets a mousedown</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>the mousedown event</p> %}
    }
    }
    *)
  method onMouseUp : Dom_html.event Js.t -> unit Js.meth
  (** {% <p>Called when a drag/drop obj gets a mouseup</p> %}
    
    {b Parameters}:
    {ul {- e: [Dom_html.event Js.t] {% <p>the mouseup event</p> %}
    }
    }
    *)
  method removeFromGroup : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Removes this instance from the supplied interaction group</p> %}
    
    {b Parameters}:
    {ul {- sGroup: [Js.js_string Js.t] {% <p>The group to drop</p> %}
    }
    }
    *)
  method removeInvalidHandleClass : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Unsets an invalid css class</p> %}
    
    {b Parameters}:
    {ul {- cssClass: [Js.js_string Js.t]
    {% <p>the class of the element(s) you wish to
re-enable</p> %}
    }
    }
    *)
  method removeInvalidHandleId : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Unsets an invalid handle id</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the id of the element to re-enable</p> %}
    }
    }
    *)
  method removeInvalidHandleType : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Unsets an excluded tag name set by addInvalidHandleType</p> %}
    
    {b Parameters}:
    {ul {- tagName: [Js.js_string Js.t]
    {% <p>the type of element to unexclude</p> %}
    }
    }
    *)
  method resetConstraints : bool Js.t -> unit Js.meth
  (** {% <p>Must be called if you manually reposition a dd element.</p> %}
    
    {b Parameters}:
    {ul {- maintainOffset: [bool Js.t]
    }
    }
    *)
  method setDragElId : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Allows you to specify that an element other than the linked element
will be moved with the cursor during a drag</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the id of the element that will be used to initiate the drag</p> %}
    }
    }
    *)
  method setHandleElId : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Allows you to specify a child of the linked element that should be
used to initiate the drag operation.  An example of this would be if
you have a content div with text and links.  Clicking anywhere in the
content area would normally start the drag operation.  Use this method
to specify that an element inside of the content div is the element
that starts the drag operation.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the id of the element that will be used to
initiate the drag.</p> %}
    }
    }
    *)
  method setInitPosition : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Stores the initial placement of the linked element.</p> %}
    
    {b Parameters}:
    {ul {- diffX: [Js.number Js.t]
    {% <p>the X offset, default 0</p> %}
    }
    {- diffY: [Js.number Js.t] {% <p>the Y offset, default 0</p> %}
    }
    }
    *)
  method setOuterHandleElId : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Allows you to set an element outside of the linked element as a drag
handle</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>the id of the element that will be used to initiate the drag</p> %}
    }
    }
    *)
  method setPadding : Js.number Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t -> unit Js.meth
  (** {% <p>Configures the padding for the target zone in px.  Effectively expands
(or reduces) the virtual object size for targeting calculations.
Supports css-style shorthand; if only one parameter is passed, all sides
will have that padding, and if only two are passed, the top and bottom
will have the first param, the left and right the second.</p> %}
    
    {b Parameters}:
    {ul {- iTop: [Js.number Js.t]
    {% <p>Top pad</p> %}
    }
    {- iRight: [Js.number Js.t]
    {% <p>Right pad</p> %}
    }
    {- iBot: [Js.number Js.t] {% <p>Bot pad</p> %}
    }
    {- iLeft: [Js.number Js.t] {% <p>Left pad</p> %}
    }
    }
    *)
  method setXConstraint : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t Js.optdef -> unit Js.meth
  (** {% <p>By default, the element can be dragged any place on the screen.  Use
this method to limit the horizontal travel of the element.  Pass in
0,0 for the parameters if you want to lock the drag to the y axis.</p> %}
    
    {b Parameters}:
    {ul {- iLeft: [Js.number Js.t]
    {% <p>the number of pixels the element can move to the left</p> %}
    }
    {- iRight: [Js.number Js.t]
    {% <p>the number of pixels the element can move to the
right</p> %}
    }
    {- iTickSize: [Js.number Js.t] (optional)
    {% <p>parameter for specifying that the
element should move iTickSize pixels at a time.</p> %}
    }
    }
    *)
  method setYConstraint : Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t Js.optdef -> unit Js.meth
  (** {% <p>By default, the element can be dragged any place on the screen.  Set
this to limit the vertical travel of the element.  Pass in 0,0 for the
parameters if you want to lock the drag to the x axis.</p> %}
    
    {b Parameters}:
    {ul {- iUp: [Js.number Js.t]
    {% <p>the number of pixels the element can move up</p> %}
    }
    {- iDown: [Js.number Js.t]
    {% <p>the number of pixels the element can move down</p> %}
    }
    {- iTickSize: [Js.number Js.t] (optional)
    {% <p>parameter for specifying that the
element should move iTickSize pixels at a time.</p> %}
    }
    }
    *)
  method startDrag : Js.number Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Abstract method called after a drag/drop object is clicked
and the drag or mousedown time thresholds have beeen met.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>click location</p> %}
    }
    {- y: [Js.number Js.t] {% <p>click location</p> %}
    }
    }
    *)
  method toString : Js.js_string Js.t Js.meth
  (** {% <p>toString method</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>string representation of the dd obj</p> %}
    }
    }
    *)
  method unlock : unit Js.meth
  (** {% <p>Unlocks this instace</p> %}
    *)
  method unreg : unit Js.meth
  (** {% <p>Removes all drag and drop hooks for this element</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

