(** This class is intended to be extended or created v ...
  
  {% <p>This class is intended to be extended or created via the <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a>
configuration property.  See <a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">Ext.container.Container.layout</a> for additional details.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_layout_Layout.t
  inherit Ext_util_ElementContainer.t
  
  method getScrollRangeFlags : 'a Js.t Js.prop
  (** {% <p>Returns flags indicating cross-browser handling of scrollHeight/Width. In particular,
IE has issues with padding-bottom in a scrolling element (it does not include that
padding in the scrollHeight). Also, margin-bottom on a child in a scrolling element
can be lost.</p>

<p>All browsers seem to ignore margin-right on children and padding-right on the parent
element (the one with the overflow)</p>

<p>This method returns a number with the follow bit positions set based on things not
accounted for in scrollHeight and scrollWidth:</p>

<ul>
<li>1: Scrolling element's padding-bottom is not included in scrollHeight.</li>
<li>2: Last child's margin-bottom is not included in scrollHeight.</li>
<li>4: Scrolling element's padding-right is not included in scrollWidth.</li>
<li>8: Child's margin-right is not included in scrollWidth.</li>
</ul>


<p>To work around the margin-bottom issue, it is sufficient to create a 0px tall last
child that will "hide" the margin. This can also be handled by wrapping the children
in an element, again "hiding" the margin. Wrapping the elements is about the only
way to preserve their right margins. This is the strategy used by Column layout.</p>

<p>To work around the padding-bottom problem, since it is comes from a style on the
parent element, about the only simple fix is to create a last child with height
equal to padding-bottom. To preserve the right padding, the sizing element needs to
have a width that includes the right padding.</p> %}
    *)
  method overflowPadderEl : Ext_dom_Element.t Js.t Js.prop
  (** {% <p>The element used to correct body padding during overflow.</p> %}
    *)
  method beginLayout_obj : 'a Js.t -> unit Js.meth
  (** {% <p>In addition to work done by our base classes, containers benefit from some extra
cached data. The following properties are added to the ownerContext:</p>

<ul>
<li>visibleItems: the result of <a href="#!/api/Ext.layout.container.Container-method-getVisibleItems" rel="Ext.layout.container.Container-method-getVisibleItems" class="docClass">getVisibleItems</a></li>
<li>childItems: the ContextItem[] for each visible item</li>
<li>targetContext: the ContextItem for the <a href="#!/api/Ext.layout.container.Container-method-getTarget" rel="Ext.layout.container.Container-method-getTarget" class="docClass">getTarget</a> element</li>
</ul> %}
    
    {b Parameters}:
    {ul {- ownerContext: ['a Js.t]
    }
    }
    *)
  method beginLayoutCycle : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>Called before any calculation cycles to reset DOM values and prepare for calculation.</p>

<p>This is a write phase and DOM reads should be strictly avoided when overridding
this method.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method calculateOverflow : Ext_layout_ContextItem.t Js.t -> 'a Js.t ->
    Js.number Js.t -> unit Js.meth
  (** {% <p>Handles overflow processing for a container. This should be called once the layout
has determined contentWidth/Height. In addition to the ownerContext passed to the
<a href="#!/api/Ext.layout.container.Container-method-calculate" rel="Ext.layout.container.Container-method-calculate" class="docClass">calculate</a> method, this method also needs the containerSize (the object
returned by <a href="#!/api/Ext.layout.container.Container-method-getContainerSize" rel="Ext.layout.container.Container-method-getContainerSize" class="docClass">getContainerSize</a>).</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    }
    {- containerSize: ['a Js.t]
    }
    {- dimensions: [Js.number Js.t]
    {% <p>A bit mask for the overflow managed dimensions. The 0-bit
is for <code>width</code> and the 1-bit is for <code>height</code>. In other words, a value of 1 would be
only <code>width</code>, 2 would be only <code>height</code> and 3 would be both.</p> %}
    }
    }
    *)
  method completeLayout : Ext_layout_ContextItem.t Js.t -> unit Js.meth
  (** {% <p>This method (if implemented) is called at the end of the cycle in which this layout
completes (by not setting <a href="#!/api/Ext.layout.container.Container-property-done" rel="Ext.layout.container.Container-property-done" class="docClass">done</a> to <code>false</code> in <a href="#!/api/Ext.layout.container.Container-method-calculate" rel="Ext.layout.container.Container-method-calculate" class="docClass">calculate</a>). It is
possible for the layout to complete and yet become invalid before the end of the cycle,
in which case, this method will not be called. It is also possible for this method to
be called and then later the layout becomes invalidated. This will result in
<a href="#!/api/Ext.layout.container.Container-method-calculate" rel="Ext.layout.container.Container-method-calculate" class="docClass">calculate</a> being called again, followed by another call to this method.</p>

<p>This is a read phase and DOM writes should be strictly avoided in derived classes.
Instead, DOM writes need to be written to <a href="#!/api/Ext.layout.ContextItem" rel="Ext.layout.ContextItem" class="docClass">Ext.layout.ContextItem</a> objects to
be flushed at the next opportunity.</p>

<p>This method need not be implemented by derived classes and, in fact, should only be
implemented when needed.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The context item for the layout's owner
component.</p> %}
    }
    }
    *)
  method configureItem_obj : 'a Js.t -> unit Js.meth
  (** {% <p>Adds layout's itemCls and owning Container's itemCls</p> %}
    
    {b Parameters}:
    {ul {- item: ['a Js.t]
    }
    }
    *)
  method doRenderPadder : 'a Js.t -> 'b Js.t -> unit Js.meth
  (** {% <p>Creates an element that makes bottom/right body padding consistent across browsers.
This element is sized based on the need for scrollbars in <a href="#!/api/Ext.layout.container.Container-method-calculateOverflow" rel="Ext.layout.container.Container-method-calculateOverflow" class="docClass">calculateOverflow</a>.
If the <a href="#!/api/Ext.layout.container.Container-cfg-manageOverflow" rel="Ext.layout.container.Container-cfg-manageOverflow" class="docClass">manageOverflow</a> option is false, this element is not created.</p>

<p>See <a href="#!/api/Ext.layout.container.Container-property-getScrollRangeFlags" rel="Ext.layout.container.Container-property-getScrollRangeFlags" class="docClass">getScrollRangeFlags</a> for more details.</p> %}
    
    {b Parameters}:
    {ul {- out: ['a Js.t]
    }
    {- renderData: ['a Js.t]
    }
    }
    *)
  method getContainerSize : Ext_layout_ContextItem.t Js.t ->
    bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Returns the container size (that of the target). Only the fixed-sized dimensions can
be returned because the shrinkWrap dimensions are based on the contentWidth/Height
as determined by the container layout.</p>

<p>If the <a href="#!/api/Ext.layout.container.Container-method-calculateOverflow" rel="Ext.layout.container.Container-method-calculateOverflow" class="docClass">calculateOverflow</a> method is used and if <a href="#!/api/Ext.layout.container.Container-cfg-manageOverflow" rel="Ext.layout.container.Container-cfg-manageOverflow" class="docClass">manageOverflow</a> is
true, this may adjust the width/height by the size of scrollbars.</p> %}
    
    {b Parameters}:
    {ul {- ownerContext: [Ext_layout_ContextItem.t Js.t]
    {% <p>The owner's context item.</p> %}
    }
    {- inDom: [bool Js.t]
    {% <p>True if the container size must be in the DOM.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The size</p> %}
    }
    }
    *)
  method getElementTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the element into which extra functional DOM elements can be inserted. Defaults to the owner Component's encapsulating element.</p>

<p>May be overridden in Component layout managers which implement a <a href="#!/api/Ext.layout.container.Container-method-getRenderTarget" rel="Ext.layout.container.Container-method-getRenderTarget" class="docClass">component render target</a> which must only
contain child components.</p> %}
    *)
  method getLayoutItems : Ext_Component.t Js.js_array Js.t Js.meth
  (** {% <p>Returns an array of child components either for a render phase (Performed in the beforeLayout
method of the layout's base class), or the layout phase (onLayout).</p> %}
    
    {b Returns}:
    {ul {- [Ext_Component.t Js.js_array Js.t]
    {% <p>of child components</p> %}
    }
    }
    *)
  method getRenderTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the element into which rendering must take place. Defaults to the owner Container's
target element.</p>

<p>May be overridden in layout managers which implement an inner element.</p> %}
    *)
  method getRenderedItems : 'a Js.js_array Js.t Js.meth
  (** {% <p>Returns all items that are rendered</p> %}
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t] {% <p>All matching items</p> %}
    }
    }
    *)
  method getTarget : Ext_dom_Element.t Js.t Js.meth
  (** {% <p>Returns the owner component's resize element.</p> %}
    *)
  method getVisibleItems : 'a Js.js_array Js.t Js.meth
  (** {% <p>Returns all items that are both rendered and visible</p> %}
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t] {% <p>All matching items</p> %}
    }
    }
    *)
  method initLayout : unit Js.meth
  (** {% <p>A one-time initialization method called just before rendering.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_layout_Layout.configs
  inherit Ext_util_ElementContainer.configs
  
  method itemCls : Js.js_string Js.t Js.prop
  (** {% <p>An optional extra CSS class that will be added to the container. This can be useful for
adding customized styles to the container or any of its children using standard CSS
rules. See <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.<a href="#!/api/Ext.Component-cfg-componentCls" rel="Ext.Component-cfg-componentCls" class="docClass">componentCls</a> also.</p> %}
    *)
  method manageOverflow : Js.number Js.t Js.prop
  (** {% <p>One of the following values:</p>

<ul>
<li>0 if the layout should ignore overflow.</li>
<li>1 if the layout should be rerun if scrollbars are needed.</li>
<li>2 if the layout should also correct padding when overflowed.</li>
</ul> %}
    
    Defaults to: [0]
    *)
  method reserveScrollbar : bool Js.t Js.prop
  (** {% <p>Set to <code>true</code> to leave space for a vertical scrollbar (if the OS shows space-consuming scrollbars) regardless
of whether a scrollbar is needed.</p>

<p>This is useful if content height changes during application usage, but you do not want the calculated width
of child items to change when a scrollbar appears or disappears. The scrollbar will appear in the reserved space,
and the calculated width of child Components will not change.</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Employee', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
       {name: 'rating', type: 'int'},
       {name: 'salary', type: 'float'},
       {name: 'name'}
    ]
});

function createFakeData(count) {
    var firstNames   = ['Ed', 'Tommy', 'Aaron', 'Abe', 'Jamie', 'Adam', 'Dave', 'David', 'Jay', 'Nicolas', 'Nige'],
        lastNames    = ['Spencer', 'Maintz', 'Conran', 'Elias', 'Avins', 'Mishcon', 'Kaneda', 'Davis', 'Robinson', 'Ferrero', 'White'],
        ratings      = [1, 2, 3, 4, 5],
        salaries     = [100, 400, 900, 1500, 1000000];

    var data = [];
    for (var i = 0; i &lt; (count || 25); i++) {
        var ratingId    = Math.floor(Math.random() * ratings.length),
            salaryId    = Math.floor(Math.random() * salaries.length),
            firstNameId = Math.floor(Math.random() * firstNames.length),
            lastNameId  = Math.floor(Math.random() * lastNames.length),

            rating      = ratings[ratingId],
            salary      = salaries[salaryId],
            name        = <a href="#!/api/Ext.String-method-format" rel="Ext.String-method-format" class="docClass">Ext.String.format</a>("{0} {1}", firstNames[firstNameId], lastNames[lastNameId]);

        data.push({
            rating: rating,
            salary: salary,
            name: name
        });
    }
    store.loadData(data);
}

// create the Data Store
var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    id: 'store',
    model: 'Employee',
    proxy: {
        type: 'memory'
    }
});
createFakeData(10);

