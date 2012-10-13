(** Grids are an excellent way of showing large amount ...
  
  {% <p>Grids are an excellent way of showing large amounts of tabular data on the client side. Essentially a supercharged
<code>&lt;table&gt;</code>, GridPanel makes it easy to fetch, sort and filter large amounts of data.</p>

<p>Grids are composed of two main pieces - a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> full of data and a set of columns to render.</p>

<h2>Basic GridPanel</h2>

<pre class='inline-example '><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    storeId:'simpsonsStore',
    fields:['name', 'email', 'phone'],
    data:{'items':[
        { 'name': 'Lisa',  "email":"lisa\@simpsons.com",  "phone":"555-111-1224"  },
        { 'name': 'Bart',  "email":"bart\@simpsons.com",  "phone":"555-222-1234" },
        { 'name': 'Homer', "email":"home\@simpsons.com",  "phone":"555-222-1244"  },
        { 'name': 'Marge', "email":"marge\@simpsons.com", "phone":"555-222-1254"  }
    ]},
    proxy: {
        type: 'memory',
        reader: {
            type: 'json',
            root: 'items'
        }
    }
});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    title: 'Simpsons',
    store: <a href="#!/api/Ext.data.StoreManager-method-lookup" rel="Ext.data.StoreManager-method-lookup" class="docClass">Ext.data.StoreManager.lookup</a>('simpsonsStore'),
    columns: [
        { text: 'Name',  dataIndex: 'name' },
        { text: 'Email', dataIndex: 'email', flex: 1 },
        { text: 'Phone', dataIndex: 'phone' }
    ],
    height: 200,
    width: 400,
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>()
});
</code></pre>

<p>The code above produces a simple grid with three columns. We specified a Store which will load JSON data inline.
In most apps we would be placing the grid inside another container and wouldn't need to use the
<a href="#!/api/Ext.grid.Panel-cfg-height" rel="Ext.grid.Panel-cfg-height" class="docClass">height</a>, <a href="#!/api/Ext.grid.Panel-cfg-width" rel="Ext.grid.Panel-cfg-width" class="docClass">width</a> and <a href="#!/api/Ext.grid.Panel-cfg-renderTo" rel="Ext.grid.Panel-cfg-renderTo" class="docClass">renderTo</a> configurations but they are included here to make it easy to get
up and running.</p>

<p>The grid we created above will contain a header bar with a title ('Simpsons'), a row of column headers directly underneath
and finally the grid rows under the headers.</p>

<h2>Configuring columns</h2>

<p>By default, each column is sortable and will toggle between ASC and DESC sorting when you click on its header. Each
column header is also reorderable by default, and each gains a drop-down menu with options to hide and show columns.
It's easy to configure each column - here we use the same example as above and just modify the columns config:</p>

<pre><code>columns: [
    {
        text: 'Name',
        dataIndex: 'name',
        sortable: false,
        hideable: false,
        flex: 1
    },
    {
        text: 'Email',
        dataIndex: 'email',
        hidden: true
    },
    {
        text: 'Phone',
        dataIndex: 'phone',
        width: 100
    }
]
</code></pre>

<p>We turned off sorting and hiding on the 'Name' column so clicking its header now has no effect. We also made the Email
column hidden by default (it can be shown again by using the menu on any other column). We also set the Phone column to
a fixed with of 100px and flexed the Name column, which means it takes up all remaining width after the other columns
have been accounted for. See the <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column docs</a> for more details.</p>

<h2>Renderers</h2>

<p>As well as customizing columns, it's easy to alter the rendering of individual cells using renderers. A renderer is
tied to a particular column and is passed the value that would be rendered into each cell in that column. For example,
we could define a renderer function for the email column to turn each email address into a mailto link:</p>

<pre><code>columns: [
    {
        text: 'Email',
        dataIndex: 'email',
        renderer: function(value) {
            return <a href="#!/api/Ext.String-method-format" rel="Ext.String-method-format" class="docClass">Ext.String.format</a>('&lt;a href="mailto:{0}"&gt;{1}&lt;/a&gt;', value, value);
        }
    }
]
</code></pre>

