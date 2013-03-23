(** The grid View class provides extra Ext.grid.Panel ...
  
  {% <p>The grid View class provides extra <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a> specific functionality to the
<a href="#!/api/Ext.view.Table" rel="Ext.view.Table" class="docClass">Ext.view.Table</a>. In general, this class is not instanced directly, instead a viewConfig
option is passed to the grid:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', \{
    // other options
    viewConfig: \{
        stripeRows: false
    \}
\});
</code></pre>

<h2>Drag Drop</h2>

<p>Drag and drop functionality can be achieved in the grid by attaching a <a href="#!/api/Ext.grid.plugin.DragDrop" rel="Ext.grid.plugin.DragDrop" class="docClass">Ext.grid.plugin.DragDrop</a> plugin
when creating the view.</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', \{
    // other options
    viewConfig: \{
        plugins: \{
            ddGroup: 'people-group',
            ptype: 'gridviewdragdrop',
            enableDrop: false
        \}
    \}
\});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_view_Table.t
  
  
end

class type configs =
object('self)
  inherit Ext_view_Table.configs
  
  method autoScroll : bool Js.t Js.prop
  (** {% <p><code>true</code> to use overflow:'auto' on the components layout element and show scroll bars automatically when necessary,
<code>false</code> to clip any overflowing content.
This should not be combined with <a href="#!/api/Ext.grid.View-cfg-overflowX" rel="Ext.grid.View-cfg-overflowX" class="docClass">overflowX</a> or  <a href="#!/api/Ext.grid.View-cfg-overflowY" rel="Ext.grid.View-cfg-overflowY" class="docClass">overflowY</a>.</p> %}
    
    Defaults to: [true]
    *)
  method stripeRows : bool Js.t Js.prop
  (** {% <p>True to stripe the rows.</p>

<p>This causes the CSS class <strong><code>x-grid-row-alt</code></strong> to be added to alternate rows of the grid. A default CSS rule is
provided which sets a background color, but you can override this with a rule which either overrides the
<strong>background-color</strong> style using the <code>!important</code> modifier, or which uses a CSS selector of higher specificity.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_view_Table.events
  
  
end

class type statics =
object
  inherit Ext_view_Table.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

