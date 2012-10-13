(** The Store class encapsulates a client side cache o ...
  
  {% <p>The Store class encapsulates a client side cache of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> objects. Stores load data via a
<a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a>, and also provide functions for <a href="#!/api/Ext.data.Store-method-sort" rel="Ext.data.Store-method-sort" class="docClass">sorting</a>, <a href="#!/api/Ext.data.Store-method-filter" rel="Ext.data.Store-method-filter" class="docClass">filtering</a>
and querying the <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">model</a> instances contained within it.</p>

<p>Creating a Store is easy - we just tell it the Model and the Proxy to use to load and save its data:</p>

<pre><code> // Set up a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">model</a> to use in our Store
 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
     extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
     fields: [
         {name: 'firstName', type: 'string'},
         {name: 'lastName',  type: 'string'},
         {name: 'age',       type: 'int'},
         {name: 'eyeColor',  type: 'string'}
     ]
 });

 var myStore = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
     model: 'User',
     proxy: {
         type: 'ajax',
         url: '/users.json',
         reader: {
             type: 'json',
             root: 'users'
         }
     },
     autoLoad: true
 });
</code></pre>

<p>In the example above we configured an AJAX proxy to load data from the url '/users.json'. We told our Proxy to use a
<a href="#!/api/Ext.data.reader.Json" rel="Ext.data.reader.Json" class="docClass">JsonReader</a> to parse the response from the server into Model object - <a href="#!/api/Ext.data.reader.Json" rel="Ext.data.reader.Json" class="docClass">see the docs on JsonReader</a> for details.</p>

<h2>Inline data</h2>

<p>Stores can also load data inline. Internally, Store converts each of the objects we pass in as <a href="#!/api/Ext.data.Store-cfg-data" rel="Ext.data.Store-cfg-data" class="docClass">data</a> into
Model instances:</p>

<pre><code> <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
     model: 'User',
     data : [
         {firstName: 'Ed',    lastName: 'Spencer'},
         {firstName: 'Tommy', lastName: 'Maintz'},
         {firstName: 'Aaron', lastName: 'Conran'},
         {firstName: 'Jamie', lastName: 'Avins'}
     ]
 });
</code></pre>

<p>Loading inline data using the method above is great if the data is in the correct format already (e.g. it doesn't
need to be processed by a <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">reader</a>). If your inline data requires processing to decode
the data structure, use a <a href="#!/api/Ext.data.proxy.Memory" rel="Ext.data.proxy.Memory" class="docClass">MemoryProxy</a> instead (see the <a href="#!/api/Ext.data.proxy.Memory" rel="Ext.data.proxy.Memory" class="docClass">MemoryProxy</a> docs for an example).</p>

<p>Additional data can also be loaded locally using <a href="#!/api/Ext.data.Store-method-add" rel="Ext.data.Store-method-add" class="docClass">add</a>.</p>

<h2>Dynamic Loading</h2>

<p>Stores can be dynamically updated by calling the <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a> method:</p>

<pre><code>store.load({
    params: {
        group: 3,
        type: 'user'
    },
    callback: function(records, operation, success) {
        // do something after the load finishes
    },
    scope: this
});
</code></pre>

<p>Here a bunch of arbitrary parameters is passed along with the load request and a callback function is set
up to do something after the loading is over.</p>

<h2>Loading Nested Data</h2>

<p>Applications often need to load sets of associated data - for example a CRM system might load a User and her Orders.
Instead of issuing an AJAX request for the User and a series of additional AJAX requests for each Order, we can load
a nested dataset and allow the Reader to automatically populate the associated models. Below is a brief example, see
the <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.reader.Reader</a> intro docs for a full explanation:</p>

<pre><code> var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
     autoLoad: true,
     model: "User",
     proxy: {
         type: 'ajax',
         url: 'users.json',
         reader: {
             type: 'json',
             root: 'users'
         }
     }
 });
</code></pre>

<p>Which would consume a response like this:</p>

<pre><code> {
     "users": [{
         "id": 1,
         "name": "Ed",
         "orders": [{
             "id": 10,
             "total": 10.76,
             "status": "invoiced"
        },{
             "id": 11,
             "total": 13.45,
             "status": "shipped"
        }]
     }]
 }
</code></pre>

<p>See the <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.reader.Reader</a> intro docs for a full explanation.</p>

<h2>Filtering and Sorting</h2>

<p>Stores can be sorted and filtered - in both cases either remotely or locally. The <a href="#!/api/Ext.data.Store-property-sorters" rel="Ext.data.Store-property-sorters" class="docClass">sorters</a> and
<a href="#!/api/Ext.data.Store-cfg-filters" rel="Ext.data.Store-cfg-filters" class="docClass">filters</a> are held inside <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">MixedCollection</a> instances to make them easy to manage.
Usually it is sufficient to either just specify sorters and filters in the Store configuration or call <a href="#!/api/Ext.data.Store-method-sort" rel="Ext.data.Store-method-sort" class="docClass">sort</a>
or <a href="#!/api/Ext.data.Store-method-filter" rel="Ext.data.Store-method-filter" class="docClass">filter</a>:</p>

<pre><code> var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
     model: 'User',
     sorters: [{
         property: 'age',
         direction: 'DESC'
     }, {
         property: 'firstName',
         direction: 'ASC'
     }],

     filters: [{
         property: 'firstName',
         value: /Ed/
     }]
 });
</code></pre>

<p>The new Store will keep the configured sorters and filters in the MixedCollection instances mentioned above. By
default, sorting and filtering are both performed locally by the Store - see <a href="#!/api/Ext.data.Store-cfg-remoteSort" rel="Ext.data.Store-cfg-remoteSort" class="docClass">remoteSort</a> and
<a href="#!/api/Ext.data.Store-cfg-remoteFilter" rel="Ext.data.Store-cfg-remoteFilter" class="docClass">remoteFilter</a> to allow the server to perform these operations instead.</p>

<p>Filtering and sorting after the Store has been instantiated is also easy. Calling <a href="#!/api/Ext.data.Store-method-filter" rel="Ext.data.Store-method-filter" class="docClass">filter</a> adds another filter
to the Store and automatically filters the dataset (calling <a href="#!/api/Ext.data.Store-method-filter" rel="Ext.data.Store-method-filter" class="docClass">filter</a> with no arguments simply re-applies all
existing filters). Note that by default <a href="#!/api/Ext.data.Store-cfg-sortOnFilter" rel="Ext.data.Store-cfg-sortOnFilter" class="docClass">sortOnFilter</a> is set to true, which means that your sorters are
automatically reapplied if using local sorting.</p>