<p>See the <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column docs</a> for more information on renderers.</p>

<h2>Selection Models</h2>

<p>Sometimes all you want is to render data onto the screen for viewing, but usually it's necessary to interact with or
update that data. Grids use a concept called a Selection Model, which is simply a mechanism for selecting some part of
the data in the grid. The two main types of Selection Model are RowSelectionModel, where entire rows are selected, and
CellSelectionModel, where individual cells are selected.</p>

<p>Grids use a Row Selection Model by default, but this is easy to customise like so:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    selType: 'cellmodel',
    store: ...
});
</code></pre>

<p>Specifying the <code>cellmodel</code> changes a couple of things. Firstly, clicking on a cell now
selects just that cell (using a <a href="#!/api/Ext.selection.RowModel" rel="Ext.selection.RowModel" class="docClass">rowmodel</a> will select the entire row), and secondly the
keyboard navigation will walk from cell to cell instead of row to row. Cell-based selection models are usually used in
conjunction with editing.</p>

<h2>Sorting &amp; Filtering</h2>

<p>Every grid is attached to a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a>, which provides multi-sort and filtering capabilities. It's
easy to set up a grid to be sorted from the start:</p>

<pre><code>var myGrid = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    store: {
        fields: ['name', 'email', 'phone'],
        sorters: ['name', 'phone']
    },
    columns: [
        { text: 'Name',  dataIndex: 'name' },
        { text: 'Email', dataIndex: 'email' }
    ]
});
</code></pre>

<p>Sorting at run time is easily accomplished by simply clicking each column header. If you need to perform sorting on
more than one field at run time it's easy to do so by adding new sorters to the store:</p>

<pre><code>myGrid.store.sort([
    { property: 'name',  direction: 'ASC' },
    { property: 'email', direction: 'DESC' }
]);
</code></pre>

<p>See <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> for examples of filtering.</p>

<h2>State saving</h2>

<p>When configured <a href="#!/api/Ext.grid.Panel-cfg-stateful" rel="Ext.grid.Panel-cfg-stateful" class="docClass">stateful</a>, grids save their column state (order and width) encapsulated within the default
Panel state of changed width and height and collapsed/expanded state.</p>

<p>Each <a href="#!/api/Ext.grid.Panel-cfg-columns" rel="Ext.grid.Panel-cfg-columns" class="docClass">column</a> of the grid may be configured with a <a href="#!/api/Ext.grid.column.Column-cfg-stateId" rel="Ext.grid.column.Column-cfg-stateId" class="docClass">stateId</a> which
identifies that column locally within the grid.</p>

<h2>Plugins and Features</h2>

<p>Grid supports addition of extra functionality through features and plugins:</p>

