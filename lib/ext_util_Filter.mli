(** Represents a filter that can be applied to a Mixed ...
  
  {% <p>Represents a filter that can be applied to a <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">MixedCollection</a>. Can either simply
filter on a property/value pair or pass in a filter function with custom logic. Filters are always used in the
context of MixedCollections, though <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a>s frequently create them when filtering and searching
on their records. Example usage:</p>

<pre><code>//set up a fictional MixedCollection containing a few people to filter on
var allNames = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
allNames.addAll([
    \{id: 1, name: 'Ed',    age: 25\},
    \{id: 2, name: 'Jamie', age: 37\},
    \{id: 3, name: 'Abe',   age: 32\},
    \{id: 4, name: 'Aaron', age: 26\},
    \{id: 5, name: 'David', age: 32\}
]);

var ageFilter = new <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>(\{
    property: 'age',
    value   : 32
\});

var longNameFilter = new <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>(\{
    filterFn: function(item) \{
        return item.name.length &gt; 4;
    \}
\});

//a new MixedCollection with the 3 names longer than 4 characters
var longNames = allNames.filter(longNameFilter);

//a new MixedCollection with the 2 people of age 32:
var youngFolk = allNames.filter(ageFilter);
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method setFilterFn : _ Js.callback -> unit Js.meth
  (** {% <p>Changes the filtering function which this Filter uses to choose items to include.</p>

<p>This replaces any configured <a href="#!/api/Ext.util.Filter-cfg-filterFn" rel="Ext.util.Filter-cfg-filterFn" class="docClass">filterFn</a> and overrides any <a href="#!/api/Ext.util.Filter-cfg-property" rel="Ext.util.Filter-cfg-property" class="docClass">property</a> and \{\@link #cfg-value) settings.</p> %}
    
    {b Parameters}:
    {ul {- filterFn: [_ Js.callback]
    {% <p>A function which returns <code>true</code> or <code>false</code> to either include or exclude the passed object.</p> %}
    }
    }
    *)
  method setValue : _ Js.t -> unit Js.meth
  (** {% <p>Changes the value that this filter tests its configured (\@link #cfg-property\} with.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The new value to compare the property with.</p> %}
    }
    }
    *)
  method disabled : bool Js.t Js.prop
  (** {% <p>Setting this property to <code>true</code> disables this individual Filter so that it no longer contributes to a <a href="#!/api/Ext.data.Store-property-filters" rel="Ext.data.Store-property-filters" class="docClass">Store's filter set</a></p>

<p>When disabled, the next time the store is filtered, the Filter plays no part in filtering and records eliminated by it may rejoin the dataset.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method anyMatch : bool Js.t Js.prop
  (** {% <p>True to allow any match - no regex start/end line anchors will be added.</p> %}
    
    Defaults to: [false]
    *)
  method caseSensitive : bool Js.t Js.prop
  (** {% <p>True to make the regex case sensitive (adds 'i' switch to regex).</p> %}
    
    Defaults to: [false]
    *)
  method exactMatch : bool Js.t Js.prop
  (** {% <p>True to force exact match (^ and $ characters added to the regex). Ignored if anyMatch is true.</p> %}
    
    Defaults to: [false]
    *)
  method filterFn : _ Js.callback Js.prop
  (** {% <p>A custom filter function which is passed each item in the <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a> in turn. Should return
<code>true</code> to accept each item or <code>false</code> to reject it.</p> %}
    *)
  method id : Js.js_string Js.t Js.prop
  (** {% <p>An identifier by which this Filter is indexed in a <a href="#!/api/Ext.data.Store-property-filters" rel="Ext.data.Store-property-filters" class="docClass">Store's filters collection</a></p>

<p>Identified Filters may be individually removed from a Store's filter set by using <a href="#!/api/Ext.data.Store-method-removeFilter" rel="Ext.data.Store-method-removeFilter" class="docClass">Ext.data.Store.removeFilter</a>.</p>

<p>Anonymous Filters may be removed en masse by passing <code>null</code> to <a href="#!/api/Ext.data.Store-method-removeFilter" rel="Ext.data.Store-method-removeFilter" class="docClass">Ext.data.Store.removeFilter</a>.</p> %}
    *)
  method operator : Js.js_string Js.t Js.prop
  (** {% <p>The operator to use to compare the <a href="#!/api/Ext.util.Filter-cfg-property" rel="Ext.util.Filter-cfg-property" class="docClass">property</a> to this Filter's <a href="#!/api/Ext.util.Filter-cfg-value" rel="Ext.util.Filter-cfg-value" class="docClass">value</a></p>

<p>Possible values are:
   * &lt;
   * &lt;=
   * =
   * >=
   * >
   * !=</p> %}
    *)
  method property : Js.js_string Js.t Js.prop
  (** {% <p>The property to filter on. Required unless a <a href="#!/api/Ext.util.Filter-cfg-filterFn" rel="Ext.util.Filter-cfg-filterFn" class="docClass">filterFn</a> is passed</p> %}
    *)
  method root : Js.js_string Js.t Js.prop
  (** {% <p>Optional root property. This is mostly useful when filtering a Store, in which case we set the root to 'data' to
make the filter pull the <a href="#!/api/Ext.util.Filter-cfg-property" rel="Ext.util.Filter-cfg-property" class="docClass">property</a> out of the data object of each item</p> %}
    *)
  method value : _ Js.t Js.prop
  (** {% <p>The value to filter on. Required unless a <a href="#!/api/Ext.util.Filter-cfg-filterFn" rel="Ext.util.Filter-cfg-filterFn" class="docClass">filterFn</a> is passed.</p> %}
    *)
  
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

