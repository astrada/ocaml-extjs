(**  ...
  
  {%  %} *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isMixedCollection : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated MixedCollection, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method add : 'a Js.t -> 'b Js.t Js.optdef -> 'c Js.t Js.meth
  (** {% <p>Adds an item to the collection. Fires the <a href="#!/api/Ext.util.AbstractMixedCollection-event-add" rel="Ext.util.AbstractMixedCollection-event-add" class="docClass">add</a> event when complete.</p> %}
    
    {b Parameters}:
    {ul {- key: ['a Js.t]
    {% <p>The key to associate with the item, or the new item.</p>

<p>If a <a href="#!/api/Ext.util.AbstractMixedCollection-method-getKey" rel="Ext.util.AbstractMixedCollection-method-getKey" class="docClass">getKey</a> implementation was specified for this MixedCollection,
or if the key of the stored items is in a property called <code>id</code>,
the MixedCollection will be able to <em>derive</em> the key for the new item.
In this case just pass the new item in this parameter.</p> %}
    }
    {- o: ['a Js.t]
    {% <p>The item to add.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The item added.</p> %}
    }
    }
    *)
  method addAll : 'a Js.t -> unit Js.meth
  (** {% <p>Adds all elements of an Array or an Object to the collection.</p> %}
    
    {b Parameters}:
    {ul {- objs: ['a Js.t]
    {% <p>An Object containing properties which will be added
to the collection, or an Array of values, each of which are added to the collection.
Functions references will be added to the collection if <code><a href="#!/api/Ext.util.AbstractMixedCollection-cfg-allowFunctions" rel="Ext.util.AbstractMixedCollection-cfg-allowFunctions" class="docClass">allowFunctions</a></code>
has been set to <code>true</code>.</p> %}
    }
    }
    *)
  method clear : unit Js.meth
  (** {% <p>Removes all items from the collection.  Fires the <a href="#!/api/Ext.util.AbstractMixedCollection-event-clear" rel="Ext.util.AbstractMixedCollection-event-clear" class="docClass">clear</a> event when complete.</p> %}
    *)
  method clone : 'self Js.t Js.meth
  (** {% <p>Creates a shallow copy of this collection</p> %}
    *)
  method collect : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'a Js.js_array Js.t Js.meth
  (** {% <p>Collects unique values of a particular property in this MixedCollection</p> %}
    
    {b Parameters}:
    {ul {- property: [Js.js_string Js.t]
    {% <p>The property to collect on</p> %}
    }
    {- root: [Js.js_string Js.t]
    {% <p>'root' property to extract the first argument from. This is used mainly when
summing fields in records, where the fields are all stored inside the 'data' object</p> %}
    }
    {- allowBlank: [bool Js.t]
    {% <p>Pass true to allow null, undefined or empty string values</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t] {% <p>The unique values</p> %}
    }
    }
    *)
  method contains : 'a Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the collection contains the passed Object as an item.</p> %}
    
    {b Parameters}:
    {ul {- o: ['a Js.t]
    {% <p>The Object to look for in the collection.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the collection contains the Object as an item.</p> %}
    }
    }
    *)
  method containsKey : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the collection contains the passed Object as a key.</p> %}
    
    {b Parameters}:
    {ul {- key: [Js.js_string Js.t]
    {% <p>The key to look for in the collection.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the collection contains the Object as a key.</p> %}
    }
    }
    *)
  method each : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  (** {% <p>Executes the specified function once for every item in the collection.
The function should return a boolean value.
Returning false from the function will stop the iteration.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to execute for each item.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference)
in which the function is executed. Defaults to the current item in the iteration.</p> %}
    }
    }
    *)
  method eachKey : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  (** {% <p>Executes the specified function once for every key in the collection, passing each
key, and its associated item as the first two parameters.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to execute for each item.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the
function is executed. Defaults to the browser window.</p> %}
    }
    }
    *)
  method filter : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Filters the objects in this collection by a set of <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Filter</a>s, or by a single
property/value pair with optional parameters for substring matching and case sensitivity. See
<a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Filter</a> for an example of using Filter objects (preferred). Alternatively,
MixedCollection can be easily filtered by property like this:</p>