<pre><code> store.filter('eyeColor', 'Brown');
</code></pre>

<p>Change the sorting at any time by calling <a href="#!/api/Ext.data.Store-method-sort" rel="Ext.data.Store-method-sort" class="docClass">sort</a>:</p>

<pre><code> store.sort('height', 'ASC');
</code></pre>

<p>Note that all existing sorters will be removed in favor of the new sorter data (if <a href="#!/api/Ext.data.Store-method-sort" rel="Ext.data.Store-method-sort" class="docClass">sort</a> is called with no
arguments, the existing sorters are just reapplied instead of being removed). To keep existing sorters and add new
ones, just add them to the MixedCollection:</p>

<pre><code> store.sorters.add(new <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Ext.util.Sorter</a>({
     property : 'shoeSize',
     direction: 'ASC'
 }));

 store.sort();
</code></pre>

<h2>Registering with StoreManager</h2>

<p>Any Store that is instantiated with a <a href="#!/api/Ext.data.Store-cfg-storeId" rel="Ext.data.Store-cfg-storeId" class="docClass">storeId</a> will automatically be registed with the <a href="#!/api/Ext.data.StoreManager" rel="Ext.data.StoreManager" class="docClass">StoreManager</a>. This makes it easy to reuse the same store in multiple views:</p>

<pre><code> //this store can be used several times
 <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
     model: 'User',
     storeId: 'usersStore'
 });

 new Ext.List({
     store: 'usersStore',
     //other config goes here
 });

 new <a href="#!/api/Ext.view.View" rel="Ext.view.View" class="docClass">Ext.view.View</a>({
     store: 'usersStore',
     //other config goes here
 });
</code></pre>

<h2>Further Reading</h2>

<p>Stores are backed up by an ecosystem of classes that enables their operation. To gain a full understanding of these
pieces and how they fit together, see:</p>

<ul>
<li><a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a> - overview of what Proxies are and how they are used</li>
<li><a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> - the core class in the data package</li>
<li><a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Reader</a> - used by any subclass of <a href="#!/api/Ext.data.proxy.Server" rel="Ext.data.proxy.Server" class="docClass">ServerProxy</a> to read a response</li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_data_AbstractStore.t
  
  method currentPage : Js.number Js.t Js.prop
  (** {% <p>The page that the Store has most recently loaded (see <a href="#!/api/Ext.data.Store-method-loadPage" rel="Ext.data.Store-method-loadPage" class="docClass">loadPage</a>)</p> %}
    
    Defaults to: [1]
    *)
  method data : Ext_util_MixedCollection.t Js.t Js.prop
  (** {% <p>The MixedCollection that holds this store's local cache of records.</p> %}
    *)
  method groupers : Ext_util_MixedCollection.t Js.t Js.prop
  (** {% <p>The collection of <a href="#!/api/Ext.util.Grouper" rel="Ext.util.Grouper" class="docClass">Groupers</a> currently applied to this Store.</p> %}
    *)
  method snapshot : Ext_util_MixedCollection.t Js.t Js.prop
  (** {% <p>A pristine (unfiltered) collection of the records in this store. This is used to reinstate
records when a filter is removed or changed</p> %}
    *)
  method add : 'a Js.t -> Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Adds Model instance to the Store. This method accepts either:</p>

<ul>
<li>An array of Model instances or Model configuration objects.</li>
<li>Any number of Model instance or Model configuration object arguments.</li>
</ul>


<p>The new Model instances will be added at the end of the existing collection.</p>

<p>Sample usage:</p>

<pre><code>myStore.add({some: 'data'}, {some: 'other data'});
</code></pre>

<p>Note that if this Store is sorted, the new Model instances will be inserted
at the correct point in the Store to maintain the sort order.</p> %}
    
    {b Parameters}:
    {ul {- model: ['a Js.t]
    {% <p>An array of Model instances
or Model configuration objects, or variable number of Model instance or config arguments.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The model instances that were added</p> %}
    }
    }
    *)
  method addSorted : Ext_data_Model.t Js.t -> unit Js.meth
  (** {% <p>(Local sort only) Inserts the passed Record into the Store at the index where it
should go based on the current sort information.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    }
    }
    *)
  method aggregate : 'a Js.callback -> 'b Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'c Js.js_array Js.t Js.optdef -> 'd Js.t Js.meth
  (** {% <p>Runs the aggregate function for all the records in the store.</p>

<p>When store is filtered, only items within the filter are aggregated.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to execute. The function is called with a single parameter,
an array of records for that group.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope to execute the function in. Defaults to the store.</p> %}
    }
    {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the group average being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    {- args: ['a Js.js_array Js.t]
    {% <p>Any arguments to append to the function call</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>An object literal with the group names and their appropriate values.</p> %}
    }
    }
    *)
  method average : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  (** {% <p>Gets the average value in the store.</p>

<p>When store is filtered, only items within the filter are aggregated.</p> %}
    
    {b Parameters}:
    {ul {- field: [Js.js_string Js.t]
    {% <p>The field in each record</p> %}
    }
    {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the group average being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The average value, if no items exist, 0.</p> %}
    }
    }
    *)
  method clearFilter : bool Js.t -> unit Js.meth
  (** {% <p>Reverts to a view of the Record cache with no filtering applied.</p> %}
    
    {b Parameters}:
    {ul {- suppressEvent: [bool Js.t]
    {% <p>If <code>true</code> the filter is cleared silently.</p>

<p>For a locally filtered Store, this means that the filter collection is cleared without firing the
<a href="#!/api/Ext.data.Store-event-datachanged" rel="Ext.data.Store-event-datachanged" class="docClass">datachanged</a> event.</p>

<p>For a remotely filtered Store, this means that the filter collection is cleared, but the store
is not reloaded from the server.</p> %}
    }
    }
    *)
  method clearGrouping : unit Js.meth
  (** {% <p>Clear any groupers in the store</p> %}
    *)
  method collect : Js.js_string Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'a Js.t Js.js_array Js.t Js.meth
  (** {% <p>Collects unique values for a particular dataIndex from this store.</p> %}
    
    {b Parameters}:
    {ul {- dataIndex: [Js.js_string Js.t]
    {% <p>The property to collect</p> %}
    }
    {- allowNull: [bool Js.t]
    {% <p>Pass true to allow null, undefined or empty string values</p> %}
    }
    {- bypassFilter: [bool Js.t]
    {% <p>Pass true to collect from all records, even ones which are filtered.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t Js.js_array Js.t]
    {% <p>An array of the unique values</p> %}
    }
    }
    *)
  method commitChanges : unit Js.meth
  (** {% <p>Commits all Records with <a href="#!/api/Ext.data.Store-method-getModifiedRecords" rel="Ext.data.Store-method-getModifiedRecords" class="docClass">outstanding changes</a>. To handle updates for changes,
subscribe to the Store's <a href="#!/api/Ext.data.Store-event-update" rel="Ext.data.Store-event-update" class="docClass">update event</a>, and perform updating when the third parameter is
<a href="#!/api/Ext.data.Model-static-property-COMMIT" rel="Ext.data.Model-static-property-COMMIT" class="docClass">Ext.data.Record.COMMIT</a>.</p> %}
    *)
  method count : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Gets the count of items in the store.</p>

