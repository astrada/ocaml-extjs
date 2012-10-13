(** Given a component hierarchy of this:      xtype: ' ...
  
  {% <p>Given a component hierarchy of this:</p>

<pre><code> {
     xtype: 'panel',
     id: 'ContainerA',
     layout: 'hbox',
     renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
     items: [
         {
             id: 'ContainerB',
             xtype: 'container',
             items: [
                 { id: 'ComponentA' }
             ]
         }
     ]
 }
</code></pre>

<p>The rendering of the above proceeds roughly like this:</p>

<ul>
<li>ContainerA's initComponent calls <a href="#!/api/Ext.util.Renderable-method-render" rel="Ext.util.Renderable-method-render" class="docClass">render</a> passing the <code>renderTo</code> property as the
container argument.</li>
<li><code>render</code> calls the <code>getRenderTree</code> method to get a complete <a href="#!/api/Ext.DomHelper" rel="Ext.DomHelper" class="docClass">Ext.DomHelper</a> spec.</li>
<li><code>getRenderTree</code> fires the "beforerender" event and calls the #beforeRender
method. Its result is obtained by calling #getElConfig.</li>
<li>The #getElConfig method uses the <code>renderTpl</code> and its render data as the content
of the <code>autoEl</code> described element.</li>
<li>The result of <code>getRenderTree</code> is passed to <a href="#!/api/Ext.DomHelper-method-append" rel="Ext.DomHelper-method-append" class="docClass">Ext.DomHelper.append</a>.</li>
<li>The <code>renderTpl</code> contains calls to render things like docked items, container items
and raw markup (such as the <code>html</code> or <code>tpl</code> config properties). These calls are to
methods added to the <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a> instance by #setupRenderTpl.</li>
<li>The #setupRenderTpl method adds methods such as <code>renderItems</code>, <code>renderContent</code>, etc.
to the template. These are directed to "doRenderItems", "doRenderContent" etc..</li>
<li>The #setupRenderTpl calls traverse from components to their <a href="#!/api/Ext.layout.Layout" rel="Ext.layout.Layout" class="docClass">Ext.layout.Layout</a>
object.</li>
<li>When a container is rendered, it also has a <code>renderTpl</code>. This is processed when the
<code>renderContainer</code> method is called in the component's <code>renderTpl</code>. This call goes to
Ext.layout.container.Container#doRenderContainer. This method repeats this
process for all components in the container.</li>
<li>After the top-most component's markup is generated and placed in to the DOM, the next
step is to link elements to their components and finish calling the component methods
<code>onRender</code> and <code>afterRender</code> as well as fire the corresponding events.</li>
<li>The first step in this is to call #finishRender. This method descends the
component hierarchy and calls <code>onRender</code> and fires the <code>render</code> event. These calls
are delivered top-down to approximate the timing of these calls/events from previous
versions.</li>
<li>During the pass, the component's <code>el</code> is set. Likewise, the <code>renderSelectors</code> and
<code>childEls</code> are applied to capture references to the component's elements.</li>
<li>These calls are also made on the <a href="#!/api/Ext.layout.container.Container" rel="Ext.layout.container.Container" class="docClass">Ext.layout.container.Container</a> layout to
capture its elements. Both of these classes use <a href="#!/api/Ext.util.ElementContainer" rel="Ext.util.ElementContainer" class="docClass">Ext.util.ElementContainer</a> to
handle <code>childEls</code> processing.</li>
<li>Once this is complete, a similar pass is made by calling #finishAfterRender.
This call also descends the component hierarchy, but this time the calls are made in
a bottom-up order to <code>afterRender</code>.</li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method afterRender : unit Js.meth
  (** {% <p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
    *)
  method doAutoRender : unit Js.meth
  (** {% <p>Handles autoRender.
Floating Components may have an ownerCt. If they are asking to be constrained, constrain them within that
ownerCt, and have their z-index managed locally. Floating Components are always rendered to document.body</p> %}
    *)
  method ensureAttachedToBody : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Ensures that this component is attached to <code>document.body</code>. If the component was
rendered to <a href="#!/api/Ext" rel="Ext" class="docClass">Ext.getDetachedBody</a>, then it will be appended to <code>document.body</code>.
Any configured position is also restored.</p> %}
    
    {b Parameters}:
    {ul {- runLayout: [bool Js.t]
    {% <p>True to run the component's layout.</p> %}
     Defaults to: false
    }
    }
    *)
  method getInsertPosition : 'a Js.t -> Dom_html.element Js.t Js.meth
  (** {% <p>This function takes the position argument passed to onRender and returns a
DOM element that you can use in the insertBefore.</p> %}
    
    {b Parameters}:
    {ul {- position: ['a Js.t]
    {% <p>Index, element id or element you want
to put this component before.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Dom_html.element Js.t]
    {% <p>DOM element that you can use in the insertBefore</p> %}
    }
    }
    *)
  method onRender : Ext_dom_Element.t Js.t -> Js.number Js.t -> unit Js.meth
  (** {% <p>Template method called when this Component's DOM structure is created.</p>

<p>At this point, this Component's (and all descendants') DOM structure <em>exists</em> but it has not
been layed out (positioned and sized).</p>

<p>Subclasses which override this to gain access to the structure at render time should
call the parent class's method before attempting to access any child elements of the Component.</p> %}
    
    {b Parameters}:
    {ul {- parentNode: [Ext_dom_Element.t Js.t]
    {% <p>The parent Element in which this Component's encapsulating element is contained.</p> %}
    }
    {- containerIdx: [Js.number Js.t]
    {% <p>The index within the parent Container's child collection of this Component.</p> %}
    }
    }
    *)
  method render : 'a Js.t Js.optdef -> 'b Js.t Js.optdef -> unit Js.meth
  (** {% <p>Renders the Component into the passed HTML element.</p>

<p><strong>If you are using a <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Container</a> object to house this
Component, then do not use the render method.</strong></p>

<p>A Container's child Components are rendered by that Container's
<a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a> manager when the Container is first rendered.</p>

<p>If the Container is already rendered when a new child Component is added, you may need to call
the Container's <a href="#!/api/Ext.container.Container-method-doLayout" rel="Ext.container.Container-method-doLayout" class="docClass">doLayout</a> to refresh the view which
causes any unrendered child Components to be rendered. This is required so that you can add
multiple child components if needed while only refreshing the layout once.</p>

<p>When creating complex UIs, it is important to remember that sizing and positioning
of child items is the responsibility of the Container's <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a>
manager.  If you expect child items to be sized in response to user interactions, you must
configure the Container with a layout manager which creates and manages the type of layout you
have in mind.</p>

<p><strong>Omitting the Container's <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a> config means that a basic
layout manager is used which does nothing but render child components sequentially into the
Container. No sizing or positioning will be performed in this situation.</strong></p> %}
    
    {b Parameters}:
    {ul {- container: ['a Js.t]
    {% <p>The element this Component should be
rendered into. If it is being created from existing markup, this should be omitted.</p> %}
    }
    {- position: ['a Js.t]
    {% <p>The element ID or DOM node index within the container <strong>before</strong>
which this component will be inserted (defaults to appending to the end of the container)</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
  method onRender : ('self Js.t, Ext_dom_Element.t Js.t -> Js.number Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.onRender] *)
  
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

