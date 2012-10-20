(**  ...
  
  {%  %} *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method defaultUnit : Js.js_string Js.t Js.prop
  (** {% <p>The default unit to append to CSS values where a unit isn't provided.</p> %}
    
    Defaults to: ["px"]
    *)
  method dom : Dom_html.element Js.t Js.prop
  (** {% <p>The DOM element</p> %}
    *)
  method id : Js.js_string Js.t Js.prop
  (** {% <p>The DOM element ID</p> %}
    *)
  method addCls : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds one or more CSS classes to the element. Duplicate classes are automatically filtered out.</p> %}
    
    {b Parameters}:
    {ul {- className: ['a Js.t]
    {% <p>The CSS classes to add separated by space, or an array of classes</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method appendChild : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Appends the passed element(s) to this element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>This element</p> %}
    }
    }
    *)
  method appendTo : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Appends this element to the passed element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The new parent element.
The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>This element</p> %}
    }
    }
    *)
  method applyStyles : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>More flexible version of <a href="#!/api/Ext.dom.AbstractElement-method-setStyle" rel="Ext.dom.AbstractElement-method-setStyle" class="docClass">setStyle</a> for setting style properties.</p> %}
    
    {b Parameters}:
    {ul {- styles: ['a Js.t]
    {% <p>A style specification string, e.g. "width:100px", or object in the form {width:"100px"}, or
a function which returns such a specification.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method child : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Selects a single <em>direct</em> child based on the passed CSS selector (the selector should not contain an id).</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The CSS selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return the DOM node instead of <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The child <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> (or DOM node if returnDom = true)</p> %}
    }
    }
    *)
  method contains : 'a Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if this element is an ancestor of the passed element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The element to check</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this element is an ancestor of el, else false</p> %}
    }
    }
    *)
  method createChild : 'a Js.t -> Dom_html.element Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Creates the passed DomHelper config and appends it to this element or optionally inserts it before the passed child element.</p> %}
    
    {b Parameters}:
    {ul {- config: ['a Js.t]
    {% <p>DomHelper element config object.  If no tag is specified (e.g., {tag:'input'}) then a div will be
automatically generated with the specified attributes.</p> %}
    }
    {- insertBefore: [Dom_html.element Js.t]
    {% <p>a child element of this element</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>true to return the dom node instead of creating an Element</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t]
    {% <p>The new child element</p> %}
    }
    }
    *)
  method destroy : unit Js.meth
  (** {% <p>Alias to <a href="#!/api/Ext.dom.AbstractElement-method-remove" rel="Ext.dom.AbstractElement-method-remove" class="docClass">remove</a>.</p>

<p>Removes this element's dom reference. Note that event and cache removal is handled at <a href="#!/api/Ext-method-removeNode" rel="Ext-method-removeNode" class="docClass">Ext.removeNode</a></p> %}
    *)
  method down : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Selects a single child at any depth below this element based on the passed CSS selector (the selector should not contain an id).</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The CSS selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return the DOM node instead of <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The child <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> (or DOM node if returnDom = true)</p> %}
    }
    }
    *)
  method findParent : Js.js_string Js.t -> 'a Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  (** {% <p>Looks at this node and then at parent nodes for a match of the passed simple selector (e.g. div.some-class or span:first-child)</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The simple selector to test</p> %}
    }
    {- limit: ['a Js.t]
    {% <p>The max depth to search as a number or an element which causes the upward traversal to stop
and is <b>not</b> considered for inclusion as the result. (defaults to 50 || document.documentElement)</p> %}
    }
    {- returnEl: [bool Js.t]
    {% <p>True to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> object instead of DOM node</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t]
    {% <p>The matching DOM node (or null if no match was found)</p> %}
    }
    }
    *)
  method findParentNode : Js.js_string Js.t -> 'a Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  (** {% <p>Looks at parent nodes for a match of the passed simple selector (e.g. div.some-class or span:first-child)</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The simple selector to test</p> %}
    }
    {- limit: ['a Js.t]
    {% <p>The max depth to search as a number or an element which causes the upward traversal to stop
and is <b>not</b> considered for inclusion as the result. (defaults to 50 || document.documentElement)</p> %}
    }
    {- returnEl: [bool Js.t]
    {% <p>True to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> object instead of DOM node</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t]
    {% <p>The matching DOM node (or null if no match was found)</p> %}
    }
    }
    *)
  method first : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'a Js.t Js.meth
  (** {% <p>Gets the first child, skipping text nodes</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>Find the next sibling that matches the passed simple selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return a raw dom node instead of an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The first child or null</p> %}
    }
    }
    *)
  method getActiveElement : Dom_html.element Js.t Js.meth
  (** {% <p>Returns the active element in the DOM. If the browser supports activeElement
on the document, this is returned. If not, the focus is tracked and the active
element is maintained internally.</p> %}
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t]
    {% <p>The active (focused) element in the document.</p> %}
    }
    }
    *)
  method getAlignToXY : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    'b Js.js_array Js.t Js.optdef -> 'c Js.js_array Js.t Js.meth
  (** {% <p>Gets the x,y coordinates to align this element with another element. See <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.dom.Element.alignTo</a> for more info on the
supported position values.</p> %}
    
    {b Parameters}:
    {ul {- element: ['a Js.t]
    {% <p>The element to align to.</p> %}
    }
    {- position: [Js.js_string Js.t] {% <p>The position to align to.</p> %}
     Defaults to: "tl-bl?"
    }
    {- offsets: ['a Js.js_array Js.t]
    {% <p>Offset the positioning by [x, y]</p> %}
     Defaults to: [0,0]
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t] {% <p>[x, y]</p> %}
    }
    }
    *)
  method getAnchorXY : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'a Js.t Js.optdef -> 'b Js.js_array Js.t Js.meth
  (** {% <p>Gets the x,y coordinates specified by the anchor position on the element.</p> %}
    
    {b Parameters}:
    {ul {- anchor: [Js.js_string Js.t]
    {% <p>The specified anchor position (defaults to "c").  See <a href="#!/api/Ext.dom.Element-method-alignTo" rel="Ext.dom.Element-method-alignTo" class="docClass">Ext.dom.Element.alignTo</a>
for details on supported anchor positions.</p> %}
    }
    {- local: [bool Js.t]
    {% <p>True to get the local (element top/left-relative) anchor position instead
of page coordinates</p> %}
    }
    {- size: ['a Js.t]
    {% <p>An object containing the size to use for calculating anchor position
{width: (target width), height: (target height)} (defaults to the element's current size)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t]
    {% <p>[x, y] An array containing the element's x and y coordinates</p> %}
    }
    }
    *)
  method getAttribute : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  (** {% <p>Returns the value of an attribute from the element's underlying DOM node.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The attribute name</p> %}
    }
    {- namespace: [Js.js_string Js.t]
    {% <p>The namespace in which to look for the attribute</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The attribute value</p> %}
    }
    }
    *)
  method getBorderWidth : Js.js_string Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the width of the border(s) for the specified side(s)</p> %}
    
    {b Parameters}:
    {ul {- side: [Js.js_string Js.t]
    {% <p>Can be t, l, r, b or any combination of those to add multiple values. For example,
passing <code>'lr'</code> would get the border <strong>l</strong>eft width + the border <strong>r</strong>ight width.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The width of the sides passed added together</p> %}
    }
    }
    *)
  method getBottom : bool Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the bottom Y coordinate of the element (element Y position + element height)</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t]
    {% <p>True to get the local css position instead of page coordinate</p> %}
    }
    }
    *)
  method getBox : bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  (** {% <p>Return an object defining the area of this Element which can be passed to <a href="#!/api/Ext.dom.AbstractElement-method-setBox" rel="Ext.dom.AbstractElement-method-setBox" class="docClass">setBox</a> to
set another Element's size/location to match this element.</p> %}
    
    {b Parameters}:
    {ul {- contentBox: [bool Js.t]
    {% <p>If true a box for the content of the element is returned.</p> %}
    }
    {- local: [bool Js.t]
    {% <p>If true the element's left and top are returned instead of page x/y.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>box An object in the format:</p>

<pre><code>{
    x: &lt;Element's X position&gt;,
    y: &lt;Element's Y position&gt;,
    width: &lt;Element's width&gt;,
    height: &lt;Element's height&gt;,
    bottom: &lt;Element's lower bound&gt;,
    right: &lt;Element's rightmost bound&gt;
}
</code></pre>

<p>The returned object may also be addressed as an Array where index 0 contains the X position
and index 1 contains the Y position. So the result may also be used for <a href="#!/api/Ext.dom.AbstractElement-method-setXY" rel="Ext.dom.AbstractElement-method-setXY" class="docClass">setXY</a></p> %}
    }
    }
    *)
  method getById : Js.js_string Js.t -> bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Returns a child element of this element given its <code>id</code>.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The id of the desired child element.</p> %}
    }
    {- asDom: [bool Js.t]
    {% <p>True to return the DOM element, false to return a
wrapped Element object.</p> %}
     Defaults to: false
    }
    }
    *)
  method getHTML : unit Js.meth
  (** {% <p>Returns the innerHTML of an Element or an empty string if the element's
dom no longer exists.</p> %}
    *)
  method getHeight : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Returns the offset height of the element</p> %}
    
    {b Parameters}:
    {ul {- contentHeight: [bool Js.t]
    {% <p>true to get the height minus borders and padding</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The element's height</p> %}
    }
    }
    *)
  method getLeft : bool Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the left X coordinate</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t]
    {% <p>True to get the local css position instead of page coordinate</p> %}
    }
    }
    *)
  method getMargin : Js.js_string Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Returns an object with properties top, left, right and bottom representing the margins of this element unless sides is passed,
