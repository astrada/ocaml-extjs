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
<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">Ext.grid.Panel</a>', {
    // other options
    features: [groupingFeature]
});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method collectData : bool Js.t Js.prop
  (** {% <p>Most features will not modify the data returned to the view.
This is limited to one feature that manipulates the data per grid view.</p> %}
    
    Defaults to: [false]
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
  method attachEvents : unit Js.meth
  (** {% <p>Approriate place to attach events to the view, selectionmodel, headerCt, etc</p> %}
    *)
  method disable : unit Js.meth
  (** {% <p>Disables the feature.</p> %}
    *)
  method enable : unit Js.meth
  (** {% <p>Enables the feature.</p> %}
    *)
  method getAdditionalData : _ Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Provide additional data to the prepareData call within the grid view.</p> %}
    
    {b Parameters}:
    {ul {- data: [_ Js.t]
    {% <p>The data for this particular record.</p> %}
    }
    {- idx: [Js.number Js.t]
    {% <p>The row index for this record.</p> %}
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record instance</p> %}
    }
    {- orig: [_ Js.t]
    {% <p>The original result from the prepareData call to massage.</p> %}
    }
    }
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
  method getMetaRowTplFragments : unit Js.meth
  (** {% <p>Allows a feature to inject member methods into the metaRowTpl. This is
important for embedding functionality which will become part of the proper
row tpl.</p> %}
    *)
  method mutateMetaRowTpl : _ Js.js_array Js.t -> unit Js.meth
  (** {% <p>Allows a feature to mutate the metaRowTpl.
The array received as a single argument can be manipulated to add things
on the end/begining of a particular row.</p> %}
    
    {b Parameters}:
    {ul {- metaRowTplArray: [_ Js.js_array Js.t]
    {% <p>A String array to be used constructing an <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">XTemplate</a>
to render the rows. This Array may be changed to provide extra DOM structure.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method attachEvents : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.attachEvents] *)
  method getAdditionalData : ('self Js.t, _ Js.t -> Js.number Js.t ->
    Ext_data_Model.t Js.t -> _ Js.t -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.getAdditionalData] *)
  method getFireEventArgs : ('self Js.t, _ Js.t -> _ Js.t -> _ Js.t -> _ Js.t
    -> unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.getFireEventArgs] *)
  method getMetaRowTplFragments : ('self Js.t, unit -> unit) Js.meth_callback
    Js.writeonly_prop
  (** See method [t.getMetaRowTplFragments] *)
  method mutateMetaRowTpl : ('self Js.t, _ Js.js_array Js.t -> unit)
    Js.meth_callback Js.writeonly_prop
  (** See method [t.mutateMetaRowTpl] *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