var grid = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    title: 'Grid loaded with varying number of records',
    anchor: '100%',
    store: store,
    columns: [{
        xtype: 'rownumberer',
        width: 40,
        sortable: false
    },{
        text: 'Name',
        flex: 1,
        sortable: true,
        dataIndex: 'name'
    },{
        text: 'Rating',
        width: 125,
        sortable: true,
        dataIndex: 'rating'
    },{
        text: 'Salary',
        width: 125,
        sortable: true,
        dataIndex: 'salary',
        align: 'right',
        renderer: <a href="#!/api/Ext.util.Format-method-usMoney" rel="Ext.util.Format-method-usMoney" class="docClass">Ext.util.Format.usMoney</a>
    }]
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>', {
    renderTo: document.body,
    width: 800,
    height: 600,
    layout: {
        type: 'anchor',
        reserveScrollbar: true // There will be a gap even when there's no scrollbar
    },
    autoScroll: true,
    items: grid,
    tbar: {
        defaults: {
            handler: function(b) {
                createFakeData(b.count);
            }
        },
        items: [{
             text: '10 Items',
             count: 10
        },{
             text: '100 Items',
             count: 100
        },{
             text: '300 Items',
             count: 300
        },{
             text: '1000 Items',
             count: 1000
        },{
             text: '5000 Items',
             count: 5000
        }]
    }
});
</code></pre> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_layout_Layout.events
  inherit Ext_util_ElementContainer.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_layout_Layout.statics
  inherit Ext_util_ElementContainer.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