<pre><code>//create a simple store with a few people defined
var people = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
people.addAll([
    {id: 1, age: 25, name: 'Ed'},
    {id: 2, age: 24, name: 'Tommy'},
    {id: 3, age: 24, name: 'Arne'},
    {id: 4, age: 26, name: 'Aaron'}
]);

//a new MixedCollection containing only the items where age == 24
var middleAged = people.filter('age', 24);
</code></pre> %}
    
    {b Parameters}:
    {ul {- property: ['a Js.t]
    {% <p>A property on your objects, or an array of <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Filter</a> objects</p> %}
    }
    {- value: ['a Js.t]
    {% <p>Either string that the property values
should start with or a RegExp to test against the property</p> %}
    }
    {- anyMatch: [bool Js.t]
    {% <p>True to match any part of the string, not just the beginning</p> %}
     Defaults to: false
    }
    {- caseSensitive: [bool Js.t]
    {% <p>True for case sensitive comparison.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_MixedCollection.t Js.t]
    {% <p>The new filtered collection</p> %}
    }
    }
    *)
  method filterBy : 'a Js.callback -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Filter by a function. Returns a <i>new</i> collection that has been filtered.
The passed function will be called with each object in the collection.
If the function returns true, the value is included otherwise it is filtered.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to be called.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in
which the function is executed. Defaults to this MixedCollection.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_MixedCollection.t Js.t]
    {% <p>The new filtered collection</p> %}
    }
    }
    *)
  method findBy : 'a Js.callback -> 'b Js.t Js.optdef -> 'c Js.t Js.meth
  (** {% <p>Returns the first item in the collection which elicits a true return value from the
passed selection function.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The selection function to execute for each item.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the
function is executed. Defaults to the browser window.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The first item in the collection which returned true from the selection
function, or null if none was found.</p> %}
    }
    }
    *)
  method findIndex : Js.js_string Js.t -> 'a Js.t -> Js.number Js.t Js.optdef
    -> bool Js.t Js.optdef -> bool Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Finds the index of the first matching object in this collection by a specific property/value.</p> %}
    
    {b Parameters}:
    {ul {- property: [Js.js_string Js.t]
    {% <p>The name of a property on your objects.</p> %}
    }
    {- value: ['a Js.t]
    {% <p>A string that the property values
should start with or a RegExp to test against the property.</p> %}
    }
    {- start: [Js.number Js.t] {% <p>The index to start searching at.</p> %}
     Defaults to: 0
    }
    {- anyMatch: [bool Js.t]
    {% <p>True to match any part of the string, not just the beginning.</p> %}
     Defaults to: false
    }
    {- caseSensitive: [bool Js.t]
    {% <p>True for case sensitive comparison.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The matched index or -1</p> %}
    }
    }
    *)
  method findIndexBy : 'a Js.callback -> 'b Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Find the index of the first matching object in this collection by a function.
If the function returns <i>true</i> it is considered a match.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to be called.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (<code>this</code> reference) in which the function is executed. Defaults to this MixedCollection.</p> %}
    }
    {- start: [Js.number Js.t] {% <p>The index to start searching at.</p> %}
     Defaults to: 0
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The matched index or -1</p> %}
    }
    }
    *)
  method first : 'a Js.t Js.meth
  (** {% <p>Returns the first item in the collection.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>the first item in the collection..</p> %}
    }
    }
    *)
  method get : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Returns the item associated with the passed key OR index.
Key has priority over index.  This is the equivalent
of calling <a href="#!/api/Ext.util.AbstractMixedCollection-method-getByKey" rel="Ext.util.AbstractMixedCollection-method-getByKey" class="docClass">getByKey</a> first, then if nothing matched calling <a href="#!/api/Ext.util.AbstractMixedCollection-method-getAt" rel="Ext.util.AbstractMixedCollection-method-getAt" class="docClass">getAt</a>.</p> %}
    
    {b Parameters}:
    {ul {- key: ['a Js.t]
    {% <p>The key or index of the item.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>If the item is found, returns the item.  If the item was not found, returns <code>undefined</code>.
If an item was found, but is a Class, returns <code>null</code>.</p> %}
    }
    }
    *)
  method getAt : Js.number Js.t -> 'a Js.t Js.meth
  (** {% <p>Returns the item at the specified index.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The index of the item.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The item at the specified index.</p> %}
    }
    }
    *)
  method getByKey : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Returns the item associated with the passed key.</p> %}
    
    {b Parameters}:
    {ul {- key: ['a Js.t]
    {% <p>The key of the item.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The item associated with the passed key.</p> %}
    }
    }
    *)
  method getCount : Js.number Js.t Js.meth
  (** {% <p>Returns the number of items in the collection.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>the number of items in the collection.</p> %}
    }
    }
    *)
  method getKey : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>MixedCollection has a generic way to fetch keys if you implement getKey.  The default implementation
