(** Represents a collection of a set of key and value ...
  
  {% <p>
Represents a collection of a set of key and value pairs. Each key in the MixedCollection
must be unique, the same key cannot exist twice. This collection is ordered, items in the
collection can be accessed by index  or via the key. Newly added items are added to
the end of the collection. This class is similar to <a href="#!/api/Ext.util.HashMap" rel="Ext.util.HashMap" class="docClass">Ext.util.HashMap</a> however it
is heavier and provides more functionality. Sample usage:
<pre><code>var coll = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
coll.add('key1', 'val1');
coll.add('key2', 'val2');
coll.add('key3', 'val3');

console.log(coll.get('key1')); // prints 'val1'
console.log(coll.indexOfKey('key3')); // prints 2
</code></pre>

<p>
The MixedCollection also has support for sorting and filtering of the values in the collection.
<pre><code>var coll = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
coll.add('key1', 100);
coll.add('key2', -100);
coll.add('key3', 17);
coll.add('key4', 0);
var biggerThanZero = coll.filterBy(function(value){
    return value > 0;
});
console.log(biggerThanZero.getCount()); // prints 2
</code></pre>
</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_AbstractMixedCollection.t
  inherit Ext_util_Sortable.t
  
  method findInsertionIndex : 'a Js.t -> 'b Js.callback Js.optdef ->
    Js.number Js.t Js.meth
  (** {% <p>Calculates the insertion index of the new item based upon the comparison function passed, or the current sort order.</p> %}
    
    {b Parameters}:
    {ul {- newItem: ['a Js.t]
    {% <p>The new object to find the insertion position of.</p> %}
    }
    {- sorterFn: ['a Js.callback]
    {% <p>The function to sort by. This is the same as the sorting function
passed to <a href="#!/api/Ext.util.MixedCollection-method-sortBy" rel="Ext.util.MixedCollection-method-sortBy" class="docClass">sortBy</a>. It accepts 2 items from this MixedCollection, and returns -1 0, or 1
depending on the relative sort positions of the 2 compared items.</p>

<p>If omitted, a function <a href="#!/api/Ext.util.MixedCollection-method-generateComparator" rel="Ext.util.MixedCollection-method-generateComparator" class="docClass">generated</a> from the currently defined set of
<a href="#!/api/Ext.util.MixedCollection-property-sorters" rel="Ext.util.MixedCollection-property-sorters" class="docClass">sorters</a> will be used.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The insertion point to add the new item into this MixedCollection at using <a href="#!/api/Ext.util.MixedCollection-method-insert" rel="Ext.util.MixedCollection-method-insert" class="docClass">insert</a></p> %}
    }
    }
    *)
  method reorder : 'a Js.t -> unit Js.meth
  (** {% <p>Reorders each of the items based on a mapping from old index to new index. Internally this
just translates into a sort. The 'sort' event is fired whenever reordering has occured.</p> %}
    
    {b Parameters}:
    {ul {- mapping: ['a Js.t]
    {% <p>Mapping from old item index to new item index</p> %}
    }
    }
    *)
  method sortBy : 'a Js.callback -> unit Js.meth
  (** {% <p>Sorts the collection by a single sorter function</p> %}
    
    {b Parameters}:
    {ul {- sorterFn: ['a Js.callback]
    {% <p>The function to sort by</p> %}
    }
    }
    *)
  method sortByKey : Js.js_string Js.t Js.optdef -> 'a Js.callback Js.optdef
    -> unit Js.meth
  (** {% <p>Sorts this collection by <b>key</b>s.</p> %}
    
    {b Parameters}:
    {ul {- direction: [Js.js_string Js.t]
    {% <p>'ASC' or 'DESC'. Defaults to 'ASC'.</p> %}
    }
    {- fn: ['a Js.callback]
    {% <p>Comparison function that defines the sort order.
Defaults to sorting by case insensitive string.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_AbstractMixedCollection.configs
  inherit Ext_util_Sortable.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_AbstractMixedCollection.events
  inherit Ext_util_Sortable.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_AbstractMixedCollection.statics
  inherit Ext_util_Sortable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)