then it returns the calculated width of the sides (see getPadding)</p> %}
    
    {b Parameters}:
    {ul {- sides: [Js.js_string Js.t]
    {% <p>Any combination of l, r, t, b to get the sum of those sides</p> %}
    }
    }
    *)
  method getOffsetsTo : 'a Js.t -> 'b Js.js_array Js.t Js.meth
  (** {% <p>Returns the offsets of this element from the passed element. Both element must be part of the DOM
tree and not have display:none to have page coordinates.</p> %}
    
    {b Parameters}:
    {ul {- element: ['a Js.t]
    {% <p>The element to get the offsets from.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t]
    {% <p>The XY page offsets (e.g. [100, -200])</p> %}
    }
    }
    *)
  method getPadding : Js.js_string Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the width of the padding(s) for the specified side(s)</p> %}
    
    {b Parameters}:
    {ul {- side: [Js.js_string Js.t]
    {% <p>Can be t, l, r, b or any combination of those to add multiple values. For example,
passing <code>'lr'</code> would get the padding <strong>l</strong>eft + the padding <strong>r</strong>ight.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The padding of the sides passed added together</p> %}
    }
    }
    *)
  method getPageBox : bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Return an object defining the area of this Element which can be passed to <a href="#!/api/Ext.dom.AbstractElement-method-setBox" rel="Ext.dom.AbstractElement-method-setBox" class="docClass">setBox</a> to