<p>When store is filtered, only items within the filter are counted.</p> %}
    
    {b Parameters}:
    {ul {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the count for each group being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>the count</p> %}
    }
    }
    *)
  method each : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  (** {% <p>Calls the specified function for each <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">record</a> in the store.</p>

<p>When store is filtered, only loops over the filtered records.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to call. The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Record</a> is passed as the first parameter.
Returning <code>false</code> aborts and exits the iteration.</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (this reference) in which the function is executed.
Defaults to the current <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">record</a> in the iteration.</p> %}
    }
    }
    *)
  method filter : 'a Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p>Filters the loaded set of records by a given set of filters.</p>

<p>By default, the passed filter(s) are <em>added</em> to the collection of filters being used to filter this Store.</p>

<p>To remove existing filters before applying a new set of filters use</p>

<pre><code>// Clear the filter collection without updating the UI
store.clearFilter(true);
</code></pre>

<p>see <a href="#!/api/Ext.data.Store-method-clearFilter" rel="Ext.data.Store-method-clearFilter" class="docClass">clearFilter</a>.</p>

<p>Alternatively, if filters are configured with an <code>id</code>, then existing filters store may be <em>replaced</em> by new
filters having the same <code>id</code>.</p>

<p>Filtering by single field:</p>

<pre><code>store.filter("email", /\.com$/);
</code></pre>

<p>Using multiple filters:</p>

<pre><code>store.filter([
    {property: "email", value: /\.com$/},
    {filterFn: function(item) { return item.get("age") &gt; 10; }}
]);
</code></pre>

<p>Using <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a> instances instead of config objects
(note that we need to specify the <a href="#!/api/Ext.util.Filter-cfg-root" rel="Ext.util.Filter-cfg-root" class="docClass">root</a> config option in this case):</p>

<pre><code>store.filter([
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>', {property: "email", value: /\.com$/, root: 'data'}),
    <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>', {filterFn: function(item) { return item.get("age") &gt; 10; }, root: 'data'})
]);
</code></pre>

<p>When store is filtered, most of the methods for accessing store data will be working only
within the set of filtered records. Two notable exceptions are <a href="#!/api/Ext.data.Store-method-queryBy" rel="Ext.data.Store-method-queryBy" class="docClass">queryBy</a> and
<a href="#!/api/Ext.data.Store-method-getById" rel="Ext.data.Store-method-getById" class="docClass">getById</a>.</p> %}
    
    {b Parameters}:
    {ul {- filters: ['a Js.t]
    {% <p>The set of filters to apply to the data.
These are stored internally on the store, but the filtering itself is done on the Store's
<a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">MixedCollection</a>. See MixedCollection's
<a href="#!/api/Ext.util.MixedCollection-method-filter" rel="Ext.util.MixedCollection-method-filter" class="docClass">filter</a> method for filter syntax.
Alternatively, pass in a property string</p> %}
    }
    {- value: [Js.js_string Js.t]
    {% <p>value to filter by (only if using a property string as the first argument)</p> %}
    }
    }
    *)
  method filterBy : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  (** {% <p>Filters by a function. The specified function will be called for each
Record in this Store. If the function returns <code>true</code> the Record is included,
otherwise it is filtered out.</p>

<p>When store is filtered, most of the methods for accessing store data will be working only
within the set of filtered records. Two notable exceptions are <a href="#!/api/Ext.data.Store-method-queryBy" rel="Ext.data.Store-method-queryBy" class="docClass">queryBy</a> and
<a href="#!/api/Ext.data.Store-method-getById" rel="Ext.data.Store-method-getById" class="docClass">getById</a>.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to be called. It will be passed the following parameters:</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (this reference) in which the function is executed.
Defaults to this Store.</p> %}
    }
    }
    *)
  method find : Js.js_string Js.t -> 'a Js.t -> Js.number Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.number Js.t Js.meth
  (** {% <p>Finds the index of the first matching Record in this store by a specific field value.</p>

<p>When store is filtered, finds records only within filter.</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [Js.js_string Js.t]
    {% <p>The name of the Record field to test.</p> %}
    }
    {- value: ['a Js.t]
    {% <p>Either a string that the field value
should begin with, or a RegExp to test against the field.</p> %}
    }
    {- startIndex: [Js.number Js.t]
    {% <p>The index to start searching at</p> %}
     Defaults to: 0
    }
    {- anyMatch: [bool Js.t]
    {% <p>True to match any part of the string, not just the beginning</p> %}
     Defaults to: false
    }
    {- caseSensitive: [bool Js.t]
    {% <p>True for case sensitive comparison</p> %}
     Defaults to: false
    }
    {- exactMatch: [bool Js.t]
    {% <p>True to force exact match (^ and $ characters added to the regex).</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The matched index or -1</p> %}
    }
    }
    *)
  method findBy : 'a Js.callback -> 'b Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.meth
  (** {% <p>Find the index of the first matching Record in this Store by a function.
If the function returns <code>true</code> it is considered a match.</p>

<p>When store is filtered, finds records only within filter.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to be called. It will be passed the following parameters:</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (this reference) in which the function is executed.
Defaults to this Store.</p> %}
    }
    {- startIndex: [Js.number Js.t]
    {% <p>The index to start searching at</p> %}
     Defaults to: 0
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The matched index or -1</p> %}
    }
    }
    *)
  method findExact : Js.js_string Js.t -> 'a Js.t -> Js.number Js.t Js.optdef
    -> Js.number Js.t Js.meth
  (** {% <p>Finds the index of the first matching Record in this store by a specific field value.</p>

<p>When store is filtered, finds records only within filter.</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [Js.js_string Js.t]
    {% <p>The name of the Record field to test.</p> %}
    }
    {- value: ['a Js.t]
    {% <p>The value to match the field against.</p> %}
    }
    {- startIndex: [Js.number Js.t]
    {% <p>The index to start searching at</p> %}
     Defaults to: 0
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The matched index or -1</p> %}
    }
    }
    *)
  method findRecord : Js.js_string Js.t -> 'a Js.t ->
    Js.number Js.t Js.optdef -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> Ext_data_Model.t Js.t Js.meth
  (** {% <p>Finds the first matching Record in this store by a specific field value.</p>

<p>When store is filtered, finds records only within filter.</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [Js.js_string Js.t]
    {% <p>The name of the Record field to test.</p> %}
    }
    {- value: ['a Js.t]
    {% <p>Either a string that the field value
should begin with, or a RegExp to test against the field.</p> %}
    }
    {- startIndex: [Js.number Js.t]
    {% <p>The index to start searching at</p> %}
     Defaults to: 0
    }
    {- anyMatch: [bool Js.t]
    {% <p>True to match any part of the string, not just the beginning</p> %}
     Defaults to: false
    }
    {- caseSensitive: [bool Js.t]
    {% <p>True for case sensitive comparison</p> %}
     Defaults to: false
    }
    {- exactMatch: [bool Js.t]
    {% <p>True to force exact match (^ and $ characters added to the regex).</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t]
    {% <p>The matched record or null</p> %}
    }
    }
    *)
  method first : bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Convenience function for getting the first model instance in the store.</p>

