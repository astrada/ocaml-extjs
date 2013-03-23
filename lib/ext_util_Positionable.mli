(** This mixin provides a common interface for objects ...
  
  {% <p>This mixin provides a common interface for objects that can be positioned, e.g.
<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Components</a> and <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Elements</a></p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method alignTo : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Aligns the element with another element relative to the specified anchor points. If
the other element is the document it aligns it to the viewport. The position
parameter is optional, and can be specified in any one of the following formats:</p>

<ul>
<li><strong>Blank</strong>: Defaults to aligning the element's top-left corner to the target's
bottom-left corner ("tl-bl").</li>
<li><strong>One anchor (deprecated)</strong>: The passed anchor position is used as the target
element's anchor point.  The element being aligned will position its top-left
corner (tl) to that point. <em>This method has been deprecated in favor of the newer
two anchor syntax below</em>.</li>
<li><strong>Two anchors</strong>: If two values from the table below are passed separated by a dash,
the first value is used as the element's anchor point, and the second value is
used as the target's anchor point.</li>
</ul>


<p>In addition to the anchor points, the position parameter also supports the "?"
character. If "?" is passed at the end of the position string, the element will
attempt to align as specified, but the position will be adjusted to constrain to
the viewport if necessary. Note that the element being aligned might be swapped to
align to a different position than that specified in order to enforce the viewport
constraints. Following are all of the supported anchor positions:</p>

<pre>Value  Description
-----  -----------------------------
tl     The top left corner (default)
t      The center of the top edge
tr     The top right corner
l      The center of the left edge
c      In the center of the element
r      The center of the right edge
bl     The bottom left corner
b      The center of the bottom edge
br     The bottom right corner
</pre>


<p>Example Usage:</p>

<pre><code>// align el to other-el using the default positioning
// ("tl-bl", non-constrained)
el.alignTo("other-el");

// align the top left corner of el with the top right corner of other-el
// (constrained to viewport)
el.alignTo("other-el", "tr?");

// align the bottom right corner of el with the center left edge of other-el
el.alignTo("other-el", "br-l?");

// align the center of el with the bottom left corner of other-el and
// adjust the x position by -6 pixels (and the y position by 0)
el.alignTo("other-el", "c-bl", [-6, 0]);
</code></pre> %}
    
    {b Parameters}:
    {ul {- element: [_ Js.t]
    {% <p>The Positionable,
HTMLElement, or id of the element to align to.</p> %}
    }
    {- position: [Js.js_string Js.t] (optional)
    {% <p>The position to align to</p> %}
    
    Defaults to: "tl-bl?"
    }
    {- offsets: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>Offset the positioning by [x, y]</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method anchorTo : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> _ Js.callback Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Anchors an element to another element and realigns it when the window is resized.</p> %}
    
    {b Parameters}:
    {ul {- element: [_ Js.t]
    {% <p>The Positionable,
HTMLElement, or id of the element to align to.</p> %}
    }
    {- position: [Js.js_string Js.t] (optional)
    {% <p>The position to align to</p> %}
    
    Defaults to: "tl-bl?"
    }
    {- offsets: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>Offset the positioning by [x, y]</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard
Element animation config object</p> %}
    }
    {- monitorScroll: [_ Js.t] (optional)
    {% <p>True to monitor body scroll and
reposition. If this parameter is a number, it is used as the buffer delay in
milliseconds.</p> %}
     Defaults to: 50
    }
    {- callback: [_ Js.callback] (optional)
    {% <p>The function to call after the animation finishes</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method calculateConstrainedPosition : _ Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Calculates the new [x,y] position to move this Positionable into a constrain region.</p>

<p>By default, this Positionable is constrained to be within the container it was added to, or the element it was
rendered to.</p>

<p>Priority is given to constraining the top and left within the constraint.</p>

<p>An alternative constraint may be passed.</p> %}
    
    {b Parameters}:
    {ul {- constrainTo: [_ Js.t] (optional)
    {% <p>The Element or <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Region</a>
into which this Component is to be constrained. Defaults to the element into which this Positionable
was rendered, or this Component's \{\@link <a href="#!/api/Ext.Component-cfg-constrainTo" rel="Ext.Component-cfg-constrainTo" class="docClass">Ext.Component.constrainTo</a>.</p> %}
    }
    {- proposedPosition: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>A proposed <code>[X, Y]</code> position to test for validity
and to coerce into constraints instead of using this Positionable's current position.</p> %}
    }
    {- local: [bool Js.t] (optional)
    {% <p>The proposedPosition is local <em>(relative to floatParent if a floating Component)</em></p> %}
    }
    {- proposedSize: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>A proposed <code>[width, height]</code> size to use when calculating
constraints instead of using this Positionable's current size.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p><strong>If</strong> the element <em>needs</em> to be translated, the new <code>[X, Y]</code> position within
constraints if possible, giving priority to keeping the top and left edge in the constrain region.
Otherwise, <code>false</code>.</p> %}
    }
    }
    *)
  method getAlignToXY : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets the x,y coordinates to align this element with another element. See
<a href="#!/api/Ext.util.Positionable-method-alignTo" rel="Ext.util.Positionable-method-alignTo" class="docClass">alignTo</a> for more info on the supported position values.</p> %}
    
    {b Parameters}:
    {ul {- element: [_ Js.t]
    {% <p>The Positionable,
HTMLElement, or id of the element to align to.</p> %}
    }
    {- position: [Js.js_string Js.t] (optional)
    {% <p>The position to align to</p> %}
    
    Defaults to: "tl-bl?"
    }
    {- offsets: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>Offset the positioning by [x, y]</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t] {% <p>[x, y]</p> %}
    }
    }
    *)
  method getAnchorXY : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    _ Js.t Js.optdef -> Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets the x,y coordinates specified by the anchor position on the element.</p> %}
    
    {b Parameters}:
    {ul {- anchor: [Js.js_string Js.t] (optional)
    {% <p>The specified anchor position.
See <a href="#!/api/Ext.util.Positionable-method-alignTo" rel="Ext.util.Positionable-method-alignTo" class="docClass">alignTo</a> for details on supported anchor positions.</p> %}
     Defaults to: 'tl'
    }
    {- local: [bool Js.t] (optional)
    {% <p>True to get the local (element top/left-relative) anchor
position instead of page coordinates</p> %}
    }
    {- size: [_ Js.t] (optional)
    {% <p>An object containing the size to use for calculating anchor
position \{width: (target width), height: (target height)\} (defaults to the
element's current size)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>[x, y] An array containing the element's x and y coordinates</p> %}
    }
    }
    *)
  method getBox : bool Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Return an object defining the area of this Element which can be passed to