set another Element's size/location to match this element.</p> %}
    
    {b Parameters}:
    {ul {- asRegion: [bool Js.t]
    {% <p>If true an <a href="#!/api/Ext.util.Region" rel="Ext.util.Region" class="docClass">Ext.util.Region</a> will be returned</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>box An object in the format</p>

<pre><code>{
    left: &lt;Element's X position&gt;,
    top: &lt;Element's Y position&gt;,
    width: &lt;Element's width&gt;,
    height: &lt;Element's height&gt;,
    bottom: &lt;Element's lower bound&gt;,
    right: &lt;Element's rightmost bound&gt;
}
</code></pre>

<p>The returned object may also be addressed as an Array where index 0 contains the X position
and index 1 contains the Y position. So the result may also be used for <a href="#!/api/Ext.dom.AbstractElement-method-setXY" rel="Ext.dom.AbstractElement-method-setXY" class="docClass">setXY</a></p> %}
    }
    }
    *)
  method getRight : bool Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the right X coordinate of the element (element X position + element width)</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t]
    {% <p>True to get the local css position instead of page coordinate</p> %}
    }
    }
    *)
  method getSize : bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Returns the size of the element.</p> %}
    
    {b Parameters}:
    {ul {- contentSize: [bool Js.t]
    {% <p>true to get the width/size minus borders and padding</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>An object containing the element's size:</p> %}
    }
    }
    *)
  method getStyle : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.meth
  (** {% <p>Returns a named style property based on computed/currentStyle (primary) and
inline-style if primary is not available.</p> %}
    
    {b Parameters}:
    {ul {- property: ['a Js.t]
    {% <p>The style property (or multiple property names
in an array) whose value is returned.</p> %}
    }
    {- inline: [bool Js.t]
    {% <p>if <code>true</code> only inline styles will be returned.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The current value of the style property for this element
(or a hash of named style values if multiple property arguments are requested).</p> %}
    }
    }
    *)
  method getTop : bool Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the top Y coordinate</p> %}
    
    {b Parameters}:
    {ul {- local: [bool Js.t]
    {% <p>True to get the local css position instead of page coordinate</p> %}
    }
    }
    *)
  method getValue : bool Js.t -> 'a Js.t Js.meth
  (** {% <p>Returns the value of the "value" attribute</p> %}
    
    {b Parameters}:
    {ul {- asNumber: [bool Js.t]
    {% <p>true to parse the value as a number</p> %}
    }
    }
    *)
  method getViewSize : 'a Js.t Js.meth
  (** {% <p>Returns the dimensions of the element available to lay content out in.</p>

<p>If the element (or any ancestor element) has CSS style <code>display: none</code>, the dimensions will be zero.</p>

<p>Example:</p>

<pre><code>var vpSize = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>().getViewSize();

// all Windows created afterwards will have a default value of 90% height and 95% width
<a href="#!/api/Ext.window.Window-static-method-override" rel="Ext.window.Window-static-method-override" class="docClass">Ext.Window.override</a>({
    width: vpSize.width * 0.9,
    height: vpSize.height * 0.95
});
// To handle window resizing you would have to hook onto onWindowResize.
</code></pre>

<p>getViewSize utilizes clientHeight/clientWidth which excludes sizing of scrollbars.
To obtain the size including scrollbars, use getStyleSize</p>

<p>Sizing of the document body is handled at the adapter level which handles special cases for IE and strict modes, etc.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>Object describing width and height.</p> %}
    }
    }
    *)
  method getWidth : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Returns the offset width of the element</p> %}
    
    {b Parameters}:
    {ul {- contentWidth: [bool Js.t]
    {% <p>true to get the width minus borders and padding</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The element's width</p> %}
    }
    }
    *)
  method getX : 'a Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the current X position of the element based on page coordinates.  Element must be part of the DOM
tree to have page coordinates (display:none or elements not appended return false).</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The X position of the element</p> %}
    }
    }
    *)
  method getXY : 'a Js.js_array Js.t Js.meth
  (** {% <p>Gets the current position of the element based on page coordinates.  Element must be part of the DOM
tree to have page coordinates (display:none or elements not appended return false).</p> %}
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t]
    {% <p>The XY position of the element</p> %}
    }
    }
    *)
  method getY : 'a Js.t -> Js.number Js.t Js.meth
  (** {% <p>Gets the current Y position of the element based on page coordinates.  Element must be part of the DOM
tree to have page coordinates (display:none or elements not appended return false).</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The Y position of the element</p> %}
    }
    }
    *)
  method hasCls : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Checks if the specified CSS class exists on this element's DOM node.</p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The CSS class to check for</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the class exists, else false</p> %}
    }
    }
    *)
  method hide : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Hide this element - Uses display mode to determine whether to use "display" or "visibility". See <a href="#!/api/Ext.dom.AbstractElement-method-setVisible" rel="Ext.dom.AbstractElement-method-setVisible" class="docClass">setVisible</a>.</p> %}
    
    {b Parameters}:
    {ul {- animate: ['a Js.t]
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method insertAfter : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Inserts this element after the passed element in the DOM</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The element to insert after.
The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>This element</p> %}
    }
    }
    *)
  method insertBefore : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Inserts this element before the passed element in the DOM</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The element before which this element will be inserted.
The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>This element</p> %}
    }
    }
    *)
  method insertFirst : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Inserts (or creates) an element (or DomHelper config) as the first child of this element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The id or element to insert or a DomHelper config
to create and insert</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>The new child</p> %}
    }
    }
    *)
  method insertHtml : Js.js_string Js.t -> Js.js_string Js.t ->
    bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Inserts an html fragment into this element</p> %}
    
    {b Parameters}:
    {ul {- where: [Js.js_string Js.t]
    {% <p>Where to insert the html in relation to this element * beforeBegin, afterBegin, beforeEnd, afterEnd.
See <a href="#!/api/Ext.dom.Helper-method-insertHtml" rel="Ext.dom.Helper-method-insertHtml" class="docClass">Ext.dom.Helper.insertHtml</a> for details.</p> %}
    }
    {- html: [Js.js_string Js.t]
    {% <p>The HTML fragment</p> %}
    }
    {- returnEl: [bool Js.t]
    {% <p>True to return an <a href="#!/api/Ext.dom.AbstractElement" rel="Ext.dom.AbstractElement" class="docClass">Ext.dom.AbstractElement</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The inserted node (or nearest related if more than 1 inserted)</p> %}
    }
    }
    *)
  method insertSibling : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Inserts (or creates) the passed element (or DomHelper config) as a sibling of this element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The id, element to insert or a DomHelper config