<p>When store is filtered, will return first item within the filter.</p> %}
    
    {b Parameters}:
    {ul {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the first record being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The first model instance in the store, or undefined</p> %}
    }
    }
    *)
  method getAt : Js.number Js.t -> Ext_data_Model.t Js.t Js.meth
  (** {% <p>Get the Record at the specified index.</p>

<p>The index is effected by filtering.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The index of the Record to find.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t]
    {% <p>The Record at the passed index. Returns undefined if not found.</p> %}
    }
    }
    *)
  method getById : 'a Js.t -> Ext_data_Model.t Js.t Js.meth
  (** {% <p>Get the Record with the specified id.</p>

<p>This method is not effected by filtering, lookup will be performed from all records
inside the store, filtered or not.</p> %}
    
    {b Parameters}:
    {ul {- id: ['a Js.t]
    {% <p>The id of the Record to find.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t]
    {% <p>The Record with the passed id. Returns null if not found.</p> %}
    }
    }
    *)
  method getCount : Js.number Js.t Js.meth
  (** {% <p>Gets the number of records in store.</p>

<p>If using paging, this may not be the total size of the dataset. If the data object
used by the Reader contains the dataset size, then the <a href="#!/api/Ext.data.Store-method-getTotalCount" rel="Ext.data.Store-method-getTotalCount" class="docClass">getTotalCount</a> function returns
the dataset size.  <strong>Note</strong>: see the Important note in <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a>.</p>

<p>When store is filtered, it's the number of records matching the filter.</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The number of Records in the Store.</p> %}
    }
    }
    *)
  method getGroupString : Ext_data_Model.t Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Returns the string to group on for a given model instance. The default implementation of this method returns
the model's <a href="#!/api/Ext.data.Store-cfg-groupField" rel="Ext.data.Store-cfg-groupField" class="docClass">groupField</a>, but this can be overridden to group by an arbitrary string. For example, to
group by the first letter of a model's 'name' field, use the following code:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    groupDir: 'ASC',
    getGroupString: function(instance) {
        return instance.get('name')[0];
    }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- instance: [Ext_data_Model.t Js.t]
    {% <p>The model instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The string to compare when forming groups</p> %}
    }
    }
    *)
  method getGroups : Js.js_string Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Returns an array containing the result of applying grouping to the records in this store.
See <a href="#!/api/Ext.data.Store-cfg-groupField" rel="Ext.data.Store-cfg-groupField" class="docClass">groupField</a>, <a href="#!/api/Ext.data.Store-cfg-groupDir" rel="Ext.data.Store-cfg-groupDir" class="docClass">groupDir</a> and <a href="#!/api/Ext.data.Store-method-getGroupString" rel="Ext.data.Store-method-getGroupString" class="docClass">getGroupString</a>. Example for a store
containing records with a color field:</p>

<pre><code>var myStore = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    groupField: 'color',
    groupDir  : 'DESC'
});

myStore.getGroups(); // returns:
[
    {
        name: 'yellow',
        children: [
            // all records where the color field is 'yellow'
        ]
    },
    {
        name: 'red',
        children: [
            // all records where the color field is 'red'
        ]
    }
]
</code></pre>

<p>Group contents are effected by filtering.</p> %}
    
    {b Parameters}:
    {ul {- groupName: [Js.js_string Js.t]
    {% <p>Pass in an optional groupName argument to access a specific
group as defined by <a href="#!/api/Ext.data.Store-method-getGroupString" rel="Ext.data.Store-method-getGroupString" class="docClass">getGroupString</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t] {% <p>The grouped data</p> %}
    }
    }
    *)
  method getNewRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>inherit docs</p>

<p>Returns all Model instances that are either currently a phantom (e.g. have no id), or have an ID but have not
yet been saved on this Store (this happens when adding a non-phantom record from another Store into this one)</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The Model instances</p> %}
    }
    }
    *)
  method getPageFromRecordIndex : Js.number Js.t -> Js.number Js.t Js.meth
  (** {% <p>Determines the page from a record index</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The record index</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The page the record belongs to</p> %}
    }
    }
    *)
  method getRange : Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Returns a range of Records between specified indices.</p>

<p>This method is effected by filtering.</p> %}
    
    {b Parameters}:
    {ul {- startIndex: [Js.number Js.t] {% <p>The starting index</p> %}
     Defaults to: 0
    }
    {- endIndex: [Js.number Js.t]
    {% <p>The ending index. Defaults to the last Record in the Store.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>An array of Records</p> %}
    }
    }
    *)
  method getTotalCount : Js.number Js.t Js.meth
  (** {% <p>Returns the total number of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> instances that the <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a>
indicates exist. This will usually differ from <a href="#!/api/Ext.data.Store-method-getCount" rel="Ext.data.Store-method-getCount" class="docClass">getCount</a> when using paging - getCount returns the
number of records loaded into the Store at the moment, getTotalCount returns the number of records that
could be loaded into the Store if the Store contained all data</p> %}
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The total number of Model instances available via the Proxy. 0 returned if
no value has been set via the reader.</p> %}
    }
    }
    *)
  method getUpdatedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>inherit docs</p>

