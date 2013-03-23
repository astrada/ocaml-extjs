(** Base class for any Ext.Component that may contain ...
  
  {% <p>Base class for any <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> that may contain other Components. Containers handle the basic behavior of
containing items, namely adding, inserting and removing items.</p>

<p>The most commonly used Container classes are <a href="#!/api/Ext.panel.Panel" rel="Ext.panel.Panel" class="docClass">Ext.panel.Panel</a>, <a href="#!/api/Ext.window.Window" rel="Ext.window.Window" class="docClass">Ext.window.Window</a> and
<a href="#!/api/Ext.tab.Panel" rel="Ext.tab.Panel" class="docClass">Ext.tab.Panel</a>. If you do not need the capabilities offered by the aforementioned classes you can create a
lightweight Container to be encapsulated by an HTML element to your specifications by using the
<a href="#!/api/Ext.Component-cfg-autoEl" rel="Ext.Component-cfg-autoEl" class="docClass">autoEl</a> config option.</p>

<p>The code below illustrates how to explicitly create a Container:</p>

<pre class='inline-example '><code>// Explicitly create a Container
<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a>', \{
    layout: \{
        type: 'hbox'
    \},
    width: 400,
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    border: 1,
    style: \{borderColor:'#000000', borderStyle:'solid', borderWidth:'1px'\},
    defaults: \{
        labelWidth: 80,
        // implicitly create Container by specifying xtype
        xtype: 'datefield',
        flex: 1,
        style: \{
            padding: '10px'
        \}
    \},
    items: [\{
        xtype: 'datefield',
        name: 'startDate',
        fieldLabel: 'Start date'
    \},\{
        xtype: 'datefield',
        name: 'endDate',
        fieldLabel: 'End date'
    \}]
\});
</code></pre>

<h2>Layout</h2>

<p>Container classes delegate the rendering of child Components to a layout manager class which must be configured into
the Container using the <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code> configuration property.</p>

<p>When either specifying child <code><a href="#!/api/Ext.container.Container-cfg-items" rel="Ext.container.Container-cfg-items" class="docClass">items</a></code> of a Container, or dynamically <a href="#!/api/Ext.container.Container-method-add" rel="Ext.container.Container-method-add" class="docClass">adding</a> Components to a
Container, remember to consider how you wish the Container to arrange those child elements, and whether those child
elements need to be sized using one of Ext's built-in <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code> schemes. By default, Containers use the
<a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Auto</a> scheme which only renders child components, appending them one after the other
inside the Container, and <strong>does not apply any sizing</strong> at all.</p>

<p>A common mistake is when a developer neglects to specify a <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code> (e.g. widgets like GridPanels or
TreePanels are added to Containers for which no <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code> has been specified). If a Container is left to
use the default <a href="#!/api/Ext.layout.container.Auto" rel="Ext.layout.container.Auto" class="docClass">Auto</a> scheme, none of its child components will be resized, or changed in
any way when the Container is resized.</p>

<p>Certain layout managers allow dynamic addition of child components. Those that do include
<a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">Ext.layout.container.Card</a>, <a href="#!/api/Ext.layout.container.Anchor" rel="Ext.layout.container.Anchor" class="docClass">Ext.layout.container.Anchor</a>, <a href="#!/api/Ext.layout.container.VBox" rel="Ext.layout.container.VBox" class="docClass">Ext.layout.container.VBox</a>,
<a href="#!/api/Ext.layout.container.HBox" rel="Ext.layout.container.HBox" class="docClass">Ext.layout.container.HBox</a>, and <a href="#!/api/Ext.layout.container.Table" rel="Ext.layout.container.Table" class="docClass">Ext.layout.container.Table</a>. For example:</p>

<pre><code>//  Create the GridPanel.
var myNewGrid = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', \{
    store: myStore,
    headers: myHeaders,
    title: 'Results', // the title becomes the title of the tab
\});

myTabPanel.add(myNewGrid); // <a href="#!/api/Ext.tab.Panel" rel="Ext.tab.Panel" class="docClass">Ext.tab.Panel</a> implicitly uses <a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">Card</a>
myTabPanel.<a href="#!/api/Ext.tab.Panel-method-setActiveTab" rel="Ext.tab.Panel-method-setActiveTab" class="docClass">setActiveTab</a>(myNewGrid);
</code></pre>

<p>The example above adds a newly created GridPanel to a TabPanel. Note that a TabPanel uses <a href="#!/api/Ext.layout.container.Card" rel="Ext.layout.container.Card" class="docClass">Ext.layout.container.Card</a> as its layout manager which means all its child items are sized to <a href="#!/api/Ext.layout.container.Fit" rel="Ext.layout.container.Fit" class="docClass">fit</a> exactly into its client area.</p>