simply returns <b><code>item.id</code></b> but you can provide your own implementation
to return a different value as in the following examples:</p>

<pre><code>// normal way
var mc = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
mc.add(someEl.dom.id, someEl);
mc.add(otherEl.dom.id, otherEl);
//and so on

// using getKey
var mc = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>();
mc.getKey = function(el){
   return el.dom.id;
};
mc.add(someEl);
mc.add(otherEl);

// or via the constructor
var mc = new <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a>(false, function(el){
   return el.dom.id;
});
mc.add(someEl);
mc.add(otherEl);
</code></pre> %}
    
    {b Parameters}:
    {ul {- item: ['a Js.t]
    {% <p>The item for which to find the key.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The key for the passed item.</p> %}
    }
    }
    *)
  method getRange : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    'a Js.js_array Js.t Js.meth
  (** {% <p>Returns a range of items in this collection</p> %}
    
    {b Parameters}:
    {ul {- startIndex: [Js.number Js.t]
    {% <p>The starting index. Defaults to 0.</p> %}
    }
    {- endIndex: [Js.number Js.t]
    {% <p>The ending index. Defaults to the last item.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.js_array Js.t] {% <p>An array of items</p> %}
    }
    }
    *)
  method indexOf : 'a Js.t -> Js.number Js.t Js.meth
  (** {% <p>Returns index within the collection of the passed Object.</p> %}
    
    {b Parameters}:
    {ul {- o: ['a Js.t]
    {% <p>The item to find the index of.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>index of the item. Returns -1 if not found.</p> %}
    }
    }
    *)
  method indexOfKey : Js.js_string Js.t -> Js.number Js.t Js.meth
  (** {% <p>Returns index within the collection of the passed key.</p> %}
    
    {b Parameters}:
    {ul {- key: [Js.js_string Js.t]
    {% <p>The key to find the index of.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>index of the key.</p> %}
    }
    }
    *)
  method insert : Js.number Js.t -> Js.js_string Js.t -> 'a Js.t Js.optdef ->
    'b Js.t Js.meth
  (** {% <p>Inserts an item at the specified index in the collection. Fires the <a href="#!/api/Ext.util.AbstractMixedCollection-event-add" rel="Ext.util.AbstractMixedCollection-event-add" class="docClass">add</a> event when complete.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The index to insert the item at.</p> %}
    }
    {- key: [Js.js_string Js.t]
    {% <p>The key to associate with the new item, or the item itself.</p> %}
    }
    {- o: ['a Js.t]
    {% <p>If the second parameter was a key, the new item.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The item inserted.</p> %}
    }
    }
    *)
  method last : 'a Js.t Js.meth
  (** {% <p>Returns the last item in the collection.</p> %}
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>the last item in the collection..</p> %}
    }
    }
    *)
  method remove : 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Remove an item from the collection.</p> %}
    
    {b Parameters}:
    {ul {- o: ['a Js.t]
    {% <p>The item to remove.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The item removed or false if no item was removed.</p> %}
    }
    }
    *)
  method removeAll : 'a Js.js_array Js.t -> 'self Js.t Js.meth
  (** {% <p>Remove all items in the passed array from the collection.</p> %}
    
    {b Parameters}:
    {ul {- items: ['a Js.js_array Js.t]
    {% <p>An array of items to be removed.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_MixedCollection.t Js.t] {% <p>this object</p> %}
    }
    }
    *)
  method removeAt : Js.number Js.t -> 'a Js.t Js.meth
  (** {% <p>Remove an item from a specified index in the collection. Fires the <a href="#!/api/Ext.util.AbstractMixedCollection-event-remove" rel="Ext.util.AbstractMixedCollection-event-remove" class="docClass">remove</a> event when complete.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The index within the collection of the item to remove.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The item removed or false if no item was removed.</p> %}
    }
    }
    *)
  method removeAtKey : Js.js_string Js.t -> 'a Js.t Js.meth
  (** {% <p>Removed an item associated with the passed key fom the collection.</p> %}
    
    {b Parameters}:
    {ul {- key: [Js.js_string Js.t]
    {% <p>The key of the item to remove.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The item removed or false if no item was removed.</p> %}
    }
    }
    *)
  method replace : Js.js_string Js.t -> 'a Js.t -> 'b Js.t Js.meth
  (** {% <p>Replaces an item in the collection. Fires the <a href="#!/api/Ext.util.AbstractMixedCollection-event-replace" rel="Ext.util.AbstractMixedCollection-event-replace" class="docClass">replace</a> event when complete.</p> %}
    
    {b Parameters}:
    {ul {- key: [Js.js_string Js.t]
    {% <p>The key associated with the item to replace, or the replacement item.</p>


<p>If you supplied a <a href="#!/api/Ext.util.AbstractMixedCollection-method-getKey" rel="Ext.util.AbstractMixedCollection-method-getKey" class="docClass">getKey</a> implementation for this MixedCollection, or if the key
of your stored items is in a property called <code><b>id</b></code>, then the MixedCollection
will be able to <i>derive</i> the key of the replacement item. If you want to replace an item
with one having the same key value, then just pass the replacement item in this parameter.</p> %}
    }
    {- o: ['a Js.t]
    {% <p>{Object} o (optional) If the first parameter passed was a key, the item to associate
with that key.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The new item.</p> %}
    }
    }
    *)
  method sum : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> Js.number Js.t
    Js.meth
  (** {% <p>Collects all of the values of the given property and returns their sum</p> %}
    
    {b Parameters}:
    {ul {- property: [Js.js_string Js.t]
    {% <p>The property to sum by</p> %}
    }
    {- root: [Js.js_string Js.t]
    {% <p>'root' property to extract the first argument from. This is used mainly when
summing fields in records, where the fields are all stored inside the 'data' object</p> %}
    }
    {- start: [Js.number Js.t] {% <p>The record index to start at</p> %}
     Defaults to: 0
    }
    {- end_: [Js.number Js.t] {% <p>The record index to end at</p> %}
     Defaults to: -1
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The total</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method allowFunctions : bool Js.t Js.prop
  (** {% <p>Specify <code>true</code> if the <a href="#!/api/Ext.util.AbstractMixedCollection-method-addAll" rel="Ext.util.AbstractMixedCollection-method-addAll" class="docClass">addAll</a>
function should add function references to the collection. Defaults to
<code>false</code>.</p> %}
    
    Defaults to: [false]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method add : (Js.number Js.t -> 'a Js.t -> Js.js_string Js.t -> 'b Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is added to the collection.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The index at which the item was added.</p> %}
    }
    {- o: ['a Js.t] {% <p>The item added.</p> %}
    }
    {- key: [Js.js_string Js.t]
    {% <p>The key associated with the added item.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method clear : ('a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the collection is cleared.</p> %}
    
    {b Parameters}:
    {ul {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method remove : ('a Js.t -> Js.js_string Js.t Js.optdef -> 'b Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is removed from the collection.</p> %}
    
    {b Parameters}:
    {ul {- o: ['a Js.t]
    {% <p>The item being removed.</p> %}
    }
    {- key: [Js.js_string Js.t]
    {% <p>The key associated with the removed item.</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method replace : (Js.js_string Js.t -> 'a Js.t -> 'b Js.t -> 'c Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when an item is replaced in the collection.</p> %}
    
    {b Parameters}:
    {ul {- key: [Js.js_string Js.t]
    {% <p>he key associated with the new added.</p> %}
    }
    {- old: ['a Js.t] {% <p>The item being replaced.</p> %}
    }
    {- new: ['a Js.t] {% <p>The new item.</p> %}
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
  inherit Ext_util_Observable.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

