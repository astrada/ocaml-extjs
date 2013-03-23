(** Provides attractive and customizable tooltips for ...
  
  {% <p>Provides attractive and customizable tooltips for any element. The QuickTips
singleton is used to configure and manage tooltips globally for multiple elements
in a generic manner.  To create individual tooltips with maximum customizability,
you should consider either <a href="#!/api/Ext.tip.Tip" rel="Ext.tip.Tip" class="docClass">Ext.tip.Tip</a> or <a href="#!/api/Ext.tip.ToolTip" rel="Ext.tip.ToolTip" class="docClass">Ext.tip.ToolTip</a>.</p>

<p>Quicktips can be configured via tag attributes directly in markup, or by
registering quick tips programmatically via the <a href="#!/api/Ext.tip.QuickTipManager-method-register" rel="Ext.tip.QuickTipManager-method-register" class="docClass">register</a> method.</p>

<p>The singleton's instance of <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">Ext.tip.QuickTip</a> is available via
<a href="#!/api/Ext.tip.QuickTipManager-method-getQuickTip" rel="Ext.tip.QuickTipManager-method-getQuickTip" class="docClass">getQuickTip</a>, and supports all the methods, and all the all the
configuration properties of <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">Ext.tip.QuickTip</a>. These settings will apply to all
tooltips shown by the singleton.</p>

<p>Below is the summary of the configuration properties which can be used.
For detailed descriptions see the config options for the
<a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">QuickTip</a> class</p>

<h2>QuickTips singleton configs (all are optional)</h2>

<ul>
<li><code>dismissDelay</code></li>
<li><code>hideDelay</code></li>
<li><code>maxWidth</code></li>
<li><code>minWidth</code></li>
<li><code>showDelay</code></li>
<li><code>trackMouse</code></li>
</ul>


<h2>Target element configs (optional unless otherwise noted)</h2>

<ul>
<li><code>autoHide</code></li>
<li><code>cls</code></li>
<li><code>dismissDelay</code> (overrides singleton value)</li>
<li><code>target</code> (required)</li>
<li><code>text</code> (required)</li>
<li><code>title</code></li>
<li><code>width</code></li>
</ul>


<p>Here is an example showing how some of these config options could be used:</p>

<pre class='inline-example '><code>// Init the singleton.  Any tag-based quick tips will start working.
<a href="#!/api/Ext.tip.QuickTipManager-method-init" rel="Ext.tip.QuickTipManager-method-init" class="docClass">Ext.tip.QuickTipManager.init</a>();

// Apply a set of config properties to the singleton
<a href="#!/api/Ext-method-apply" rel="Ext-method-apply" class="docClass">Ext.apply</a>(<a href="#!/api/Ext.tip.QuickTipManager-method-getQuickTip" rel="Ext.tip.QuickTipManager-method-getQuickTip" class="docClass">Ext.tip.QuickTipManager.getQuickTip</a>(), \{
    maxWidth: 200,
    minWidth: 100,
    showDelay: 50      // Show 50ms after entering target
\});

// Create a small panel to add a quick tip to
<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>', \{
    id: 'quickTipContainer',
    width: 200,
    height: 150,
    style: \{
        backgroundColor:'#000000'
    \},
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
\});


// Manually register a quick tip for a specific element
<a href="#!/api/Ext.tip.QuickTipManager-method-register" rel="Ext.tip.QuickTipManager-method-register" class="docClass">Ext.tip.QuickTipManager.register</a>(\{
    target: 'quickTipContainer',
    title: 'My Tooltip',
    text: 'This tooltip was added in code',
    width: 100,
    dismissDelay: 10000 // Hide after 10 seconds hover
\});
</code></pre>

<p>To register a quick tip in markup, you simply add one or more of the valid QuickTip
attributes prefixed with the <strong>data-</strong> namespace.  The HTML element itself is
automatically set as the quick tip target. Here is the summary of supported attributes
(optional unless otherwise noted):</p>

<ul>
<li><code>hide</code>: Specifying "user" is equivalent to setting autoHide = false.
 Any other value will be the same as autoHide = true.</li>
<li><code>qclass</code>: A CSS class to be applied to the quick tip
 (equivalent to the 'cls' target element config).</li>
<li><code>qtip (required)</code>: The quick tip text (equivalent to the 'text' target element config).</li>
<li><code>qtitle</code>: The quick tip title (equivalent to the 'title' target element config).</li>
<li><code>qwidth</code>: The quick tip width (equivalent to the 'width' target element config).</li>
</ul>


<p>Here is an example of configuring an HTML element to display a tooltip from markup:</p>

<pre><code>// Add a quick tip to an HTML button
&lt;input type="button" value="OK" data-qtitle="OK Button" data-qwidth="100"
     data-qtip="This is a quick tip from markup!"&gt;&lt;/input&gt;
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method destroy : unit Js.meth
  (** {% <p>Destroys the QuickTips instance.</p> %}
    *)
  method disable : unit Js.meth
  (** {% <p>Disables quick tips globally.</p> %}
    *)
  method enable : unit Js.meth
  (** {% <p>Enables quick tips globally.</p> %}
    *)
  method getQuickTip : Ext_tip_QuickTip.t Js.t Js.meth
  (** {% <p>Gets the single <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">QuickTip</a> instance used to show tips
from all registered elements.</p> %}
    *)
  method init : bool Js.t Js.optdef -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Initializes the global QuickTips instance and prepare any quick tips.</p> %}
    
    {b Parameters}:
    {ul {- autoRender: [bool Js.t] (optional)
    {% <p>True to render the QuickTips container
immediately to preload images.</p> %}
     Defaults to: true
    }
    {- config: [_ Js.t] (optional)
    {% <p>config object for the created QuickTip. By
default, the <a href="#!/api/Ext.tip.QuickTip" rel="Ext.tip.QuickTip" class="docClass">QuickTip</a> class is instantiated, but this can
be changed by supplying an xtype property or a className property in this object.
All other properties on this object are configuration for the created component.</p> %}
    }
    }
    *)
  method isEnabled : bool Js.t Js.meth
  (** {% <p>Returns true if quick tips are enabled, else false.</p> %}
    *)
  method register : _ Js.t -> unit Js.meth
  (** {% <p>Configures a new quick tip instance and assigns it to a target element.  See
<a href="#!/api/Ext.tip.QuickTip-method-register" rel="Ext.tip.QuickTip-method-register" class="docClass">Ext.tip.QuickTip.register</a> for details.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t] {% <p>The config object</p> %}
    }
    }
    *)
  method tips : _ Js.t -> unit Js.meth
  (** {% <p>Alias of <a href="#!/api/Ext.tip.QuickTipManager-method-register" rel="Ext.tip.QuickTipManager-method-register" class="docClass">register</a>.</p>

<p>Configures a new quick tip instance and assigns it to a target element.  See
<a href="#!/api/Ext.tip.QuickTip-method-register" rel="Ext.tip.QuickTip-method-register" class="docClass">Ext.tip.QuickTip.register</a> for details.</p> %}
    
    {b Parameters}:
    {ul {- config: [_ Js.t] {% <p>The config object</p> %}
    }
    }
    *)
  method unregister : _ Js.t -> unit Js.meth
  (** {% <p>Removes any registered quick tip from the target element and destroys it.</p> %}
    
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

