(** A feature is a type of plugin that is specific to ...
  
  {% <p>A feature is a type of plugin that is specific to the <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>. It provides several
hooks that allows the developer to inject additional functionality at certain points throughout the
grid creation cycle. This class provides the base template methods that are available to the developer,
it should be extended.</p>

<p>There are several built in features that extend this class, for example:</p>

<ul>
<li><a href="#!/api/Ext.grid.feature.Grouping" rel="Ext.grid.feature.Grouping" class="docClass">Ext.grid.feature.Grouping</a> - Shows grid rows in groups as specified by the <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a></li>
<li><a href="#!/api/Ext.grid.feature.RowBody" rel="Ext.grid.feature.RowBody" class="docClass">Ext.grid.feature.RowBody</a> - Adds a body section for each grid row that can contain markup.</li>
<li><a href="#!/api/Ext.grid.feature.Summary" rel="Ext.grid.feature.Summary" class="docClass">Ext.grid.feature.Summary</a> - Adds a summary row at the bottom of the grid with aggregate totals for a column.</li>
</ul>


<h2>Using Features</h2>

<p>A feature is added to the grid by specifying it an array of features in the configuration:</p>

<pre><code>var groupingFeature = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.feature.Grouping" rel="Ext.grid.feature.Grouping" class="docClass">Ext.grid.feature.Grouping</a>');
<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', \{
    // other options
    features: [groupingFeature]
\});
</code></pre>

<h2>Writing Features</h2>

<p>A Feature may add new DOM structure within the structure of a grid.</p>

<p>A grid is essentially a <code>&lt;table&gt;</code> element. A <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">TableView</a> instance uses three <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplates</a>
to render the grid, <code>tableTpl</code>, <code>rowTpl</code>, <code>cellTpl</code>.</p>

<ul>
<li>A <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">TableView</a> uses its <code>tableTpl</code> to emit the <code>&lt;table&gt;</code> and <code>&lt;tbody&gt;</code> HTML tags into its output stream. It also emits a <code>&lt;thead&gt;</code> which contains a
sizing row. To ender the rows, it invokes <a href="#!/api/Ext.view.Table-method-renderRows" rel="Ext.view.Table-method-renderRows" class="docClass">Ext.view.Table.renderRows</a> passing the <code>rows</code> member of its data object.</li>
</ul>


<p>The <code>tableTpl</code>'s data object Looks like this:</p>

<pre><code>\{
    view: owningTableView,
    rows: recordsToRender,
    viewStartIndex: indexOfFirstRecordInStore,
    tableStyle: styleString
\}
</code></pre>

<ul>
<li>A <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">TableView</a> uses its <code>rowTpl</code> to emit a <code>&lt;tr&gt;</code> HTML tag to its output stream. To render cells,
it invokes <a href="#!/api/Ext.view.Table-method-renderCell" rel="Ext.view.Table-method-renderCell" class="docClass">Ext.view.Table.renderCell</a> passing the <code>rows</code> member of its data object.</li>
</ul>


<p>The <code>rowTpl</code>'s data object looks like this:</p>

<pre><code>\{
    view:        owningTableView,
    record:      recordToRender,
    recordIndex: indexOfRecordInStore,
    columns:     arrayOfColumnDefinitions,
    itemClasses: arrayOfClassNames, // For outermost row in case of wrapping
    rowClasses:  arrayOfClassNames,  // For internal data bearing row in case of wrapping
    rowStyle:    styleString
\}
</code></pre>

<ul>
<li>A <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">TableView</a> uses its <code>cellTpl</code> to emit a <code>&lt;td&gt;</code> HTML tag to its output stream.</li>
</ul>


<p>The <code>cellTpl's</code> data object looks like this:</p>

<pre><code>\{
    record: recordToRender
    column: columnToRender;
    recordIndex: indexOfRecordInStore,
    columnIndex: columnIndex,
    align: columnAlign,
    tdCls: classForCell
\}
</code></pre>

<p>A Feature may inject its own tableTpl or rowTpl or cellTpl into the <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">TableView</a>'s rendering by
calling <a href="#!/api/Ext.view.Table-method-addTableTpl" rel="Ext.view.Table-method-addTableTpl" class="docClass">Ext.view.Table.addTableTpl</a> or <a href="#!/api/Ext.view.Table-method-addRowTpl" rel="Ext.view.Table-method-addRowTpl" class="docClass">Ext.view.Table.addRowTpl</a> or <a href="#!/api/Ext.view.Table-method-addCellTpl" rel="Ext.view.Table-method-addCellTpl" class="docClass">Ext.view.Table.addCellTpl</a>.</p>

<p>The passed XTemplate is added <em>upstream</em> of the default template for the table element in a link list of XTemplates which contribute
to the element's HTML. It may emit appropriate HTML strings into the output stream <em>around</em> a call to</p>

<pre><code>this.nextTpl.apply(values, out, parent);
</code></pre>

<p>This passes the current value context, output stream and the parent value context to the next XTemplate in the list.</p> %}
  *)

class type t =
object('self)
  inherit Ext_util_Observable.t
  
  method disable : unit Js.meth
  (** {% <p>Disables the feature.</p> %}
    *)
  method enable : unit Js.meth
  (** {% <p>Enables the feature.</p> %}
    *)
  method getFireEventArgs : _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit
    Js.meth
  (** {% <p>Abstract method to be overriden when a feature should add additional
arguments to its event signature. By default the event will fire:</p>

<ul>
<li>view - The underlying <a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a></li>
<li>featureTarget - The matched element by the defined <a href="#!/api/Ext.grid.feature.Feature-property-eventSelector" rel="Ext.grid.feature.Feature-property-eventSelector" class="docClass">eventSelector</a></li>
</ul>


<p>The method must also return the eventName as the first index of the array
to be passed to fireEvent.</p> %}
    
    {b Parameters}:
    {ul {- eventName: [_ Js.t]
    }
    {- view: [_ Js.t]
    }
    {- featureTarget: [_ Js.t]
    }
    {- e: [_ Js.t]
    }
    }
    *)
  method disabled : bool Js.t Js.prop
  (** {% <p>True when feature is disabled.</p> %}
    
    Defaults to: [false]
    *)
  method eventPrefix : Js.js_string Js.t Js.prop
  (** {% <p>Prefix to use when firing events on the view.
For example a prefix of group would expose "groupclick", "groupcontextmenu", "groupdblclick".</p> %}
    *)
  method eventSelector : Js.js_string Js.t Js.prop
  (** {% <p>Selector used to determine when to fire the event with the eventPrefix.</p> %}
    *)
  method grid : _ Js.t Js.prop
  (** {% <p>Reference to the grid panel</p> %}
    *)
  method hasFeatureEvent : bool Js.t Js.prop
  (** {% <p>Most features will expose additional events, some may not and will
need to change this to false.</p> %}
    
    Defaults to: [true]
    *)
  method view : _ Js.t Js.prop
  (** {% <p>Reference to the TableView.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_util_Observable.configs
  
  method getFireEventArgs : ('self Js.t, _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t
    -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.getFireEventArgs] *)
  
end

class type events =
object
  inherit Ext_util_Observable.events
  
  
end

class type statics =
object
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