<a href="#!/api/Ext.util.Positionable-method-setBox" rel="Ext.util.Positionable-method-setBox" class="docClass">setBox</a> to set another Element's size/location to match this element.</p> %}
    
    {b Parameters}:
    {ul {- contentBox: [bool Js.t] (optional)
    {% <p>If true a box for the content of the element is
returned.</p> %}
    }
    {- local: [bool Js.t] (optional)
    {% <p>If true the element's left and top relative to its
<code>offsetParent</code> are returned instead of page x/y.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>box An object in the format:</p>

<pre><code>\{
    x: &lt;Element's X position&gt;,
    y: &lt;Element's Y position&gt;,
    left: &lt;Element's X position (an alias for x)&gt;,
    top: &lt;Element's Y position (an alias for y)&gt;,
    width: &lt;Element's width&gt;,
    height: &lt;Element's height&gt;,
    bottom: &lt;Element's lower bound&gt;,
    right: &lt;Element's rightmost bound&gt;
\}
</code></pre>

<p>The returned object may also be addressed as an Array where index 0 contains the X
position and index 1 contains the Y position. The result may also be used for
<a href="#!/api/Ext.util.Positionable-method-setXY" rel="Ext.util.Positionable-method-setXY" class="docClass">setXY</a></p> %}
    }
    }
    *)
  method getConstrainVector : _ Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef ->
    Js.number Js.t Js.js_array Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Returns the <code>[X, Y]</code> vector by which this Positionable's element must be translated to make a best
