(** A mechanism for displaying data using custom layou ...
  
  {% <p>A mechanism for displaying data using custom layout templates and formatting.</p>

<p>The View uses an <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a> as its internal templating mechanism, and is bound to an
<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> so that as the data in the store changes the view is automatically updated
to reflect the changes. The view also provides built-in behavior for many common events that can
occur for its contained items including click, doubleclick, mouseover, mouseout, etc. as well as a
built-in selection model. <strong>In order to use these features, an <a href="#!/api/Ext.view.View-cfg-itemSelector" rel="Ext.view.View-cfg-itemSelector" class="docClass">itemSelector</a> config must
be provided for the View to determine what nodes it will be working with.</strong></p>

<p>The example below binds a View to a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> and renders it into an <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>.</p>

<pre class='inline-example '><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Image', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        { name:'src', type:'string' },
        { name:'caption', type:'string' }
    ]
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    id:'imagesStore',
    model: 'Image',
    data: [
        { src:'http://www.sencha.com/img/20110215-feat-drawing.png', caption:'Drawing &amp; Charts' },
        { src:'http://www.sencha.com/img/20110215-feat-data.png', caption:'Advanced Data' },
        { src:'http://www.sencha.com/img/20110215-feat-html5.png', caption:'Overhauled Theme' },
        { src:'http://www.sencha.com/img/20110215-feat-perf.png', caption:'Performance Tuned' }
    ]
});

