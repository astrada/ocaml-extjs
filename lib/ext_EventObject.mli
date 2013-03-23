(** Just as Ext.Element wraps around a native DOM node ...
  
  {% <p>Just as <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> wraps around a native DOM node, <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a>
wraps the browser's native event-object normalizing cross-browser differences,
such as which mouse button is clicked, keys pressed, mechanisms to stop
event-propagation along with a method to prevent default actions from taking place.</p>

<p>For example:</p>

<pre><code>function handleClick(e, t)\{ // e is not a standard event object, it is a <a href="#!/api/Ext.EventObject" rel="Ext.EventObject" class="docClass">Ext.EventObject</a>
    e.preventDefault();
    var target = e.getTarget(); // same as t (the target HTMLElement)
    ...
\}

var myDiv = <a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>("myDiv");  // get reference to an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>
myDiv.on(         // 'on' is shorthand for addListener
    "click",      // perform an action on click of myDiv
    handleClick   // reference to the action handler
);

// other methods to do the same:
<a href="#!/api/Ext.EventManager-method-on" rel="Ext.EventManager-method-on" class="docClass">Ext.EventManager.on</a>("myDiv", 'click', handleClick);
<a href="#!/api/Ext.EventManager-method-addListener" rel="Ext.EventManager-method-addListener" class="docClass">Ext.EventManager.addListener</a>("myDiv", 'click', handleClick);
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method correctWheelDelta : Js.number Js.t -> unit Js.meth
  (** {% <p>Correctly scales a given wheel delta.</p> %}
    
    {b Parameters}:
    {ul {- delta: [Js.number Js.t] {% <p>The delta value.</p> %}
    }
    }
    *)
  method getCharCode : Js.number Js.t Js.meth
  (** {% <p>Gets the character code for the event.</p> %}
    *)
  method getKey : Js.number Js.t Js.meth
  (** {% <p>Returns a normalized keyCode for the event.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The key code</p> %}
    }
    }
    *)
  method getPoint : Ext_util_Point.t Js.t Js.meth
  (** {% <p>Returns a point object that consists of the object coordinates.</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_Point.t Js.t] {% <p>point</p> %}
    }
    }
    *)
  method getRelatedTarget : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef
    -> bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  (** {% <p>Gets the related target.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>A simple selector to filter the target or look for an ancestor of the target</p> %}
    }
    {- maxDepth: [_ Js.t] (optional)
    {% <p>The max depth to search as a number or element (defaults to 10 || document.body)</p> %}
    }
    {- returnEl: [bool Js.t] (optional)
    {% <p>True to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> object instead of DOM node</p> %}
    }
    }
    *)
  method getTarget : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  (** {% <p>Gets the target for the event.</p> %}
    
    {b Parameters}:
    {ul {- selector: [Js.js_string Js.t] (optional)
    {% <p>A simple selector to filter the target or look for an ancestor of the target</p> %}
    }
    {- maxDepth: [_ Js.t] (optional)
    {% <p>The max depth to search as a number or element (defaults to 10 || document.body)</p> %}
    }
    {- returnEl: [bool Js.t] (optional)
    {% <p>True to return a <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> object instead of DOM node</p> %}
    }
    }
    *)
  method getWheelDelta : Js.number Js.t Js.meth
  (** {% <p>Normalizes mouse wheel y-delta across browsers. To get x-delta information, use
<a href="#!/api/Ext.EventObject-method-getWheelDeltas" rel="Ext.EventObject-method-getWheelDeltas" class="docClass">getWheelDeltas</a> instead.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The mouse wheel y-delta</p> %}
    }
    }
    *)
  method getWheelDeltas : _ Js.t Js.meth
  (** {% <p>Returns the mouse wheel deltas for this event.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object with "x" and "y" properties holding the mouse wheel deltas.</p> %}
    }
    }
    *)
  method getX : Js.number Js.t Js.meth
  (** {% <p>Gets the x coordinate of the event.</p> %}
    *)
  method getXY : Js.number Js.t Js.js_array Js.t Js.meth
  (** {% <p>Gets the page coordinates of the event.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t Js.js_array Js.t]
    {% <p>The xy values like [x, y]</p> %}
    }
    }
    *)
  method getY : Js.number Js.t Js.meth
  (** {% <p>Gets the y coordinate of the event.</p> %}
    *)
  method hasModifier : bool Js.t Js.meth
  (** {% <p>Returns true if the control, meta, shift or alt key was pressed during this event.</p> %}
    *)
  method injectEvent : _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Injects a DOM event using the data in this object and (optionally) a new target.