attempt to constrain within the passed constraint. Returns <code>false</code> if the element
does not need to be moved.</p>

<p>Priority is given to constraining the top and left within the constraint.</p>

<p>The constraint may either be an existing element into which the element is to be
constrained, or a <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Region</a> into which this element is to be
constrained.</p>

<p>By default, any extra shadow around the element is <strong>not</strong> included in the constrain calculations - the edges
of the element are used as the element bounds. To constrain the shadow within the constrain region, set the
<code>constrainShadow</code> property on this element to <code>true</code>.</p> %}
    
    {b Parameters}:
    {ul {- constrainTo: [_ Js.t] (optional)
    {% <p>The
Positionable, HTMLElement, element id, or Region into which the element is to be
constrained.</p> %}
    }
    {- proposedPosition: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>A proposed <code>[X, Y]</code> position to test for validity
and to produce a vector for instead of using the element's current position</p> %}
    }
    {- proposedSize: [Js.number Js.t Js.js_array Js.t] (optional)
    {% <p>A proposed <code>[width, height]</code> size to constrain
instead of using the element's current size</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p><strong>If</strong> the element <em>needs</em> to be translated, an <code>[X, Y]</code>
vector by which this element must be translated. Otherwise, <code>false</code>.</p> %}
    }
    }
    *)
  method getLocalX : Js.number Js.t Js.meth
  (** {% <p>Returns the x coordinate of this element reletive to its <code>offsetParent</code>.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The local x coordinate</p> %}
    }
    }
    *)
  method getLocalXY : Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Returns the x and y coordinates of this element relative to its <code>offsetParent</code>.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The local XY position of the element</p> %}
    }
    }
    *)
  method getLocalY : Js.number Js.t Js.meth
  (** {% <p>Returns the y coordinate of this element reletive to its <code>offsetParent</code>.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The local y coordinate</p> %}
    }
    }
    *)
  method getOffsetsTo : _ Js.t -> Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Returns the offsets of this element from the passed element. The element must both