<ul>
<li><p><a href="#!/api/Ext.grid.plugin.CellEditing" rel="Ext.grid.plugin.CellEditing" class="docClass">CellEditing</a> - editing grid contents one cell at a time.</p></li>
<li><p><a href="#!/api/Ext.grid.plugin.RowEditing" rel="Ext.grid.plugin.RowEditing" class="docClass">RowEditing</a> - editing grid contents an entire row at a time.</p></li>
<li><p><a href="#!/api/Ext.grid.plugin.DragDrop" rel="Ext.grid.plugin.DragDrop" class="docClass">DragDrop</a> - drag-drop reordering of grid rows.</p></li>
<li><p><a href="#!/api/Ext.toolbar.Paging" rel="Ext.toolbar.Paging" class="docClass">Paging toolbar</a> - paging through large sets of data.</p></li>
<li><p><a href="#!/api/Ext.grid.PagingScroller" rel="Ext.grid.PagingScroller" class="docClass">Infinite scrolling</a> - another way to handle large sets of data.</p></li>
<li><p><a href="#!/api/Ext.grid.RowNumberer" rel="Ext.grid.RowNumberer" class="docClass">RowNumberer</a> - automatically numbered rows.</p></li>
<li><p><a href="#!/api/Ext.grid.feature.Grouping" rel="Ext.grid.feature.Grouping" class="docClass">Grouping</a> - grouping together rows having the same value in a particular field.</p></li>
<li><p><a href="#!/api/Ext.grid.feature.Summary" rel="Ext.grid.feature.Summary" class="docClass">Summary</a> - a summary row at the bottom of a grid.</p></li>
<li><p><a href="#!/api/Ext.grid.feature.GroupingSummary" rel="Ext.grid.feature.GroupingSummary" class="docClass">GroupingSummary</a> - a summary row at the bottom of each group.</p></li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_AbstractComponent.t
  inherit Ext_Component.t
  inherit Ext_container_AbstractContainer.t
  inherit Ext_container_Container.t
  inherit Ext_panel_AbstractPanel.t
  inherit Ext_panel_Panel.t
  inherit Ext_panel_Table.t
  
  method reconfigure : Ext_data_Store.t Js.t Js.optdef ->
    'a Js.t Js.js_array Js.t Js.optdef -> unit Js.meth
  (** {% <p>Reconfigures the grid with a new store/columns. Either the store or the columns can be omitted if you don't wish
to change them.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The new store.</p> %}
    }
    {- columns: ['a Js.t Js.js_array Js.t]
    {% <p>An array of column configs</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_AbstractComponent.configs
  inherit Ext_Component.configs
  inherit Ext_container_AbstractContainer.configs
  inherit Ext_container_Container.configs
  inherit Ext_panel_AbstractPanel.configs
  inherit Ext_panel_Panel.configs
  inherit Ext_panel_Table.configs
  
  method columns : 'a Js.t Js.prop
  (** {% <p>An array of <a href="#!/api/Ext.grid.column.Column" rel="Ext.grid.column.Column" class="docClass">column</a> definition objects which define all columns that appear in this
grid. Each column definition provides the header text for the column, and a definition of where the data for that
column comes from.</p>

<p>This can also be a configuration object for a {<a href="#!/api/Ext.grid.header.Container" rel="Ext.grid.header.Container" class="docClass">Ext.grid.header.Container</a> HeaderContainer} which may override
certain default configurations if necessary. For example, the special layout may be overridden to use a simpler
layout, or one can set default values shared by all columns:</p>

<pre><code>columns: {
    items: [
        {
            text: "Column A"
            dataIndex: "field_A"
        },{
            text: "Column B",
            dataIndex: "field_B"
        }, 
        ...
    ],
    defaults: {
        flex: 1
    }
}
</code></pre> %}
    *)
  method rowLines : bool Js.t Js.prop
  (** {% <p>False to remove row line styling</p> %}
    
    Defaults to: [true]
    *)
  method viewType : Js.js_string Js.t Js.prop
  (** {% <p>An xtype of view to use. This is automatically set to 'gridview' by <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Grid</a>
and to 'treeview' by <a href="#!/api/Ext.tree.Panel" rel="Ext.tree.Panel" class="docClass">Tree</a>.</p> %}
    
    Defaults to: ['gridview']
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_AbstractComponent.events
  inherit Ext_Component.events
  inherit Ext_container_AbstractContainer.events
  inherit Ext_container_Container.events
  inherit Ext_panel_AbstractPanel.events
  inherit Ext_panel_Panel.events
  inherit Ext_panel_Table.events
  
  method reconfigure : (t Js.t -> Ext_data_Store.t Js.t ->
    'a Js.t Js.js_array Js.t -> 'b Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after a reconfigure.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_grid_Panel.t Js.t]
    }
    {- store: [Ext_data_Store.t Js.t]
    {% <p>The store that was passed to the <a href="#!/api/Ext.grid.Panel-method-reconfigure" rel="Ext.grid.Panel-method-reconfigure" class="docClass">reconfigure</a> method</p> %}
    }
    {- columns: ['a Js.t Js.js_array Js.t]
    {% <p>The column configs that were passed to the <a href="#!/api/Ext.grid.Panel-method-reconfigure" rel="Ext.grid.Panel-method-reconfigure" class="docClass">reconfigure</a> method</p> %}
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
  inherit Ext_container_AbstractContainer.statics
  inherit Ext_container_Container.statics
  inherit Ext_panel_AbstractPanel.statics
  inherit Ext_panel_Panel.statics
  inherit Ext_panel_Table.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