This is a low-level technique and not likely to be used by application code. The
currently supported event types are:</p>

<p><b>HTMLEvents</b></p>


<ul>
<li>load</li>
<li>unload</li>
<li>select</li>
<li>change</li>
<li>submit</li>
<li>reset</li>
<li>resize</li>
<li>scroll</li>
</ul>


<p><b>MouseEvents</b></p>


<ul>
<li>click</li>
<li>dblclick</li>
<li>mousedown</li>
<li>mouseup</li>
<li>mouseover</li>
<li>mousemove</li>
<li>mouseout</li>
</ul>


<p><b>UIEvents</b></p>


<ul>
<li>focusin</li>
<li>focusout</li>
<li>activate</li>
<li>focus</li>
<li>blur</li>
</ul> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t] (optional)
    {% <p>If specified, the target for the event. This
is likely to be used when relaying a DOM event. If not specified, <a href="#!/api/Ext.EventObject-method-getTarget" rel="Ext.EventObject-method-getTarget" class="docClass">getTarget</a>
is used to determine the target.</p> %}
    }
    }
    *)
  method isNavKeyPress : bool Js.t Js.meth
  (** {% <p>Checks if the key pressed was a "navigation" key</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the press is a navigation keypress</p> %}
    }
    }
    *)
  method isSpecialKey : bool Js.t Js.meth
  (** {% <p>Checks if the key pressed was a "special" key</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the press is a special keypress</p> %}
    }
    }
    *)
  method preventDefault : unit Js.meth
  (** {% <p>Prevents the browsers default handling of the event.</p> %}
    *)
  method stopEvent : unit Js.meth
  (** {% <p>Stop the event (preventDefault and stopPropagation)</p> %}
    *)
  method stopPropagation : unit Js.meth
  (** {% <p>Cancels bubbling of the event.</p> %}
    *)
  method within : _ Js.t -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.meth
  (** {% <p>Returns true if the target of this event is a child of el.  Unless the allowEl parameter is set, it will return false if if the target is el.
Example usage:</p>

<pre><code>// Handle click on any child of an element
<a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>().on('click', function(e)\{
    if(e.within('some-el'))\{
        alert('Clicked on a child of some-el!');
    \}
\});

// Handle click directly on an element, ignoring clicks on child nodes
<a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>().on('click', function(e,t)\{
    if((t.id == 'some-el') && !e.within(t, true))\{
        alert('Clicked directly on some-el!');
    \}
\});
</code></pre> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The id, DOM element or <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> to check</p> %}
    }
    {- related: [bool Js.t] (optional)
    {% <p>true to test if the related target is within el instead of the target</p> %}
    }
    {- allowEl: [bool Js.t] (optional)
    {% <p>true to also check if the passed element is the target or related target</p> %}
    }
    }
    *)
  method _A : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [65]
    *)
  method _ALT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [18]
    *)
  method _B : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [66]
    *)
  method _BACKSPACE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [8]
    *)
  method _C : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [67]
    *)
  method _CAPS_LOCK : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [20]
    *)
  method _CONTEXT_MENU : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [93]
    *)
  method _CTRL : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [17]
    *)
  method _D : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [68]
    *)
  method _DELETE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [46]
    *)
  method _DOWN : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [40]
    *)
  method _E : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [69]
    *)
  method _EIGHT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [56]
    *)
  method _END : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [35]
    *)
  method _ENTER : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [13]
    *)
  method _ESC : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [27]
    *)
  method _F : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [70]
    *)
  method _F1 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [112]
    *)
  method _F10 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [121]
    *)
  method _F11 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [122]
    *)
  method _F12 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [123]
    *)
  method _F2 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [113]
    *)
  method _F3 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [114]
    *)
  method _F4 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [115]
    *)
  method _F5 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [116]
    *)
  method _F6 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [117]
    *)
  method _F7 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [118]
    *)
  method _F8 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [119]
    *)
  method _F9 : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [120]
    *)
  method _FIVE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [53]
    *)
  method _FOUR : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [52]
    *)
  method _G : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [71]
    *)
  method _H : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [72]
    *)
  method _HOME : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [36]
    *)
  method _I : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [73]
    *)
  method _INSERT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [45]
    *)
  method _J : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [74]
    *)
  method _K : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [75]
    *)
  method _L : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [76]
    *)
  method _LEFT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [37]
    *)
  method _M : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [77]
    *)
  method _N : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [78]
    *)
  method _NINE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [57]
    *)
  method _NUM_CENTER : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [12]
    *)
  method _NUM_DIVISION : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [111]
    *)
  method _NUM_EIGHT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [104]
    *)
  method _NUM_FIVE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [101]
    *)
  method _NUM_FOUR : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [100]
    *)
  method _NUM_MINUS : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [109]
    *)
  method _NUM_MULTIPLY : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [106]
    *)
  method _NUM_NINE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [105]
    *)
  method _NUM_ONE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [97]
    *)
  method _NUM_PERIOD : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [110]
    *)
  method _NUM_PLUS : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [107]
    *)
  method _NUM_SEVEN : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [103]
    *)
  method _NUM_SIX : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [102]
    *)
  method _NUM_THREE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [99]
    *)
  method _NUM_TWO : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [98]
    *)
  method _NUM_ZERO : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [96]
    *)
  method _O : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [79]
    *)
  method _ONE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [49]
    *)
  method _P : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [80]
    *)
  method _PAGE_DOWN : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [34]
    *)
  method _PAGE_UP : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [33]
    *)
  method _PAUSE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [19]
    *)
  method _PRINT_SCREEN : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [44]
    *)
  method _Q : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [81]
    *)
  method _R : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [82]
    *)
  method _RETURN : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [13]
    *)
  method _RIGHT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [39]
    *)
  method _S : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [83]
    *)
  method _SEVEN : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [55]
    *)
  method _SHIFT : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [16]
    *)
  method _SIX : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [54]
    *)
  method _SPACE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [32]
    *)
  method _T : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [84]
    *)
  method _TAB : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [9]
    *)
  method _THREE : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [51]
    *)
  method _TWO : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [50]
    *)
  method _U : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [85]
    *)
  method _UP : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [38]
    *)
  method _V : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [86]
    *)
  method _W : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [87]
    *)
  method _WHEEL_SCALE : Js.number Js.t Js.prop
  (** {% <p>The mouse wheel delta scaling factor. This value depends on browser version and OS and
attempts to produce a similar scrolling experience across all platforms and browsers.</p>

<p>To change this value:</p>

<pre><code> Ext.EventObjectImpl.prototype.WHEEL_SCALE = 72;
</code></pre> %}
    *)
  method _X : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [88]
    *)
  method _Y : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [89]
    *)
  method _Z : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [90]
    *)
  method _ZERO : Js.number Js.t Js.prop
  (** {% <p>Key constant</p> %}
    
    Defaults to: [48]
    *)
  method altKey : bool Js.t Js.prop
  (** {% <p>True if the alt key was down during the event.</p> %}
    *)
  method ctrlKey : bool Js.t Js.prop
  (** {% <p>True if the control key was down during the event.
In Mac this will also be true when meta key was down.</p> %}
    *)
  method shiftKey : bool Js.t Js.prop
  (** {% <p>True if the shift key was down during the event.</p> %}
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

val get_instance : unit -> t Js.t
(** Singleton instance for lazy-loaded modules. *)

val instance : t Js.t
(** Singleton instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