<p>Returns all Model instances that have been updated in the Store but not yet synchronized with the Proxy</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The updated Model instances</p> %}
    }
    }
    *)
  method group : 'a Js.t -> Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p>Groups data inside the store.</p> %}
    
    {b Parameters}:
    {ul {- groupers: ['a Js.t]
    {% <p>Either a string name of one of the fields in this Store's
configured <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a>, or an Array of grouper configurations.</p> %}
    }
    {- direction: [Js.js_string Js.t]
    {% <p>The overall direction to group the data by.</p> %}
     Defaults to: "ASC"
    }
    }
    *)
  method guaranteeRange : 'a Js.t -> 'b Js.t -> 'c Js.t -> 'd Js.t -> unit
    Js.meth
  (** {% <p>Guarantee a specific range, this will load the store with a range (that
must be the pageSize or smaller) and take care of any loading that may
be necessary.</p> %}
    
    {b Parameters}:
    {ul {- start: ['a Js.t]
    }
    {- end_: ['a Js.t]
    }
    {- cb: ['a Js.t]
    }
    {- scope: ['a Js.t]
    }
    }
    *)
  method indexOf : Ext_data_Model.t Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the index of the record within the store.</p>

<p>When store is filtered, records outside of filter will not be found.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> object to find.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The index of the passed Record. Returns -1 if not found.</p> %}
    }
    }
    *)
  method indexOfId : Js.js_string Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the index within the store of the Record with the passed id.</p>

<p>Like <a href="#!/api/Ext.data.Store-method-indexOf" rel="Ext.data.Store-method-indexOf" class="docClass">indexOf</a>, this method is effected by filtering.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t]
    {% <p>The id of the Record to find.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The index of the Record. Returns -1 if not found.</p> %}
    }
    }
    *)
  method indexOfTotal : Ext_data_Model.t Js.t -> Js.number Js.t Js.meth
  (** {% <p>Get the index within the entire dataset. From 0 to the totalCount.</p>

<p>Like <a href="#!/api/Ext.data.Store-method-indexOf" rel="Ext.data.Store-method-indexOf" class="docClass">indexOf</a>, this method is effected by filtering.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> object to find.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t]
    {% <p>The index of the passed Record. Returns -1 if not found.</p> %}
    }
    }
    *)
  method insert : Js.number Js.t -> Ext_data_Model.t Js.js_array Js.t -> unit
    Js.meth
  (** {% <p>Inserts Model instances into the Store at the given index and fires the <a href="#!/api/Ext.data.Store-event-add" rel="Ext.data.Store-event-add" class="docClass">add</a> event.
See also <a href="#!/api/Ext.data.Store-method-add" rel="Ext.data.Store-method-add" class="docClass">add</a>.</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t]
    {% <p>The start index at which to insert the passed Records.</p> %}
    }
    {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>An Array of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> objects to add to the store.</p> %}
    }
    }
    *)
  method isFiltered : bool Js.t Js.meth
  (** {% <p>Returns true if this store is currently filtered</p> %}
    *)
  method isGrouped : bool Js.t Js.meth
  (** {% <p>Checks if the store is currently grouped</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the store is grouped.</p> %}
    }
    }
    *)
  method last : bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Convenience function for getting the last model instance in the store.</p>

