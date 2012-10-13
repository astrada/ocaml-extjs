(** Represents a filter that can be applied to a Mixed ...
  
  {% <p>Represents a filter that can be applied to a <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">MixedCollection</a>. Can either simply
filter on a property/value pair or pass in a filter function with custom logic. Filters are always used in the
context of MixedCollections, though <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a>s frequently create them when filtering and searching
on their records. Example usage:</p>

<pre><code>//set up a fictional MixedCollection containing a few people to filter on
var allNames = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
allNames.addAll([
    {id: 1, name: 'Ed',    age: 25},
    {id: 2, name: 'Jamie', age: 37},
    {id: 3, name: 'Abe',   age: 32},
    {id: 4, name: 'Aaron', age: 26},
    {id: 5, name: 'David', age: 32}
]);

var ageFilter = new <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>({
    property: 'age',
    value   : 32
});

var longNameFilter = new <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>({
    filterFn: function(item) {
        return item.name.length &gt; 4;
    }
});

//a new MixedCollection with the 3 names longer than 4 characters
var longNames = allNames.filter(longNameFilter);

//a new MixedCollection with the 2 people of age 32:
var youngFolk = allNames.filter(ageFilter);
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
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
  method filterFn : 'a Js.callback Js.prop
  (** {% <p>A custom filter function which is passed each item in the <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a> in turn. Should return
true to accept each item or false to reject it</p> %}
    *)
  method property : Js.js_string Js.t Js.prop
  (** {% <p>The property to filter on. Required unless a <a href="#!/api/Ext.util.Filter-cfg-filterFn" rel="Ext.util.Filter-cfg-filterFn" class="docClass">filterFn</a> is passed</p> %}
    *)
  method root : Js.js_string Js.t Js.prop
  (** {% <p>Optional root property. This is mostly useful when filtering a Store, in which case we set the root to 'data' to
make the filter pull the <a href="#!/api/Ext.util.Filter-cfg-property" rel="Ext.util.Filter-cfg-property" class="docClass">property</a> out of the data object of each item</p> %}
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