to create and insert <em>or</em> an array of any of those.</p> %}
    }
    {- where: [Js.js_string Js.t] {% <p>'before' or 'after'</p> %}
     Defaults to: 'before'
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return the .;ll;l,raw DOM element instead of <a href="#!/api/Ext.dom.AbstractElement" rel="Ext.dom.AbstractElement" class="docClass">Ext.dom.AbstractElement</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t]
    {% <p>The inserted Element. If an array is passed, the last inserted element is returned.</p> %}
    }
    }
    *)
  method is : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if this element matches the passed simple selector (e.g. div.some-class or span:first-child)</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The simple selector to test</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if this element matches the selector, else false</p> %}
    }
    }
    *)
  method isStyle : Js.js_string Js.t -> Js.js_string Js.t -> bool Js.t
    Js.meth
  (** {% <p>Checks if the current value of a style is equal to a given value.</p> %}
    
    {b Parameters}:
    {ul {- style: [Js.js_string Js.t]
    {% <p>property whose value is returned.</p> %}
    }
    {- value: [Js.js_string Js.t]
    {% <p>to check against.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>true for when the current value equals the given value.</p> %}
    }
    }
    *)
  method isTransparent : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the value of the given property is visually transparent. This
may be due to a 'transparent' style value or an rgba value with 0 in the alpha
component.</p> %}
    
    {b Parameters}:
    {ul {- prop: [Js.js_string Js.t]
    {% <p>The style property whose value is to be tested.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the style property is visually transparent.</p> %}
    }
    }
    *)
  method last : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  (** {% <p>Gets the last child, skipping text nodes</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>Find the previous sibling that matches the passed simple selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return a raw dom node instead of an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The last child or null</p> %}
    }
    }
    *)
  method mask : Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Puts a mask over this element to disable user interaction. Requires core.css.