<p>When store is filtered, will return last item within the filter.</p> %}
    
    {b Parameters}:
    {ul {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the last record being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The last model instance in the store, or undefined</p> %}
    }
    }
    *)
  method load_2 : 'a Js.t Js.optdef -> unit Js.meth
  (** {% <p>Loads data into the Store via the configured <a href="#!/api/Ext.data.Store-cfg-proxy" rel="Ext.data.Store-cfg-proxy" class="docClass">proxy</a>. This uses the Proxy to make an
asynchronous call to whatever storage backend the Proxy uses, automatically adding the retrieved
instances into the Store and calling an optional callback if required. Example usage:</p>

<pre><code>store.load({
    scope: this,
    callback: function(records, operation, success) {
        // the <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">operation</a> object
        // contains all of the details of the load operation
        console.log(records);
    }
});
</code></pre>

<p>If the callback scope does not need to be set, a function can simply be passed:</p>

<pre><code>store.load(function(records, operation, success) {
    console.log('loaded records');
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>config object, passed into the <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a> object before loading.
Additionally <code>addRecords: true</code> can be specified to add these records to the existing records, default is
to remove the Store's existing records first.</p> %}
    }
    }
    *)
  method loadData : 'a Js.t -> bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Loads an array of data straight into the Store.</p>

<p>Using this method is great if the data is in the correct format already (e.g. it doesn't need to be
processed by a reader). If your data requires processing to decode the data structure, use a
<a href="#!/api/Ext.data.proxy.Memory" rel="Ext.data.proxy.Memory" class="docClass">MemoryProxy</a> instead.</p> %}
    
    {b Parameters}:
    {ul {- data: ['a Js.t]
    {% <p>Array of data to load. Any non-model instances will be cast
into model instances first.</p> %}
    }
    {- append: [bool Js.t]
    {% <p>True to add the records to the existing records in the store, false
to remove the old ones first.</p> %}
     Defaults to: false
    }
    }
    *)
  method loadPage : Js.number Js.t -> 'a Js.t -> unit Js.meth
  (** {% <p>Loads a given 'page' of data by setting the start and limit values appropriately. Internally this just causes a normal
load operation, passing in calculated 'start' and 'limit' params</p> %}
    
    {b Parameters}:
    {ul {- page: [Js.number Js.t]
    {% <p>The number of the page to load</p> %}
    }
    {- options: ['a Js.t]
    {% <p>See options for <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a></p> %}
    }
    }
    *)
  method loadRawData : 'a Js.t Js.js_array Js.t -> bool Js.t Js.optdef ->
    unit Js.meth
  (** {% <p>Loads data via the bound Proxy's reader</p>

<p>Use this method if you are attempting to load data and want to utilize the configured data reader.</p> %}
    
    {b Parameters}:
    {ul {- data: ['a Js.t Js.js_array Js.t]
    {% <p>The full JSON object you'd like to load into the Data store.</p> %}
    }
    {- append: [bool Js.t]
    {% <p>True to add the records to the existing records in the store, false
to remove the old ones first.</p> %}
     Defaults to: false
    }
    }
    *)
  method loadRecords : Ext_data_Model.t Js.js_array Js.t -> 'a Js.t -> unit
    Js.meth
  (** {% <p>Loads an array of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">model</a> instances into the store, fires the datachanged event. This should only usually
be called internally when loading from the <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a>, when adding records manually use <a href="#!/api/Ext.data.Store-method-add" rel="Ext.data.Store-method-add" class="docClass">add</a> instead</p> %}
    
    {b Parameters}:
    {ul {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The array of records to load</p> %}
    }
    {- options: ['a Js.t]
    }
    }
    *)
  method max : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Gets the maximum value in the store.</p>

<p>When store is filtered, only items within the filter are aggregated.</p> %}
    
    {b Parameters}:
    {ul {- field: [Js.js_string Js.t]
    {% <p>The field in each record</p> %}
    }
    {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the maximum in the group being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The maximum value, if no items exist, undefined.</p> %}
    }
    }
    *)
  method min : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  (** {% <p>Gets the minimum value in the store.</p>

<p>When store is filtered, only items within the filter are aggregated.</p> %}
    
    {b Parameters}:
    {ul {- field: [Js.js_string Js.t]
    {% <p>The field in each record</p> %}
    }
    {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the minimum in the group being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- ['a Js.t]
    {% <p>The minimum value, if no items exist, undefined.</p> %}
    }
    }
    *)
  method nextPage : 'a Js.t -> unit Js.meth
  (** {% <p>Loads the next 'page' in the current data set</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>See options for <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a></p> %}
    }
    }
    *)
  method prefetch : 'a Js.t Js.optdef -> unit Js.meth
  (** {% <p>Prefetches data into the store using its configured <a href="#!/api/Ext.data.Store-cfg-proxy" rel="Ext.data.Store-cfg-proxy" class="docClass">proxy</a>.</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>config object, passed into the <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a> object before loading.
See <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a></p> %}
    }
    }
    *)
  method prefetchPage : Js.number Js.t -> 'a Js.t Js.optdef -> unit Js.meth
  (** {% <p>Prefetches a page of data.</p> %}
    
    {b Parameters}:
    {ul {- page: [Js.number Js.t]
    {% <p>The page to prefetch</p> %}
    }
    {- options: ['a Js.t]
    {% <p>config object, passed into the <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a> object before loading.
See <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a></p> %}
    }
    }
    *)
  method prefetchRange : 'a Js.t -> 'b Js.t -> unit Js.meth
  (** {% <p>Ensures that the specified range of rows is present in the cache.</p>

<p>Converts the row range to a page range and then only load pages which are not already
present in the page cache.</p> %}
    
    {b Parameters}:
    {ul {- start: ['a Js.t]
    }
    {- end_: ['a Js.t]
    }
    }
    *)
  method previousPage : 'a Js.t -> unit Js.meth
  (** {% <p>Loads the previous 'page' in the current data set</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>See options for <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a></p> %}
    }
    }
    *)
  method query : Js.js_string Js.t -> 'a Js.t -> bool Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    Ext_util_MixedCollection.t Js.t Js.meth
  (** {% <p>Query all the cached records in this Store by name/value pair.
The parameters will be used to generated a filter function that is given
to the queryBy method.</p>

<p>This method compliments queryBy by generating the query function automatically.</p> %}
    
    {b Parameters}:
    {ul {- property: [Js.js_string Js.t]
    {% <p>The property to create the filter function for</p> %}
    }
    {- value: ['a Js.t]
    {% <p>The string/regex to compare the property value to</p> %}
    }
    {- anyMatch: [bool Js.t]
    {% <p>True if we don't care if the filter value is not the full value.</p> %}
     Defaults to: false
    }
    {- caseSensitive: [bool Js.t]
    {% <p>True to create a case-sensitive regex.</p> %}
     Defaults to: false
    }
    {- exactMatch: [bool Js.t]
    {% <p>True to force exact match (^ and $ characters added to the regex).
Ignored if anyMatch is true.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_MixedCollection.t Js.t]
    {% <p>Returns an <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a> of the matched records</p> %}
    }
    }
    *)
  method queryBy : 'a Js.callback -> 'b Js.t Js.optdef ->
    Ext_util_MixedCollection.t Js.t Js.meth
  (** {% <p>Query all the cached records in this Store using a filtering function. The specified function
will be called with each record in this Store. If the function returns <code>true</code> the record is
included in the results.</p>

<p>This method is not effected by filtering, it will always look from all records inside the store
no matter if filter is applied or not.</p> %}
    
    {b Parameters}:
    {ul {- fn: ['a Js.callback]
    {% <p>The function to be called. It will be passed the following parameters:</p> %}
    }
    {- scope: ['a Js.t]
    {% <p>The scope (this reference) in which the function is executed
Defaults to this Store.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_util_MixedCollection.t Js.t]
    {% <p>Returns an <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Ext.util.MixedCollection</a> of the matched records</p> %}
    }
    }
    *)
  method rejectChanges : unit Js.meth
  (** {% <p><a href="#!/api/Ext.data.Model-method-reject" rel="Ext.data.Model-method-reject" class="docClass">Rejects</a> outstanding changes on all <a href="#!/api/Ext.data.Store-method-getModifiedRecords" rel="Ext.data.Store-method-getModifiedRecords" class="docClass">modified records</a>
and re-insert any records that were removed locally. Any phantom records will be removed.</p> %}
    *)
  method reload : 'a Js.t -> unit Js.meth
  (** {% <p>Reloads the store using the last options passed to the <a href="#!/api/Ext.data.Store-method-load" rel="Ext.data.Store-method-load" class="docClass">load</a> method.</p> %}
    
    {b Parameters}:
    {ul {- options: ['a Js.t]
    {% <p>A config object which contains options which may override the options passed to the previous load call.</p> %}
    }
    }
    *)
  method remove : 'a Js.t -> unit Js.meth
  (** {% <p>Removes the given record from the Store, firing the 'remove' event for each instance that is removed,
plus a single 'datachanged' event after removal.</p> %}
    
    {b Parameters}:
    {ul {- records: ['a Js.t]
    {% <p>Model instance or array of instances to remove.</p> %}
    }
    }
    *)
  method removeAll_2 : bool Js.t -> unit Js.meth
  (** {% <p>Removes all items from the store.</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t]
    {% <p>Prevent the <code>clear</code> event from being fired.</p> %}
    }
    }
    *)
  method removeAt : Js.number Js.t -> unit Js.meth
  (** {% <p>Removes the model instance at the given index</p> %}
    
    {b Parameters}:
    {ul {- index: [Js.number Js.t] {% <p>The record index</p> %}
    }
    }
    *)
  method sort : 'a Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Ext_util_Sorter.t Js.js_array Js.t Js.meth
  (** {% <p>because prefetchData is stored by index
this invalidates all of the prefetchedData</p>

<p>Sorts the data in the Store by one or more of its properties. Example usage:</p>

<pre><code>//sort by a single field
myStore.sort('myField', 'DESC');

//sorting by multiple fields
myStore.sort([
    {
        property : 'age',
        direction: 'ASC'
    },
    {
        property : 'name',
        direction: 'DESC'
    }
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
    {ul {- sorters: ['a Js.t]
    {% <p>Either a string name of one of the fields in this Store's configured
<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a>, or an array of sorter configurations.</p> %}
    }
    {- direction: [Js.js_string Js.t]
    {% <p>The overall direction to sort the data by.</p> %}
     Defaults to: "ASC"
    }
    }
    *)
  method sum : Js.js_string Js.t -> bool Js.t Js.optdef -> Js.number Js.t
    Js.meth
  (** {% <p>Sums the value of <code>property</code> for each <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">record</a> between <code>start</code>
and <code>end</code> and returns the result.</p>

<p>When store is filtered, only sums items within the filter.</p> %}
    
    {b Parameters}:
    {ul {- field: [Js.js_string Js.t]
    {% <p>A field in each record</p> %}
    }
    {- grouped: [bool Js.t]
    {% <p>True to perform the operation for each group
in the store. The value returned will be an object literal with the key being the group
name and the sum for that group being the value. The grouped parameter is only honored if
the store has a groupField.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The sum</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_data_AbstractStore.configs
  
  method buffered : bool Js.t Js.prop
  (** {% <p>Allows the Store to prefetch and cache in a <strong>page cache</strong>, pages of Records, and to then satisfy
loading requirements from this page cache.</p>

<p>To use buffered Stores, initiate the process by loading the first page. The number of rows rendered are
determined automatically, and the range of pages needed to keep the cache primed for scrolling is
requested and cached.
Example:</p>

<p>   // Load page 1
   myStore.loadPage(1);</p>

<p>A <a href="#!/api/Ext.grid.PagingScroller" rel="Ext.grid.PagingScroller" class="docClass">PagingScroller</a> is instantiated which will monitor the scrolling in the grid, and
refresh the view's rows from the page cache as needed. It will also pull new data into the page
cache when scrolling of the view draws upon data near either end of the prefetched data.</p>

<p>The margins which trigger view refreshing from the prefetched data are <a href="#!/api/Ext.grid.PagingScroller-cfg-numFromEdge" rel="Ext.grid.PagingScroller-cfg-numFromEdge" class="docClass">Ext.grid.PagingScroller.numFromEdge</a>,
<a href="#!/api/Ext.grid.PagingScroller-cfg-leadingBufferZone" rel="Ext.grid.PagingScroller-cfg-leadingBufferZone" class="docClass">Ext.grid.PagingScroller.leadingBufferZone</a> and <a href="#!/api/Ext.grid.PagingScroller-cfg-trailingBufferZone" rel="Ext.grid.PagingScroller-cfg-trailingBufferZone" class="docClass">Ext.grid.PagingScroller.trailingBufferZone</a>.</p>

<p>The margins which trigger loading more data into the page cache are, <a href="#!/api/Ext.data.Store-cfg-leadingBufferZone" rel="Ext.data.Store-cfg-leadingBufferZone" class="docClass">leadingBufferZone</a> and
<a href="#!/api/Ext.data.Store-cfg-trailingBufferZone" rel="Ext.data.Store-cfg-trailingBufferZone" class="docClass">trailingBufferZone</a>.</p>

<p>By defult, only 5 pages of data are cached in the page cache, with pages "scrolling" out of the buffer
as the view moves down through the dataset.
Setting this value to zero means that no pages are <em>ever</em> scrolled out of the page cache, and
that eventually the whole dataset may become present in the page cache. This is sometimes desirable
as long as datasets do not reach astronomical proportions.</p>

<p>Selection state may be maintained across page boundaries by configuring the SelectionModel not to discard
records from its collection when those Records cycle out of the Store's primary collection. This is done
by configuring the SelectionModel like this:</p>

<p>   selModel: {</p>

<pre><code>   pruneRemoved: false
</code></pre>

<p>   }</p> %}
    
    Defaults to: [false]
    *)
  method clearOnPageLoad : bool Js.t Js.prop
  (** {% <p>True to empty the store when loading another page via <a href="#!/api/Ext.data.Store-method-loadPage" rel="Ext.data.Store-method-loadPage" class="docClass">loadPage</a>,
<a href="#!/api/Ext.data.Store-method-nextPage" rel="Ext.data.Store-method-nextPage" class="docClass">nextPage</a> or <a href="#!/api/Ext.data.Store-method-previousPage" rel="Ext.data.Store-method-previousPage" class="docClass">previousPage</a>. Setting to false keeps existing records, allowing
large data sets to be loaded one page at a time but rendered all together.</p> %}
    
    Defaults to: [true]
    *)
  method clearRemovedOnLoad : bool Js.t Js.prop
  (** {% <p>True to clear anything in the <a href="#!/api/Ext.data.Store-property-removed" rel="Ext.data.Store-property-removed" class="docClass">removed</a> record collection when the store loads.</p> %}
    
    Defaults to: [true]
    *)
  method data : 'a Js.t Js.prop
  (** {% <p>Array of Model instances or data objects to load locally. See "Inline data" above for details.</p> %}
    *)
  method groupDir : Js.js_string Js.t Js.prop
  (** {% <p>The direction in which sorting should be applied when grouping. Supported values are "ASC" and "DESC".</p> %}
    
    Defaults to: ["ASC"]
    *)
  method groupField : Js.js_string Js.t Js.prop
  (** {% <p>The field by which to group data in the store. Internally, grouping is very similar to sorting - the
groupField and <a href="#!/api/Ext.data.Store-cfg-groupDir" rel="Ext.data.Store-cfg-groupDir" class="docClass">groupDir</a> are injected as the first sorter (see <a href="#!/api/Ext.data.Store-method-sort" rel="Ext.data.Store-method-sort" class="docClass">sort</a>). Stores support a single
level of grouping, and groups can be fetched via the <a href="#!/api/Ext.data.Store-method-getGroups" rel="Ext.data.Store-method-getGroups" class="docClass">getGroups</a> method.</p> %}
    *)
  method leadingBufferZone : Js.number Js.t Js.prop
  (** {% <p>When <a href="#!/api/Ext.data.Store-cfg-buffered" rel="Ext.data.Store-cfg-buffered" class="docClass">buffered</a>, the number of extra rows to keep cached on the leading side of scrolling buffer
as scrolling proceeds. A larger number means fewer replenishments from the server.</p> %}
    
    Defaults to: [200]
    *)
  method pageSize : Js.number Js.t Js.prop
  (** {% <p>The number of records considered to form a 'page'. This is used to power the built-in
paging using the nextPage and previousPage functions when the grid is paged using a
<a href="#!/api/Ext.toolbar.Paging" rel="Ext.toolbar.Paging" class="docClass">PagingScroller</a> Defaults to 25.</p>

<p>If this Store is <a href="#!/api/Ext.data.Store-cfg-buffered" rel="Ext.data.Store-cfg-buffered" class="docClass">buffered</a>, pages are loaded into a page cache before the Store's
data is updated from the cache. The pageSize is the number of rows loaded into the cache in one request.
This will not affect the rendering of a buffered grid, but a larger page size will mean fewer loads.</p>

<p>In a buffered grid, scrolling is monitored, and the page cache is kept primed with data ahead of the
direction of scroll to provide rapid access to data when scrolling causes it to be required. Several pages
in advance may be requested depending on various parameters.</p>

<p>It is recommended to tune the <a href="#!/api/Ext.data.Store-cfg-pageSize" rel="Ext.data.Store-cfg-pageSize" class="docClass">pageSize</a>, <a href="#!/api/Ext.data.Store-cfg-trailingBufferZone" rel="Ext.data.Store-cfg-trailingBufferZone" class="docClass">trailingBufferZone</a> and
<a href="#!/api/Ext.data.Store-cfg-leadingBufferZone" rel="Ext.data.Store-cfg-leadingBufferZone" class="docClass">leadingBufferZone</a> configurations based upon the conditions pertaining in your deployed application.</p>

<p>The provided SDK example <code>examples/grid/infinite-scroll-grid-tuner.html</code> can be used to experiment with
different settings including simulating Ajax latency.</p> %}
    *)
  method proxy : 'a Js.t Js.prop
  (** {% <p>The Proxy to use for this Store. This can be either a string, a config object or a Proxy instance -
see <a href="#!/api/Ext.data.Store-method-setProxy" rel="Ext.data.Store-method-setProxy" class="docClass">setProxy</a> for details.</p> %}
    *)
  method purgePageCount : Js.number Js.t Js.prop
  (** {% <p><em>Valid only when used with a <a href="#!/api/Ext.data.Store-cfg-buffered" rel="Ext.data.Store-cfg-buffered" class="docClass">buffered</a> Store.</em></p>

<p>The number of pages <em>additional to the required buffered range</em> to keep in the prefetch cache before purging least recently used records.</p>

<p>For example, if the height of the view area and the configured <a href="#!/api/Ext.data.Store-cfg-trailingBufferZone" rel="Ext.data.Store-cfg-trailingBufferZone" class="docClass">trailingBufferZone</a> and <a href="#!/api/Ext.data.Store-cfg-leadingBufferZone" rel="Ext.data.Store-cfg-leadingBufferZone" class="docClass">leadingBufferZone</a> require that there
are three pages in the cache, then a <code>purgePageCount</code> of 5 ensures that up to 8 pages can be in the page cache any any one time.</p>

<p>A value of 0 indicates to never purge the prefetched data.</p> %}
    
    Defaults to: [5]
    *)
  method remoteFilter : bool Js.t Js.prop
  (** {% <p>True to defer any filtering operation to the server. If false, filtering is done locally on the client.</p> %}
    
    Defaults to: [false]
    *)
  method remoteGroup : bool Js.t Js.prop
  (** {% <p>True if the grouping should apply on the server side, false if it is local only.  If the
grouping is local, it can be applied immediately to the data.  If it is remote, then it will simply act as a
helper, automatically sending the grouping information to the server.</p> %}
    
    Defaults to: [false]
    *)
  method remoteSort : bool Js.t Js.prop
  (** {% <p>True to defer any sorting operation to the server. If false, sorting is done locally on the client.</p> %}
    
    Defaults to: [false]
    *)
  method sortOnFilter : bool Js.t Js.prop
  (** {% <p>For local filtering only, causes <a href="#!/api/Ext.data.Store-method-sort" rel="Ext.data.Store-method-sort" class="docClass">sort</a> to be called whenever <a href="#!/api/Ext.data.Store-method-filter" rel="Ext.data.Store-method-filter" class="docClass">filter</a> is called,
causing the sorters to be reapplied after filtering. Defaults to true</p> %}
    
    Defaults to: [true]
    *)
  method trailingBufferZone : Js.number Js.t Js.prop
  (** {% <p>When <a href="#!/api/Ext.data.Store-cfg-buffered" rel="Ext.data.Store-cfg-buffered" class="docClass">buffered</a>, the number of extra records to keep cached on the trailing side of scrolling buffer
as scrolling proceeds. A larger number means fewer replenishments from the server.</p> %}
    
    Defaults to: [25]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_data_AbstractStore.events
  
  method beforeprefetch : (t Js.t -> Ext_data_Operation.t Js.t -> 'a Js.t ->
    unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires before a prefetch occurs. Return false to cancel.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    }
    {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The associated operation</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method groupchange : (t Js.t -> Ext_util_Grouper.t Js.js_array Js.t ->
    'a Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired whenever the grouping in the grid changes</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store</p> %}
    }
    {- groupers: [Ext_util_Grouper.t Js.js_array Js.t]
    {% <p>The array of grouper objects</p> %}
    }
    {- eOpts: ['a Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method prefetch : (t Js.t -> Ext_data_Model.t Js.js_array Js.t -> bool Js.t
    -> Ext_data_Operation.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires whenever records have been prefetched</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    }
    {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>An array of records.</p> %}
    }
    {- successful: [bool Js.t]
    {% <p>True if the operation was successful.</p> %}
    }
    {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The associated operation</p> %}
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
  inherit Ext_data_AbstractStore.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