be part of the DOM tree and not have display:none to have page coordinates.</p> %}
    
    {b Parameters}:
    {ul {- offsetsTo: [_ Js.t]
    {% <p>The Positionable,
HTMLElement, or element id to get get the offsets from.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The XY page offsets (e.g. <code>[100, -200]</code>)</p> %}
    }
    }
    *)
  method getRegion : Ext_util_Region.t Js.t Js.meth
  (** {% <p>Returns a region object that defines the area of this element.</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t]
    {% <p>A Region containing "top, left, bottom, right" properties.</p> %}
    }
    }
    *)
  method getViewRegion : Ext_util_Region.t Js.t Js.meth
  (** {% <p>Returns the <strong>content</strong> region of this element. That is the region within the borders
and padding.</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_Region.t Js.t]
    {% <p>A Region containing "top, left, bottom, right" member data.</p> %}
    }
    }
    *)
  method getX : Js.number Js.t Js.meth
  (** {% <p>Gets the current X position of the DOM element based on page coordinates.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The X position of the element</p> %}
    }
    }
    *)
  method getXY : Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets the current position of the DOM element based on page coordinates.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The XY position of the element</p> %}
    }
    }
    *)
  method getY : Js.number Js.t Js.meth
  (** {% <p>Gets the current Y position of the DOM element based on page coordinates.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The Y position of the element</p> %}
    }
    }
    *)
  method move : Js.js_string Js.t -> Js.number Js.t -> _ Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Move the element relative to its current position.</p> %}
    
    {b Parameters}:
    {ul {- direction: [Js.js_string Js.t]
    {% <p>Possible values are:</p>

<ul>
<li><code>"l"</code> (or <code>"left"</code>)</li>
<li><code>"r"</code> (or <code>"right"</code>)</li>
<li><code>"t"</code> (or <code>"top"</code>, or <code>"up"</code>)</li>
<li><code>"b"</code> (or <code>"bottom"</code>, or <code>"down"</code>)</li>
</ul> %}
    }
    {- distance: [Js.number Js.t]
    {% <p>How far to move the element in pixels</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard
Element animation config object</p> %}
    }
    }
    *)
  method removeAnchor : 'self Js.t Js.meth
  (** {% <p>Remove any anchor to this element. See <a href="#!/api/Ext.util.Positionable-method-anchorTo" rel="Ext.util.Positionable-method-anchorTo" class="docClass">anchorTo</a>.</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setBox : _ Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the element's box. If animate is true then x, y, width, and height will be
animated concurrently.</p> %}
    
    {b Parameters}:
    {ul {- box: [_ Js.t]
    {% <p>The box to fill \{x, y, width, height\}</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setLocalX : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the local x coordinate of this element using CSS style. When used on an
absolute positioned element this method is symmetrical with <a href="#!/api/Ext.util.Positionable-method-getLocalX" rel="Ext.util.Positionable-method-getLocalX" class="docClass">getLocalX</a>, but
may not be symmetrical when used on a relatively positioned element.</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>The x coordinate. A value of <code>null</code> sets the left style to 'auto'.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setLocalXY : _ Js.t -> Js.number Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Sets the local x and y coordinates of this element using CSS style. When used on an
absolute positioned element this method is symmetrical with <a href="#!/api/Ext.util.Positionable-method-getLocalXY" rel="Ext.util.Positionable-method-getLocalXY" class="docClass">getLocalXY</a>, but
may not be symmetrical when used on a relatively positioned element.</p> %}
    
    {b Parameters}:
    {ul {- x: [_ Js.t]
    {% <p>The x coordinate or an array containing [x, y]. A value of
<code>null</code> sets the left style to 'auto'</p> %}
    }
    {- y: [Js.number Js.t] (optional)
    {% <p>The y coordinate, required if x is not an array. A value of
<code>null</code> sets the top style to 'auto'</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setLocalY : Js.number Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the local y coordinate of this element using CSS style. When used on an
absolute positioned element this method is symmetrical with <a href="#!/api/Ext.util.Positionable-method-getLocalY" rel="Ext.util.Positionable-method-getLocalY" class="docClass">getLocalY</a>, but
may not be symmetrical when used on a relatively positioned element.</p> %}
    
    {b Parameters}:
    {ul {- y: [Js.number Js.t]
    {% <p>The y coordinate. A value of <code>null</code> sets the top style to 'auto'.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setRegion : Ext_util_Region.t Js.t -> _ Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Sets the element's position and size to the specified region. If animation is true
then width, height, x and y will be animated concurrently.</p> %}
    
    {b Parameters}:
    {ul {- region: [Ext_util_Region.t Js.t]
    {% <p>The region to fill</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>true for the default animation or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setX : Js.number Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the X position of the DOM element based on page coordinates.</p> %}
    
    {b Parameters}:
    {ul {- the: [Js.number Js.t]
    {% <p>X position</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>True for the default animation, or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setXY : Js.number Js.t Js.js_array Js.t -> _ Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Sets the position of the DOM element in page coordinates.</p> %}
    
    {b Parameters}:
    {ul {- pos: [Js.number Js.t Js.js_array Js.t]
    {% <p>Contains X &amp; Y [x, y] values for new position (coordinates
are page-based)</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>True for the default animation, or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setY : Js.number Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the Y position of the DOM element based on page coordinates.</p> %}
    
    {b Parameters}:
    {ul {- the: [Js.number Js.t]
    {% <p>Y position</p> %}
    }
    {- animate: [_ Js.t] (optional)
    {% <p>True for the default animation, or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_Positionable.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method translatePoints : _ Js.t -> Js.number Js.t Js.optdef -> _ Js.t
    Js.meth
  (** {% <p>Translates the passed page coordinates into left/top css values for the element</p> %}
    
    {b Parameters}:
    {ul {- x: [_ Js.t]
    {% <p>The page x or an array containing [x, y]</p> %}
    }
    {- y: [Js.number Js.t] (optional)
    {% <p>The page y, required if x is not an array</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object with left and top properties. e.g.
\{left: (value), top: (value)\}</p> %}
    }
    }
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