This method can only be applied to elements which accept child nodes.</p> %}
    
    {b Parameters}:
    {ul {- msg: [Js.js_string Js.t]
    {% <p>A message to display in the mask</p> %}
    }
    {- msgCls: [Js.js_string Js.t]
    {% <p>A css class to apply to the msg element</p> %}
    }
    }
    *)
  method next : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  (** {% <p>Gets the next sibling, skipping text nodes</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>Find the next sibling that matches the passed simple selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return a raw dom node instead of an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The next sibling or null</p> %}
    }
    }
    *)
  method parent : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'a Js.t Js.meth
  (** {% <p>Gets the parent node for this element, optionally chaining up trying to match a selector</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>Find a parent node that matches the passed simple selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return a raw dom node instead of an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The parent node or null</p> %}
    }
    }
    *)
  method populateStyleMap : 'a Js.t -> 'b Js.t -> unit Js.meth
  (** {% <p>Creates mappings for 'margin-before' to 'marginLeft' (etc.) given the output
map and an ordering pair (e.g., ['left', 'right']). The ordering pair is in
before/after order.</p> %}
    
    {b Parameters}:
    {ul {- map: ['a Js.t]
    }
    {- order: ['a Js.t]
    }
    }
    *)
  method prev : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  (** {% <p>Gets the previous sibling, skipping text nodes</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>Find the previous sibling that matches the passed simple selector</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return a raw dom node instead of an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a></p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The previous sibling or null</p> %}
    }
    }
    *)
  method query : Js.js_string Js.t -> Dom_html.element Js.t Js.js_array Js.t
    Js.meth
  (** {% <p>Selects child nodes based on the passed CSS selector (the selector should not contain an id).</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The CSS selector</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t Js.js_array Js.t]
    {% <p>An array of the matched nodes</p> %}
    }
    }
    *)
  method radioCls : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Adds one or more CSS classes to this element and removes the same class(es) from all siblings.</p> %}
    
    {b Parameters}:
    {ul {- className: ['a Js.t]
    {% <p>The CSS class to add, or an array of classes</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method remove : unit Js.meth
  (** {% <p>Removes this element's dom reference. Note that event and cache removal is handled at <a href="#!/api/Ext-method-removeNode" rel="Ext-method-removeNode" class="docClass">Ext.removeNode</a></p> %}
    *)
  method removeCls : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Removes one or more CSS classes from the element.</p> %}
    
    {b Parameters}:
    {ul {- className: ['a Js.t]
    {% <p>The CSS classes to remove separated by space, or an array of classes</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method repaint : 'self Js.t Js.meth
  (** {% <p>Forces the browser to repaint this element</p> %}
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method replace : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Replaces the passed element with this element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The element to replace.
The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>This element</p> %}
    }
    }
    *)
  method replaceCls : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  (** {% <p>Replaces a CSS class on the element with another.  If the old name does not exist, the new name will simply be added.</p> %}
    
    {b Parameters}:
    {ul {- oldClassName: [Js.js_string Js.t]
    {% <p>The CSS class to replace</p> %}
    }
    {- newClassName: [Js.js_string Js.t]
    {% <p>The replacement CSS class</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method replaceWith : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Replaces this element with the passed element</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The new element (id of the node, a DOM Node
or an existing Element) or a DomHelper config of an element to create</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>This element</p> %}
    }
    }
    *)
  method select : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Creates a <a href="#!/api/Ext.dom.CompositeElement" rel="Ext.dom.CompositeElement" class="docClass">Ext.CompositeElement</a> for child nodes based on the passed CSS selector (the selector should not contain an id).</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The CSS selector</p> %}
    }
    {- unique: [bool Js.t]
    {% <p>True to create a unique <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> for each element. Defaults to a shared flyweight object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_CompositeElement.t Js.t]
    {% <p>The composite element</p> %}
    }
    }
    *)
  method serializeForm : 'a Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Serializes a DOM form into a url encoded string</p> %}
    
    {b Parameters}:
    {ul {- form: ['a Js.t]
    {% <p>The form</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The url encoded form</p> %}
    }
    }
    *)
  method set : 'a Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the passed attributes as attributes of this element (a style attribute can be a string, object or function)</p> %}
    
    {b Parameters}:
    {ul {- o: ['a Js.t]
    {% <p>The object with the attributes</p> %}
    }
    {- useSet: [bool Js.t]
    {% <p>false to override the default setAttribute to use expandos.</p> %}
     Defaults to: true
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setBottom : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the element's CSS bottom style.</p> %}
    
    {b Parameters}:
    {ul {- bottom: [Js.js_string Js.t]
    {% <p>The bottom CSS property value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setBox : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.optdef ->
    'self Js.t Js.meth
  (** {% <p>Sets the element's box. Use getBox() on another element to get a box obj.
If animate is true then width, height, x and y will be animated concurrently.</p> %}
    
    {b Parameters}:
    {ul {- box: ['a Js.t]
    {% <p>The box to fill {x, y, width, height}</p> %}
    }
    {- adjust: [bool Js.t]
    {% <p>Whether to adjust for box-model issues automatically</p> %}
    }
    {- animate: ['a Js.t]
    {% <p>true for the default animation or a standard
Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setHTML : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Set the innerHTML of this element</p> %}
    
    {b Parameters}:
    {ul {- html: [Js.js_string Js.t]
    {% <p>The new HTML</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setHeight : 'a Js.t -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Set the height of this Element.</p>

<pre><code>// change the height to 200px and animate with default configuration
<a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">Ext.fly</a>('elementId').setHeight(200, true);

// change the height to 150px and animate with a custom configuration
<a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">Ext.fly</a>('elId').setHeight(150, {
    duration : 500, // animation will have a duration of .5 seconds
    // will change the content to "finished"
    callback: function(){ this.<a href="#!/api/Ext.dom.AbstractElement-method-update" rel="Ext.dom.AbstractElement-method-update" class="docClass">update</a>("finished"); }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- height: ['a Js.t]
    {% <p>The new height. This may be one of:</p>

<ul>
<li>A Number specifying the new height in this Element's <a href="#!/api/Ext.dom.AbstractElement-property-defaultUnit" rel="Ext.dom.AbstractElement-property-defaultUnit" class="docClass">defaultUnit</a>s (by default, pixels.)</li>
<li>A String used to set the CSS height style. Animation may <strong>not</strong> be used.</li>
</ul> %}
    }
    {- animate: ['a Js.t]
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setLeft : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the element's left position directly using CSS style (instead of <a href="#!/api/Ext.dom.AbstractElement-method-setX" rel="Ext.dom.AbstractElement-method-setX" class="docClass">setX</a>).</p> %}
    
    {b Parameters}:
    {ul {- left: [Js.js_string Js.t]
    {% <p>The left CSS property value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setRight : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the element's CSS right style.</p> %}
    
    {b Parameters}:
    {ul {- right: [Js.js_string Js.t]
    {% <p>The right CSS property value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setSize : 'a Js.t -> 'b Js.t -> 'c Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Set the size of this Element. If animation is true, both width and height will be animated concurrently.</p> %}
    
    {b Parameters}:
    {ul {- width: ['a Js.t]
    {% <p>The new width. This may be one of:</p>

<ul>
<li>A Number specifying the new width in this Element's <a href="#!/api/Ext.dom.AbstractElement-property-defaultUnit" rel="Ext.dom.AbstractElement-property-defaultUnit" class="docClass">defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS width style. Animation may <strong>not</strong> be used.</li>
<li>A size object in the format <code>{width: widthValue, height: heightValue}</code>.</li>
</ul> %}
    }
    {- height: ['a Js.t]
    {% <p>The new height. This may be one of:</p>

<ul>
<li>A Number specifying the new height in this Element's <a href="#!/api/Ext.dom.AbstractElement-property-defaultUnit" rel="Ext.dom.AbstractElement-property-defaultUnit" class="docClass">defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS height style. Animation may <strong>not</strong> be used.</li>
</ul> %}
    }
    {- animate: ['a Js.t]
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setStyle : 'a Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Wrapper for setting style properties, also takes single object parameter of multiple styles.</p> %}
    
    {b Parameters}:
    {ul {- property: ['a Js.t]
    {% <p>The style property to be set, or an object of multiple styles.</p> %}
    }
    {- value: [Js.js_string Js.t]
    {% <p>The value to apply to the given property, or null if an object was passed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setTop : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Sets the element's top position directly using CSS style (instead of <a href="#!/api/Ext.dom.AbstractElement-method-setY" rel="Ext.dom.AbstractElement-method-setY" class="docClass">setY</a>).</p> %}
    
    {b Parameters}:
    {ul {- top: [Js.js_string Js.t]
    {% <p>The top CSS property value</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setVisibilityMode : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Use this to change the visibility mode between <a href="#!/api/Ext.dom.AbstractElement-static-property-VISIBILITY" rel="Ext.dom.AbstractElement-static-property-VISIBILITY" class="docClass">VISIBILITY</a>, <a href="#!/api/Ext.dom.AbstractElement-static-property-DISPLAY" rel="Ext.dom.AbstractElement-static-property-DISPLAY" class="docClass">DISPLAY</a>, <a href="#!/api/Ext.dom.AbstractElement-static-property-OFFSETS" rel="Ext.dom.AbstractElement-static-property-OFFSETS" class="docClass">OFFSETS</a> or <a href="#!/api/Ext.dom.AbstractElement-static-property-ASCLASS" rel="Ext.dom.AbstractElement-static-property-ASCLASS" class="docClass">ASCLASS</a>.</p> %}
    
    {b Parameters}:
    {ul {- mode: ['a Js.t]
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setVisible : bool Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the visibility of the element (see details). If the visibilityMode is set to Element.DISPLAY, it will use
the display property to hide the element, otherwise it uses visibility. The default is to hide and show using the visibility property.</p> %}
    
    {b Parameters}:
    {ul {- visible: [bool Js.t]
    {% <p>Whether the element is visible</p> %}
    }
    {- animate: ['a Js.t]
    {% <p>True for the default animation, or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setWidth : 'a Js.t -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Set the width of this Element.</p> %}
    
    {b Parameters}:
    {ul {- width: ['a Js.t]
    {% <p>The new width. This may be one of:</p>

<ul>
<li>A Number specifying the new width in this Element's <a href="#!/api/Ext.dom.AbstractElement-property-defaultUnit" rel="Ext.dom.AbstractElement-property-defaultUnit" class="docClass">defaultUnit</a>s (by default, pixels).</li>
<li>A String used to set the CSS width style. Animation may <strong>not</strong> be used.</li>
</ul> %}
    }
    {- animate: ['a Js.t]
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setX : Js.number Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the X position of the element based on page coordinates.  Element must be part of the DOM tree
to have page coordinates (display:none or elements not appended return false).</p> %}
    
    {b Parameters}:
    {ul {- the: [Js.number Js.t]
    {% <p>X position of the element</p> %}
    }
    {- animate: ['a Js.t]
    {% <p>True for the default animation, or a standard Element
animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setXY : 'a Js.js_array Js.t -> 'b Js.t Js.optdef -> 'self Js.t
    Js.meth
  (** {% <p>Sets the position of the element in page coordinates, regardless of how the element is positioned.
The element must be part of the DOM tree to have page coordinates (display:none or elements not appended return false).</p> %}
    
    {b Parameters}:
    {ul {- pos: ['a Js.js_array Js.t]
    {% <p>Contains X &amp; Y [x, y] values for new position (coordinates are page-based)</p> %}
    }
    {- animate: ['a Js.t]
    {% <p>True for the default animation, or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method setY : Js.number Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Sets the Y position of the element based on page coordinates.  Element must be part of the DOM tree
to have page coordinates (display:none or elements not appended return false).</p> %}
    
    {b Parameters}:
    {ul {- the: [Js.number Js.t]
    {% <p>Y position of the element</p> %}
    }
    {- animate: ['a Js.t]
    {% <p>True for the default animation, or a standard Element
animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_dom_AbstractElement.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method show : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Show this element - Uses display mode to determine whether to use "display" or "visibility". See <a href="#!/api/Ext.dom.AbstractElement-method-setVisible" rel="Ext.dom.AbstractElement-method-setVisible" class="docClass">setVisible</a>.</p> %}
    
    {b Parameters}:
    {ul {- animate: ['a Js.t]
    {% <p>true for the default animation or a standard Element animation config object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method toggleCls : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Toggles the specified CSS class on this element (removes it if it already exists, otherwise adds it).</p> %}
    
    {b Parameters}:
    {ul {- className: [Js.js_string Js.t]
    {% <p>The CSS class to toggle</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method translatePoints : 'a Js.t -> Js.number Js.t Js.optdef -> 'b Js.t
    Js.meth
  (** {% <p>Translates the passed page coordinates into left/top css values for this element</p> %}
    
    {b Parameters}:
    {ul {- x: ['a Js.t]
    {% <p>The page x or an array containing [x, y]</p> %}
    }
    {- y: [Js.number Js.t]
    {% <p>The page y, required if x is not an array</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>An object with left and top properties. e.g. {left: (value), top: (value)}</p> %}
    }
    }
    *)
  method unmask : unit Js.meth
  (** {% <p>Removes a previously applied mask.</p> %}
    *)
  method up : Js.js_string Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Walks up the dom looking for a parent node that matches the passed simple selector (e.g. div.some-class or span:first-child).
This is a shortcut for findParentNode() that always returns an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t]
    {% <p>The simple selector to test</p> %}
    }
    {- limit: ['a Js.t]
    {% <p>The max depth to search as a number or an element which causes the upward traversal to stop
and is <b>not</b> considered for inclusion as the result. (defaults to 50 || document.documentElement)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t]
    {% <p>The matching DOM node (or null if no match was found)</p> %}
    }
    }
    *)
  method update : Js.js_string Js.t -> 'self Js.t Js.meth
  (** {% <p>Update the innerHTML of this element</p> %}
    
    {b Parameters}:
    {ul {- html: [Js.js_string Js.t]
    {% <p>The new HTML</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method wrap : 'a Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> 'b Js.t Js.meth
  (** {% <p>Creates and wraps this element with another element</p> %}
    
    {b Parameters}:
    {ul {- config: ['a Js.t]
    {% <p>DomHelper element config object for the wrapper element or null for an empty div</p> %}
    }
    {- returnDom: [bool Js.t]
    {% <p>True to return the raw DOM element instead of <a href="#!/api/Ext.dom.AbstractElement" rel="Ext.dom.AbstractElement" class="docClass">Ext.dom.AbstractElement</a></p> %}
     Defaults to: false
    }
    {- selector: [Js.js_string Js.t]
    {% <p>A <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">DomQuery</a> selector to select a descendant node within the created element to use as the wrapping element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The newly created wrapper element</p> %}
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
  
  method _ASCLASS : Js.number Js.t Js.prop
  (** {% <p>Visibility mode constant for use with <a href="#!/api/Ext.dom.Element-method-setVisibilityMode" rel="Ext.dom.Element-method-setVisibilityMode" class="docClass">Ext.dom.Element.setVisibilityMode</a>.
Add or remove the <a href="#!/api/Ext.Layer-cfg-visibilityCls" rel="Ext.Layer-cfg-visibilityCls" class="docClass">Ext.Layer.visibilityCls</a> class to hide the element.</p> %}
    
    Defaults to: [4]
    *)
  method _DISPLAY : Js.number Js.t Js.prop
  (** {% <p>Visibility mode constant for use with <a href="#!/api/Ext.dom.Element-method-setVisibilityMode" rel="Ext.dom.Element-method-setVisibilityMode" class="docClass">Ext.dom.Element.setVisibilityMode</a>.
Use the CSS 'display' property to hide the element.</p> %}
    
    Defaults to: [2]
    *)
  method _OFFSETS : Js.number Js.t Js.prop
  (** {% <p>Visibility mode constant for use with <a href="#!/api/Ext.dom.Element-method-setVisibilityMode" rel="Ext.dom.Element-method-setVisibilityMode" class="docClass">Ext.dom.Element.setVisibilityMode</a>.
Use CSS absolute positioning and top/left offsets to hide the element.</p> %}
    
    Defaults to: [3]
    *)
  method _VISIBILITY : Js.number Js.t Js.prop
  (** {% <p>Visibility mode constant for use with <a href="#!/api/Ext.dom.Element-method-setVisibilityMode" rel="Ext.dom.Element-method-setVisibilityMode" class="docClass">Ext.dom.Element.setVisibilityMode</a>.
Use the CSS 'visibility' property to hide the element.</p>

<p>Note that in this mode, <a href="#!/api/Ext.dom.Element-method-isVisible" rel="Ext.dom.Element-method-isVisible" class="docClass">isVisible</a> may return true
for an element even though it actually has a parent element that is hidden. For this
reason, and in most cases, using the <a href="#!/api/Ext.dom.AbstractElement-static-property-OFFSETS" rel="Ext.dom.AbstractElement-static-property-OFFSETS" class="docClass">OFFSETS</a> mode is a better choice.</p> %}
    
    Defaults to: [1]
    *)
  method fly : 'a Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Gets the singleton <a href="#!/api/Ext.dom.AbstractElement.Fly" rel="Ext.dom.AbstractElement.Fly" class="docClass">flyweight</a> element, with the passed node as the active element.</p>

<p>Because it is a singleton, this Flyweight does not have an ID, and must be used and discarded in a single line.
You may not keep and use the reference to this singleton over multiple lines because methods that you call
may themselves make use of <a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">Ext.fly</a> and may change the DOM element to which the instance refers.</p>

<p><a href="#!/api/Ext-method-fly" rel="Ext-method-fly" class="docClass">Ext.fly</a> is alias for <a href="#!/api/Ext.dom.AbstractElement-static-method-fly" rel="Ext.dom.AbstractElement-static-method-fly" class="docClass">fly</a>.</p>

<p>Use this to make one-time references to DOM elements which are not going to be accessed again either by
application code, or by Ext's classes. If accessing an element which will be processed regularly, then <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a> will be more appropriate to take advantage of the caching provided by the <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>
class.</p> %}
    
    {b Parameters}:
    {ul {- dom: ['a Js.t]
    {% <p>The dom node or id</p> %}
    }
    {- named: [Js.js_string Js.t]
    {% <p>Allows for creation of named reusable flyweights to prevent conflicts (e.g.
internally Ext uses "_global")</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_AbstractElement_Fly.t Js.t]
    {% <p>The singleton flyweight object (or null if no matching element was found)</p> %}
    }
    }
    *)
  method fromPoint : Js.number Js.t -> Js.number Js.t -> Js.js_string Js.t
    Js.meth
  (** {% <p>Returns the top Element that is located at the passed coordinates</p> %}
    
    {b Parameters}:
    {ul {- x: [Js.number Js.t]
    {% <p>The x coordinate</p> %}
    }
    {- y: [Js.number Js.t]
    {% <p>The y coordinate</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The found Element</p> %}
    }
    }
    *)
  method get : 'a Js.t -> 'self Js.t Js.meth
  (** {% <p>Retrieves <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a> objects. <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a> is alias for <a href="#!/api/Ext.dom.Element-static-method-get" rel="Ext.dom.Element-static-method-get" class="docClass">Ext.dom.Element.get</a>.</p>

<p><strong>This method does not retrieve <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Component</a>s.</strong> This method retrieves <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.dom.Element</a>
objects which encapsulate DOM elements. To retrieve a Component by its ID, use <a href="#!/api/Ext.ComponentManager-method-get" rel="Ext.ComponentManager-method-get" class="docClass">Ext.ComponentManager.get</a>.</p>

<p>Uses simple caching to consistently return the same object. Automatically fixes if an object was recreated with
the same id via AJAX or DOM.</p> %}
    
    {b Parameters}:
    {ul {- el: ['a Js.t]
    {% <p>The id of the node, a DOM Node or an existing Element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_dom_Element.t Js.t]
    {% <p>The Element object (or null if no matching element was found)</p> %}
    }
    }
    *)
  method getDocumentHeight : Js.number Js.t Js.meth
  (** {% <p>Retrieves the document height</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>documentHeight</p> %}
    }
    }
    *)
  method getDocumentWidth : Js.number Js.t Js.meth
  (** {% <p>Retrieves the document width</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>documentWidth</p> %}
    }
    }
    *)
  method getOrientation : Js.js_string Js.t Js.meth
  (** {% <p>Retrieves the current orientation of the window. This is calculated by
determing if the height is greater than the width.</p> %}
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>Orientation of window: 'portrait' or 'landscape'</p> %}
    }
    }
    *)
  method getViewSize : 'a Js.t Js.meth
  (** {% <p>Retrieves the viewport size of the window.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>object containing width and height properties</p> %}
    }
    }
    *)
  method getViewportHeight : Js.number Js.t Js.meth
  (** {% <p>Retrieves the viewport height of the window.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>viewportHeight</p> %}
    }
    }
    *)
  method getViewportWidth : Js.number Js.t Js.meth
  (** {% <p>Retrieves the viewport width of the window.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>viewportWidth</p> %}
    }
    }
    *)
  method mergeClsList : 'a Js.t -> 'b Js.t -> 'c Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of unique class names based upon the input strings, or string arrays.</p>


<p>The number of parameters is unlimited.</p>


<p>Example</p>


<p><code></p>

<pre>// Add x-invalid and x-mandatory classes, do not duplicate
myElement.dom.className = <a href="#!/api/Ext.dom.Element-static-method-mergeClsList" rel="Ext.dom.Element-static-method-mergeClsList" class="docClass">Ext.core.Element.mergeClsList</a>(this.initialClasses, 'x-invalid x-mandatory');
</pre>


<p></code></p> %}
    
    {b Parameters}:
    {ul {- clsList1: ['a Js.t]
    {% <p>A string of class names, or an array of class names.</p> %}
    }
    {- clsList2: ['a Js.t]
    {% <p>A string of class names, or an array of class names.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t]
    {% <p>An array of strings representing remaining unique, merged class names. If class names were added to the first list, the <code>changed</code> property will be <code>true</code>.</p> %}
    }
    }
    *)
  method normalize : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Normalizes CSS property keys from dash delimited to camel case JavaScript Syntax.
For example:</p>

<ul>
<li>border-width -> borderWidth</li>
<li>padding-top -> paddingTop</li>
</ul> %}
    
    {b Parameters}:
    {ul {- prop: [Js.js_string Js.t]
    {% <p>The property to normalize</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The normalized string</p> %}
    }
    }
    *)
  method parseBox : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Parses a number or string representing margin sizes into an object. Supports CSS-style margin declarations
(e.g. 10, "10", "10 10", "10 10 10" and "10 10 10 10" are all valid options and would return the same result)</p> %}
    
    {b Parameters}:
    {ul {- box: ['a Js.t]
    {% <p>The encoded margins</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>An object with margin sizes for top, right, bottom and left</p> %}
    }
    }
    *)
  method parseStyles : Js.js_string Js.t -> 'a Js.t Js.meth
  (** {% <p>Converts a CSS string into an object with a property for each style.</p>

<p>The sample code below would return an object with 2 properties, one
for background-color and one for color.</p>

<pre><code>var css = 'background-color: red;color: blue; ';
console.log(Ext.dom.Element.parseStyles(css));
</code></pre> %}
    
    {b Parameters}:
    {ul {- styles: [Js.js_string Js.t]
    {% <p>A CSS string</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>styles</p> %}
    }
    }
    *)
  method removeCls : 'a Js.t -> 'b Js.t -> 'c Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of unique class names deom the first parameter with all class names
from the second parameter removed.</p>


<p>Example</p>


<p><code></p>

<pre>// Remove x-invalid and x-mandatory classes if present.
myElement.dom.className = <a href="#!/api/Ext.dom.Element-method-removeCls" rel="Ext.dom.Element-method-removeCls" class="docClass">Ext.core.Element.removeCls</a>(this.initialClasses, 'x-invalid x-mandatory');
</pre>


<p></code></p> %}
    
    {b Parameters}:
    {ul {- existingClsList: ['a Js.t]
    {% <p>A string of class names, or an array of class names.</p> %}
    }
    {- removeClsList: ['a Js.t]
    {% <p>A string of class names, or an array of class names to remove from <code>existingClsList</code>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t]
    {% <p>An array of strings representing remaining class names. If class names were removed, the <code>changed</code> property will be <code>true</code>.</p> %}
    }
    }
    *)
  method unitizeBox : 'a Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  (** {% <p>Parses a number or string representing margin sizes into an object. Supports CSS-style margin declarations
(e.g. 10, "10", "10 10", "10 10 10" and "10 10 10 10" are all valid options and would return the same result)</p> %}
    
    {b Parameters}:
    {ul {- box: ['a Js.t]
    {% <p>The encoded margins</p> %}
    }
    {- units: [Js.js_string Js.t]
    {% <p>The type of units to add</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>An string with unitized (px if units is not specified) metrics for top, right, bottom and left</p> %}
    }
    }
    *)
  
end

val static : statics Js.t
(** Static instance. *)

val fly : 'a Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t
(** See method [statics.fly] *)

val fromPoint : Js.number Js.t -> Js.number Js.t -> Js.js_string Js.t
(** See method [statics.fromPoint] *)

val get : 'a Js.t -> 'self Js.t
(** See method [statics.get] *)

val getDocumentHeight : unit -> Js.number Js.t
(** See method [statics.getDocumentHeight] *)

val getDocumentWidth : unit -> Js.number Js.t
(** See method [statics.getDocumentWidth] *)

val getOrientation : unit -> Js.js_string Js.t
(** See method [statics.getOrientation] *)

val getViewSize : unit -> 'a Js.t
(** See method [statics.getViewSize] *)

val getViewportHeight : unit -> Js.number Js.t
(** See method [statics.getViewportHeight] *)

val getViewportWidth : unit -> Js.number Js.t
(** See method [statics.getViewportWidth] *)

val mergeClsList : 'a Js.t -> 'b Js.t -> 'c Js.js_array Js.t
(** See method [statics.mergeClsList] *)

val normalize : Js.js_string Js.t -> Js.js_string Js.t
(** See method [statics.normalize] *)

val parseBox : 'a Js.t -> 'b Js.t
(** See method [statics.parseBox] *)

val parseStyles : Js.js_string Js.t -> 'a Js.t
(** See method [statics.parseStyles] *)

val removeCls : 'a Js.t -> 'b Js.t -> 'c Js.js_array Js.t
(** See method [statics.removeCls] *)

val unitizeBox : 'a Js.t -> Js.js_string Js.t -> Js.js_string Js.t
(** See method [statics.unitizeBox] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