var imageTpl = new <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a>(
    '&lt;tpl for="."&gt;',
        '&lt;div style="margin-bottom: 10px;" class="thumb-wrap"&gt;',
          '&lt;img src="{src}" /&gt;',
          '&lt;br/&gt;&lt;span&gt;{caption}&lt;/span&gt;',
        '&lt;/div&gt;',
    '&lt;/tpl&gt;'
);

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.view.View" rel="Ext.view.View" class="docClass">Ext.view.View</a>', {
    store: <a href="#!/api/Ext.data.StoreManager-method-lookup" rel="Ext.data.StoreManager-method-lookup" class="docClass">Ext.data.StoreManager.lookup</a>('imagesStore'),
    tpl: imageTpl,
    itemSelector: 'div.thumb-wrap',
    emptyText: 'No images available',
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_view_AbstractView.t
  
  method afterRender : unit Js.meth
  (** {% <p>private</p>

<p>Allows addition of behavior after rendering is complete. At this stage the Component’s Element
will have been styled according to the configuration, will have had any configured CSS class
names added, and will be in the configured visibility and the configured enable state.</p> %}
    *)
  method clearHighlight : unit Js.meth
  (** {% <p>Un-highlights the currently highlighted item, if any.</p> %}
    *)
  method highlightItem : Dom_html.element Js.t -> unit Js.meth
  (** {% <p>Highlights a given item in the View. This is called by the mouseover handler if <a href="#!/api/Ext.view.View-cfg-overItemCls" rel="Ext.view.View-cfg-overItemCls" class="docClass">overItemCls</a>
and <a href="#!/api/Ext.view.View-cfg-trackOver" rel="Ext.view.View-cfg-trackOver" class="docClass">trackOver</a> are configured, but can also be called manually by other code, for instance to
handle stepping through the list via keyboard navigation.</p> %}
    
    {b Parameters}:
    {ul {- item: [Dom_html.element Js.t]
    {% <p>The item to highlight</p> %}
    }
    }
    *)
  method initComponent : unit Js.meth
  (** {% <p>The initComponent template method is an important initialization step for a Component. It is intended to be
implemented by each subclass of <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> to provide any needed constructor logic. The
initComponent method of the class being created is called first, with each initComponent method
up the hierarchy to <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> being called thereafter. This makes it easy to implement and,
if needed, override the constructor logic of the Component at any step in the hierarchy.</p>

<p>The initComponent method <strong>must</strong> contain a call to <a href="#!/api/Ext.Base-method-callParent" rel="Ext.Base-method-callParent" class="docClass">callParent</a> in order
to ensure that the parent class' initComponent method is also called.</p>

<p>All config options passed to the constructor are applied to <code>this</code> before initComponent is called,
so you can simply access them with <code>this.someOption</code>.</p>

<p>The following example demonstrates using a dynamic string for the text of a button at the time of
instantiation of the class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('DynamicButtonText', {
    extend: '<a href="#!/api/Ext.button.Button" rel="Ext.button.Button" class="docClass">Ext.button.Button</a>',

    initComponent: function() {
        this.text = new Date();
        this.renderTo = <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>();
        this.callParent();
    }
});

<a href="#!/api/Ext-method-onReady" rel="Ext-method-onReady" class="docClass">Ext.onReady</a>(function() {
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('DynamicButtonText');
});
</code></pre> %}
    *)
  method refresh : unit Js.meth
  (** {% <p>Refreshes the view by reloading the data from the store and re-rendering the template.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_view_AbstractView.configs
  
  method afterRender : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.afterRender] *)
  method initComponent : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.initComponent] *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_view_AbstractView.events
  
  method beforecontainerclick : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the click event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainercontextmenu : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the contextmenu event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainerdblclick : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the dblclick event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainerkeydown : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the keydown event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object. Use <a href="#!/api/Ext.EventObject-method-getKey" rel="Ext.EventObject-method-getKey" class="docClass">getKey()</a> to retrieve the key that was pressed.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermousedown : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mousedown event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseout : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseout event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseover : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseover event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforecontainermouseup : (t Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseup event on the container is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforedeselect : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired before a record is deselected. If any listener returns false, the
deselection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the click event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemcontextmenu : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the contextmenu event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemdblclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the dblclick event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemkeydown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the keydown event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object. Use <a href="#!/api/Ext.EventObject-method-getKey" rel="Ext.EventObject-method-getKey" class="docClass">getKey()</a> to retrieve the key that was pressed.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmousedown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mousedown event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseenter : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseenter event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseleave : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseleave event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeitemmouseup : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before the mouseup event on an item is processed. Returns false to cancel the default action.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeselect : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired before a record is selected. If any listener returns false, the
selection is cancelled.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containerclick : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containercontextmenu : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t
    -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is right clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containerdblclick : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the container is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containerkeydown : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a key is pressed while the container is focused, and no item is currently selected.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object. Use <a href="#!/api/Ext.EventObject-method-getKey" rel="Ext.EventObject-method-getKey" class="docClass">getKey()</a> to retrieve the key that was pressed.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseout : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when you move the mouse out of the container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseover : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when you move the mouse over the container.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method containermouseup : (t Js.t -> Ext_EventObject.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse up on the container</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method deselect : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is deselected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The deselected record</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method focuschange : (#Ext_selection_Model.t Js.t -> Ext_data_Model.t Js.t
    -> Ext_data_Model.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired when a row is focused</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- oldFocused: [Ext_data_Model.t Js.t]
    {% <p>The previously focused record</p> %}
    }
    {- newFocused: [Ext_data_Model.t Js.t]
    {% <p>The newly focused record</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method highlightitem : (t Js.t -> Ext_dom_Element.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a node is highlighted using keyboard navigation, or mouseover.</p> %}
    
    {b Parameters}:
    {ul {- view: [Ext_view_View.t Js.t]
    {% <p>This View Component.</p> %}
    }
    {- node: [Ext_dom_Element.t Js.t]
    {% <p>The highlighted node.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemcontextmenu : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is right clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemdblclick : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is double clicked.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemkeydown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a key is pressed while an item is currently selected.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object. Use <a href="#!/api/Ext.EventObject-method-getKey" rel="Ext.EventObject-method-getKey" class="docClass">getKey()</a> to retrieve the key that was pressed.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmousedown : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse down on an item</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseenter : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse enters an item.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseleave : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the mouse leaves an item.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method itemmouseup : (t Js.t -> Ext_data_Model.t Js.t ->
    Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when there is a mouse up on an item</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_view_View.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that belongs to the item</p> %}
    }
    {- item: [Dom_html.element Js.t]
    {% <p>The item's element</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The item's index</p> %}
    }
    {- e: [Ext_EventObject.t Js.t]
    {% <p>The raw event object</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method select : (Ext_selection_DataViewModel.t Js.t ->
    Ext_data_Model.t Js.t -> 'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after a record is selected</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_selection_DataViewModel.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The selected record</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method selectionchange : (#Ext_selection_Model.t Js.t ->
    Ext_data_Model.t Js.js_array Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired after a selection change has occurred</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_selection_Model.t Js.t]
    }
    {- selected: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The selected records</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method unhighlightitem : (t Js.t -> Ext_dom_Element.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when a node is unhighlighted using keyboard navigation, or mouseout.</p> %}
    
    {b Parameters}:
    {ul {- view: [Ext_view_View.t Js.t]
    {% <p>This View Component.</p> %}
    }
    {- node: [Ext_dom_Element.t Js.t]
    {% <p>The previously highlighted node.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_AbstractComponent.statics
  inherit Ext_Component.statics
  inherit Ext_view_AbstractView.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

