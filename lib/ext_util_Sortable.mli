(** A mixin which allows a data component to be sorted ...
  
  {% <p>A mixin which allows a data component to be sorted. This is used by e.g. <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> and <a href="#!/api/Ext.data.TreeStore" rel="Ext.data.TreeStore" class="docClass">Ext.data.TreeStore</a>.</p>

<p><strong>NOTE</strong>: This mixin is mainly for internal use and most users should not need to use it directly. It
is more likely you will want to use one of the component classes that import this mixin, such as
<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> or <a href="#!/api/Ext.data.TreeStore" rel="Ext.data.TreeStore" class="docClass">Ext.data.TreeStore</a>.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method isSortable : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Sortable, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method sorters : _ Js.t Js.prop
  (** {% <p>The collection of <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Sorters</a> currently applied to this Store</p> %}
    *)
  method generateComparator : unit Js.meth
  (** {% <p>Returns a comparator function which compares two items and returns -1, 0, or 1 depending
on the currently defined set of <a href="#!/api/Ext.util.Sortable-cfg-sorters" rel="Ext.util.Sortable-cfg-sorters" class="docClass">sorters</a>.</p>

<p>If there are no <a href="#!/api/Ext.util.Sortable-cfg-sorters" rel="Ext.util.Sortable-cfg-sorters" class="docClass">sorters</a> defined, it returns a function which returns <code>0</code> meaning
that no sorting will occur.</p> %}
    *)
  method getFirstSorter : Ext_util_Sorter.t Js.t Js.meth
  (** {% <p>Gets the first sorter from the sorters collection, excluding
any groupers that may be in place</p> %}
    
    {b Returns}:
    {ul {- [Ext_util_Sorter.t Js.t]
    {% <p>The sorter, null if none exist</p> %}
    }
    }
    *)
  method initSortable : unit Js.meth
  (** {% <p>Performs initialization of this mixin. Component classes using this mixin should call this method during their
own initialization.</p> %}
    *)
  method sort : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Ext_util_Sorter.t Js.js_array Js.t Js.meth
  (** {% <p>Sorts the data in the Store by one or more of its properties. Example usage:</p>

<pre><code>//sort by a single field
myStore.sort('myField', 'DESC');

//sorting by multiple fields
myStore.sort([
    \{
        property : 'age',
        direction: 'ASC'
    \},
    \{
        property : 'name',
        direction: 'DESC'
    \}
]);
</code></pre>

<p>Internally, Store converts the passed arguments into an array of <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Ext.util.Sorter</a> instances, and delegates
the actual sorting to its internal <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>.</p>

<p>When passing a single string argument to sort, Store maintains a ASC/DESC toggler per field, so this code:</p>

<pre><code>store.sort('myField');
store.sort('myField');
</code></pre>

<p>Is equivalent to this code, because Store handles the toggling automatically:</p>

<pre><code>store.sort('myField', 'ASC');
store.sort('myField', 'DESC');
</code></pre> %}
    
    {b Parameters}:
    {ul {- sorters: [_ Js.t] (optional)
    {% <p>Either a string name of one of the fields in this Store's configured
<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a>, or an array of sorter configurations.</p> %}
    }
    {- direction: [Js.js_string Js.t] (optional)
    {% <p>The overall direction to sort the data by.</p> %}
     Defaults to: "ASC"
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method defaultSortDirection : Js.js_string Js.t Js.prop
  (** {% <p>The default sort direction to use if one is not specified.</p> %}
    
    Defaults to: ["ASC"]
    *)
  method sortRoot : Js.js_string Js.t Js.prop
  (** {% <p>The property in each item that contains the data to sort.</p> %}
    *)
  method sorters : _ Js.t Js.prop
  (** {% <p>The initial set of <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Sorters</a></p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method createComparator : Ext_util_Sorter.t Js.js_array Js.t ->
    _ Js.callback Js.meth
  (** {% <p>Creates a single comparator function which encapsulates the passed Sorter array.</p> %}
    
    {b Parameters}:
    {ul {- sorters: [Ext_util_Sorter.t Js.js_array Js.t]
    {% <p>The sorter set for which to create a comparator function</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.callback]
    {% <p>a function, which when passed two comparable objects returns the result
of the whole sorter comparator functions.</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val createComparator : Ext_util_Sorter.t Js.js_array Js.t -> _ Js.callback
(** See method [statics.createComparator] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