<p><strong><em>Overnesting is a common problem</em></strong>. An example of overnesting occurs when a GridPanel is added to a TabPanel by
wrapping the GridPanel <em>inside</em> a wrapping Panel (that has no <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code> specified) and then add that
wrapping Panel to the TabPanel. The point to realize is that a GridPanel <strong>is</strong> a Component which can be added
directly to a Container. If the wrapping Panel has no <code><a href="#!/api/Ext.container.Container-cfg-layout" rel="Ext.container.Container-cfg-layout" class="docClass">layout</a></code> configuration, then the overnested
GridPanel will not be sized as expected.</p>

<h2>Adding via remote configuration</h2>

<p>A server side script can be used to add Components which are generated dynamically on the server. An example of
adding a GridPanel to a TabPanel where the GridPanel is generated by the server based on certain parameters:</p>

<pre><code>// execute an Ajax request to invoke server side script:
<a href="#!/api/Ext.Ajax-method-request" rel="Ext.Ajax-method-request" class="docClass">Ext.Ajax.request</a>(\{
    url: 'gen-invoice-grid.php',
    // send additional parameters to instruct server script
    params: \{
        startDate: <a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">Ext.getCmp</a>('start-date').getValue(),
        endDate: <a href="#!/api/Ext-method-getCmp" rel="Ext-method-getCmp" class="docClass">Ext.getCmp</a>('end-date').getValue()
    \},
    // process the response object to add it to the TabPanel:
    success: function(xhr) \{
        var newComponent = eval(xhr.responseText); // see discussion below
        myTabPanel.add(newComponent); // add the component to the TabPanel
        myTabPanel.setActiveTab(newComponent);
    \},
    failure: function() \{
        <a href="#!/api/Ext.MessageBox-method-alert" rel="Ext.MessageBox-method-alert" class="docClass">Ext.Msg.alert</a>("Grid create failed", "Server communication failure");
    \}
\});
</code></pre>

<p>The server script needs to return a JSON representation of a configuration object, which, when decoded will return a
config object with an <a href="#!/api/Ext.Component-cfg-xtype" rel="Ext.Component-cfg-xtype" class="docClass">xtype</a>. The server might return the following JSON:</p>

<pre><code>\{
    "xtype": 'grid',
    "title": 'Invoice Report',
    "store": \{
        "model": 'Invoice',
        "proxy": \{
            "type": 'ajax',
            "url": 'get-invoice-data.php',
            "reader": \{
                "type": 'json'
                "record": 'transaction',
                "idProperty": 'id',
                "totalRecords": 'total'
            \})
        \},
        "autoLoad": \{
            "params": \{
                "startDate": '01/01/2008',
                "endDate": '01/31/2008'
            \}
        \}
    \},
    "headers": [
        \{"header": "Customer", "width": 250, "dataIndex": 'customer', "sortable": true\},
        \{"header": "Invoice Number", "width": 120, "dataIndex": 'invNo', "sortable": true\},
        \{"header": "Invoice Date", "width": 100, "dataIndex": 'date', "renderer": <a href="#!/api/Ext.util.Format-method-dateRenderer" rel="Ext.util.Format-method-dateRenderer" class="docClass">Ext.util.Format.dateRenderer</a>('M d, y'), "sortable": true\},
        \{"header": "Value", "width": 120, "dataIndex": 'value', "renderer": 'usMoney', "sortable": true\}
    ]
\}
</code></pre>

<p>When the above code fragment is passed through the <code>eval</code> function in the success handler of the Ajax request, the
result will be a config object which, when added to a Container, will cause instantiation of a GridPanel. <strong>Be sure
that the Container is configured with a layout which sizes and positions the child items to your requirements.</strong></p>

<p><strong>Note:</strong> since the code above is <em>generated</em> by a server script, the <code>autoLoad</code> params for the Store, the user's
preferred date format, the metadata to allow generation of the Model layout, and the ColumnModel can all be generated
into the code since these are all known on the server.</p> %}
  *)

class type t =
object('self)
  inherit Ext_container_AbstractContainer.t
  
  method getChildByElement : _ Js.t -> bool Js.t -> #Ext_Component.t Js.t
    Js.meth
  (** {% <p>Return the immediate child Component in which the passed element is located.</p> %}
    
    {b Parameters}:
    {ul {- el: [_ Js.t]
    {% <p>The element to test (or ID of element).</p> %}
    }
    {- deep: [bool Js.t]
    {% <p>If <code>true</code>, returns the deepest descendant Component which contains the passed element.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The child item which contains the passed element.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_container_AbstractContainer.configs
  
  method anchorSize : _ Js.t Js.prop
  (** {% <p>Defines the anchoring size of container.
Either a number to define the width of the container or an object with <code>width</code> and <code>height</code> fields.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_container_AbstractContainer.events
  
  
end

class type statics =
object
  inherit Ext_container_AbstractContainer.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

