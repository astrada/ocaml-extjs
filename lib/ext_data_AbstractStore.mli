(** AbstractStore is a superclass of Ext.data.Store an ...
  
  {% <p>AbstractStore is a superclass of <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> and <a href="#!/api/Ext.data.TreeStore" rel="Ext.data.TreeStore" class="docClass">Ext.data.TreeStore</a>. It's never used directly,
but offers a set of methods used by both of those subclasses.</p>

<p>We've left it here in the docs for reference purposes, but unless you need to make a whole new type of Store, what
you're probably looking for is <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>. If you're still interested, here's a brief description of what
AbstractStore is and is not.</p>

<p>AbstractStore provides the basic configuration for anything that can be considered a Store. It expects to be
given a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> that represents the type of data in the Store. It also expects to be given a
<a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a> that handles the loading of data into the Store.</p>

<p>AbstractStore provides a few helpful methods such as <a href="#!/api/Ext.data.AbstractStore-method-load" rel="Ext.data.AbstractStore-method-load" class="docClass">load</a> and <a href="#!/api/Ext.data.AbstractStore-method-sync" rel="Ext.data.AbstractStore-method-sync" class="docClass">sync</a>, which load and save data
respectively, passing the requests through the configured <a href="#!/api/Ext.data.AbstractStore-cfg-proxy" rel="Ext.data.AbstractStore-cfg-proxy" class="docClass">proxy</a>. Both built-in Store subclasses add extra
behavior to each of these functions. Note also that each AbstractStore subclass has its own way of storing data -
in <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> the data is saved as a flat <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">MixedCollection</a>, whereas in
<a href="#!/api/Ext.data.TreeStore" rel="Ext.data.TreeStore" class="docClass">TreeStore</a> we use a <a href="#!/api/Ext.data.Tree" rel="Ext.data.Tree" class="docClass">Ext.data.Tree</a> to maintain the data's hierarchy.</p>

<p>The store provides filtering and sorting support. This sorting/filtering can happen on the client side
or can be completed on the server. This is controlled by the <a href="#!/api/Ext.data.Store-cfg-remoteSort" rel="Ext.data.Store-cfg-remoteSort" class="docClass">remoteSort</a> and
<a href="#!/api/Ext.data.Store-cfg-remoteFilter" rel="Ext.data.Store-cfg-remoteFilter" class="docClass">remoteFilter</a> config options. For more information see the <a href="#!/api/Ext.data.AbstractStore-method-sort" rel="Ext.data.AbstractStore-method-sort" class="docClass">sort</a> and
<a href="#!/api/Ext.data.Store-method-filter" rel="Ext.data.Store-method-filter" class="docClass">filter</a> methods.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  inherit Ext_util_Sortable.t
  
  method defaultProxyType : Js.js_string Js.t Js.prop
  (** {% <p>The string type of the Proxy to create if none is specified. This defaults to creating a
<a href="#!/api/Ext.data.proxy.Memory" rel="Ext.data.proxy.Memory" class="docClass">memory proxy</a>.</p> %}
    
    Defaults to: ['memory']
    *)
  method filters : Ext_util_MixedCollection.t Js.t Js.prop
  (** {% <p>The collection of <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Filters</a> currently applied to this Store</p> %}
    *)
  method isDestroyed : bool Js.t Js.prop
  (** {% <p>True if the Store has already been destroyed. If this is true, the reference to Store should be deleted
as it will not function correctly any more.</p> %}
    
    Defaults to: [false]
    *)
  method isStore : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Store, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method removed : Ext_data_Model.t Js.js_array Js.t Js.prop
  (** {% <p>Temporary cache in which removed model instances are kept until successfully synchronised with a Proxy,
at which point this is cleared.</p> %}
    *)
  method getModifiedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Gets all <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">records</a> added or updated since the last commit. Note that the order of records
returned is not deterministic and does not indicate the order in which records were modified. Note also that
removed records are not included (use <a href="#!/api/Ext.data.AbstractStore-method-getRemovedRecords" rel="Ext.data.AbstractStore-method-getRemovedRecords" class="docClass">getRemovedRecords</a> for that).</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The added and updated Model instances</p> %}
    }
    }
    *)
  method getNewRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Returns all Model instances that are either currently a phantom (e.g. have no id), or have an ID but have not
yet been saved on this Store (this happens when adding a non-phantom record from another Store into this one)</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The Model instances</p> %}
    }
    }
    *)
  method getProxy : #Ext_data_proxy_Proxy.t Js.t Js.meth
  (** {% <p>Returns the proxy currently attached to this proxy instance</p> %}
    
    {b Returns}:
    {ul {- [#Ext_data_proxy_Proxy.t Js.t] {% <p>The Proxy instance</p> %}
    }
    }
    *)
  method getRemovedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Returns any records that have been removed from the store but not yet destroyed on the proxy.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The removed Model instances</p> %}
    }
    }
    *)
  method getUpdatedRecords : Ext_data_Model.t Js.js_array Js.t Js.meth
  (** {% <p>Returns all Model instances that have been updated in the Store but not yet synchronized with the Proxy</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The updated Model instances</p> %}
    }
    }
    *)
  method isLoading : bool Js.t Js.meth
  (** {% <p>Returns true if the Store is currently performing a load operation</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the Store is currently loading</p> %}
    }
    }
    *)
  method load : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Loads the Store using its configured <a href="#!/api/Ext.data.AbstractStore-cfg-proxy" rel="Ext.data.AbstractStore-cfg-proxy" class="docClass">proxy</a>.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>config object. This is passed into the <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a>
object that is created and then sent to the proxy's <a href="#!/api/Ext.data.proxy.Proxy-method-read" rel="Ext.data.proxy.Proxy-method-read" class="docClass">Ext.data.proxy.Proxy.read</a> function</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Store.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  method reload : _ Js.t -> unit Js.meth
  (** {% <p>Reloads the store using the last options passed to the <a href="#!/api/Ext.data.AbstractStore-method-load" rel="Ext.data.AbstractStore-method-load" class="docClass">load</a> method.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>A config object which contains options which may override the options passed to the previous load call.</p> %}
    }
    }
    *)
  method removeAll : unit Js.meth
  (** {% <p>Removes all records from the store. This method does a "fast remove",
individual remove events are not called. The <a href="#!/api/Ext.data.AbstractStore-event-clear" rel="Ext.data.AbstractStore-event-clear" class="docClass">clear</a> event is
fired upon completion.</p> %}
    *)
  method resumeAutoSync : unit Js.meth
  (** {% <p>Resumes automatically syncing the Store with its Proxy.  Only applicable if <a href="#!/api/Ext.data.AbstractStore-cfg-autoSync" rel="Ext.data.AbstractStore-cfg-autoSync" class="docClass">autoSync</a> is <code>true</code></p> %}
    *)
  method setProxy : _ Js.t -> #Ext_data_proxy_Proxy.t Js.t Js.meth
  (** {% <p>Sets the Store's Proxy by string, config object or Proxy instance</p> %}
    
    {b Parameters}:
    {ul {- proxy: [_ Js.t]
    {% <p>The new Proxy, which can be either a type string, a configuration object
or an <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Ext.data.proxy.Proxy</a> instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_data_proxy_Proxy.t Js.t]
    {% <p>The attached Proxy object</p> %}
    }
    }
    *)
  method suspendAutoSync : unit Js.meth
  (** {% <p>Suspends automatically syncing the Store with its Proxy.  Only applicable if <a href="#!/api/Ext.data.AbstractStore-cfg-autoSync" rel="Ext.data.AbstractStore-cfg-autoSync" class="docClass">autoSync</a> is <code>true</code></p> %}
    *)
  method sync : _ Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Synchronizes the store with its <a href="#!/api/Ext.data.AbstractStore-cfg-proxy" rel="Ext.data.AbstractStore-cfg-proxy" class="docClass">proxy</a>. This asks the proxy to batch together any new, updated
and deleted records in the store, updating the store's internal representation of the records
as each operation completes.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t] (optional)
    {% <p>Object containing one or more properties supported by the sync method (these get
passed along to the underlying proxy's <a href="#!/api/Ext.data.proxy.Proxy-method-batch" rel="Ext.data.proxy.Proxy-method-batch" class="docClass">batch</a> method):</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Store.t Js.t] {% <p>this</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  inherit Ext_util_Sortable.configs
  
  method autoLoad : _ Js.t Js.prop
  (** {% <p>If data is not specified, and if autoLoad is true or an Object, this store's load method is automatically called
after creation. If the value of autoLoad is an Object, this Object will be passed to the store's load method.</p> %}
    *)
  method autoSync : bool Js.t Js.prop
  (** {% <p>True to automatically sync the Store with its Proxy after every edit to one of its Records. Defaults to false.</p> %}
    
    Defaults to: [false]
    *)
  method batchUpdateMode : Js.js_string Js.t Js.prop
  (** {% <p>Sets the updating behavior based on batch synchronization. 'operation' (the default) will update the Store's
internal representation of the data after each operation of the batch has completed, 'complete' will wait until
the entire batch has been completed before updating the Store's data. 'complete' is a good choice for local
storage proxies, 'operation' is better for remote proxies, where there is a comparatively high latency.</p> %}
    
    Defaults to: ['operation']
    *)
  method fields : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>This may be used in place of specifying a <a href="#!/api/Ext.data.AbstractStore-cfg-model" rel="Ext.data.AbstractStore-cfg-model" class="docClass">model</a> configuration. The fields should be a
set of <a href="#!/api/Ext.data.Field" rel="Ext.data.Field" class="docClass">Ext.data.Field</a> configuration objects. The store will automatically create a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>
with these fields. In general this configuration option should only be used for simple stores like
a two-field store of ComboBox. For anything more complicated, such as specifying a particular id property or
associations, a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> should be defined and specified for the <a href="#!/api/Ext.data.AbstractStore-cfg-model" rel="Ext.data.AbstractStore-cfg-model" class="docClass">model</a>
config.</p> %}
    *)
  method filterOnLoad : bool Js.t Js.prop
  (** {% <p>If true, any filters attached to this Store will be run after loading data, before the datachanged event is fired.
Defaults to true, ignored if <a href="#!/api/Ext.data.Store-cfg-remoteFilter" rel="Ext.data.Store-cfg-remoteFilter" class="docClass">remoteFilter</a> is true</p> %}
    
    Defaults to: [true]
    *)
  method filters : _ Js.t Js.prop
  (** {% <p>Array of <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Filters</a> for this store. Can also be passed array of
functions which will be used as the <a href="#!/api/Ext.util.Filter-cfg-filterFn" rel="Ext.util.Filter-cfg-filterFn" class="docClass">filterFn</a> config
for filters:</p>

<pre><code>filters: [
    function(item) \{
        return item.weight &gt; 0;
    \}
]
</code></pre>

<p>To filter after the grid is loaded use the <a href="#!/api/Ext.data.Store-method-filterBy" rel="Ext.data.Store-method-filterBy" class="docClass">filterBy</a> function.</p> %}
    *)
  method model : Js.js_string Js.t Js.prop
  (** {% <p>Name of the <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> associated with this store.
The string is used as an argument for <a href="#!/api/Ext.ModelManager-method-getModel" rel="Ext.ModelManager-method-getModel" class="docClass">Ext.ModelManager.getModel</a>.</p> %}
    *)
  method proxy : _ Js.t Js.prop
  (** {% <p>The Proxy to use for this Store. This can be either a string, a config object or a Proxy instance -
see <a href="#!/api/Ext.data.AbstractStore-method-setProxy" rel="Ext.data.AbstractStore-method-setProxy" class="docClass">setProxy</a> for details.</p> %}
    *)
  method remoteFilter : bool Js.t Js.prop
  (** {% <p>True to defer any filtering operation to the server. If false, filtering is done locally on the client.</p> %}
    
    Defaults to: [false]
    *)
  method remoteSort : bool Js.t Js.prop
  (** {% <p>True to defer any sorting operation to the server. If false, sorting is done locally on the client.</p> %}
    
    Defaults to: [false]
    *)
  method sortOnLoad : bool Js.t Js.prop
  (** {% <p>If true, any sorters attached to this Store will be run after loading data, before the datachanged event is fired.
Defaults to true, igored if <a href="#!/api/Ext.data.Store-cfg-remoteSort" rel="Ext.data.Store-cfg-remoteSort" class="docClass">remoteSort</a> is true</p> %}
    
    Defaults to: [true]
    *)
  method statefulFilters : bool Js.t Js.prop
  (** {% <p>Configure as <code>true</code> to have the filters saved when a client <a href="#!/api/Ext.grid.Panel" rel="Ext.grid.Panel" class="docClass">grid</a> saves its state.</p> %}
    
    Defaults to: [false]
    *)
  method storeId : Js.js_string Js.t Js.prop
  (** {% <p>Unique identifier for this store. If present, this Store will be registered with the <a href="#!/api/Ext.data.StoreManager" rel="Ext.data.StoreManager" class="docClass">Ext.data.StoreManager</a>,
making it easy to reuse elsewhere.</p>

<p>Note that when store is instatiated by Controller, the storeId will be overridden by the name of the store.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  inherit Ext_util_Sortable.events
  
  method add : (t Js.t -> Ext_data_Model.t Js.js_array Js.t -> Js.number Js.t
    -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired when a Model instance has been added to this Store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store</p> %}
    }
    {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The Model instances that were added</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index at which the instances were inserted</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforeload : (t Js.t -> Ext_data_Operation.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires before a request is made for a new data object. If the beforeload handler returns false the load
action will be canceled.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>This Store</p> %}
    }
    {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a> object that will be passed to the Proxy to
load the Store</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method beforesync : (_ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fired before a call to <a href="#!/api/Ext.data.AbstractStore-method-sync" rel="Ext.data.AbstractStore-method-sync" class="docClass">sync</a> is executed. Return false from any listener to cancel the sync</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>Hash of all records to be synchronized, broken down into create, update and destroy</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method bulkremove : (t Js.t -> Ext_data_Model.t Js.js_array Js.t ->
    Js.number Js.t Js.js_array Js.t -> bool Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired at the <em>end</em> of the <a href="#!/api/Ext.data.Store-method-remove" rel="Ext.data.Store-method-remove" class="docClass">remove</a> method when all records in the passed array have been removed.</p>

<p>If many records may be removed in one go, then it is more efficient to listen for this event
and perform any processing for a bulk remove than to listen for many <a href="#!/api/Ext.data.AbstractStore-event-remove" rel="Ext.data.AbstractStore-event-remove" class="docClass">remove</a> events.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The Store object</p> %}
    }
    {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>The array of records that were removed (In the order they appear in the Store)</p> %}
    }
    {- indexes: [Js.number Js.t Js.js_array Js.t]
    {% <p>The indexes of the records that were removed</p> %}
    }
    {- isMove: [bool Js.t]
    {% <p><code>true</code> if the child nodes are being removed so they can be moved to another position in this Store.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method clear : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired after the <a href="#!/api/Ext.data.AbstractStore-method-removeAll" rel="Ext.data.AbstractStore-method-removeAll" class="docClass">removeAll</a> method is called.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method datachanged : (t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires whenever the records in the Store have changed in some way - this could include adding or removing
records, or updating the data in existing records</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    {% <p>The data store</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method load : (t Js.t -> Ext_data_Model.t Js.js_array Js.t -> bool Js.t ->
    _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires whenever the store reads data from a remote data source.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    }
    {- records: [Ext_data_Model.t Js.js_array Js.t]
    {% <p>An array of records</p> %}
    }
    {- successful: [bool Js.t]
    {% <p>True if the operation was successful.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method metachange : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when this store's underlying reader (available via the proxy) provides new metadata.
Metadata usually consists of new field definitions, but can include any configuration data
required by an application, and can be processed as needed in the event handler.
This event is currently only fired for JsonReaders.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    }
    {- meta: [_ Js.t] {% <p>The JSON metadata</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method refresh : (t Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fires when the data cache has changed in a bulk manner (e.g., it has been sorted, filtered, etc.) and a
widget that is using this Store as a Record cache should refresh its view.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    {% <p>The data store</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method remove : (t Js.t -> Ext_data_Model.t Js.t -> Js.number Js.t ->
    bool Js.t -> _ Js.t -> unit) Js.callback Js.writeonly_prop
  (** {% <p>Fired when a Model instance has been removed from this Store.</p>

<p><strong>If many records may be removed in one go, then it is more efficient to listen for the <a href="#!/api/Ext.data.AbstractStore-event-bulkremove" rel="Ext.data.AbstractStore-event-bulkremove" class="docClass">bulkremove</a> event
and perform any processing for a bulk remove than to listen for this <a href="#!/api/Ext.data.AbstractStore-event-remove" rel="Ext.data.AbstractStore-event-remove" class="docClass">remove</a> event.</strong></p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The Store object</p> %}
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that was removed</p> %}
    }
    {- index: [Js.number Js.t]
    {% <p>The index of the record that was removed</p> %}
    }
    {- isMove: [bool Js.t]
    {% <p><code>true</code> if the child node is being removed so it can be moved to another position in this Store.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method update : (t Js.t -> Ext_data_Model.t Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.js_array Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when a Model instance has been updated.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Store.t Js.t]
    }
    {- record: [Ext_data_Model.t Js.t]
    {% <p>The Model instance that was updated</p> %}
    }
    {- operation: [Js.js_string Js.t]
    {% <p>The update operation being performed. Value may be one of:</p>

<pre><code><a href="#!/api/Ext.data.Model-static-property-EDIT" rel="Ext.data.Model-static-property-EDIT" class="docClass">Ext.data.Model.EDIT</a>
<a href="#!/api/Ext.data.Model-static-property-REJECT" rel="Ext.data.Model-static-property-REJECT" class="docClass">Ext.data.Model.REJECT</a>
<a href="#!/api/Ext.data.Model-static-property-COMMIT" rel="Ext.data.Model-static-property-COMMIT" class="docClass">Ext.data.Model.COMMIT</a>
</code></pre> %}
    }
    {- modifiedFieldNames: [Js.js_string Js.t Js.js_array Js.t]
    {% <p>Array of field names changed during edit.</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method write : (t Js.t -> Ext_data_Operation.t Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires whenever a successful write has been made via the configured <a href="#!/api/Ext.data.AbstractStore-cfg-proxy" rel="Ext.data.AbstractStore-cfg-proxy" class="docClass">Proxy</a></p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>This Store</p> %}
    }
    {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a> object that was used in
the write</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  inherit Ext_util_Sortable.statics
  
  method create_store : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Creates a store from config object.</p> %}
    
    {b Parameters}:
    {ul {- store: [_ Js.t]
    {% <p>A config for
the store to be created.  It may contain a <code>type</code> field
which defines the particular type of store to create.</p>

<p>Alteratively passing an actual store to this method will
just return it, no changes made.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [#Ext_data_AbstractStore.t Js.t]
    {% <p>The created store.</p> %}
    }
    }
    *)
  
end

val get_static : unit -> statics Js.t
(** Static instance for lazy-loaded modules. *)

val static : statics Js.t
(** Static instance. *)

val create : _ Js.t -> 'self Js.t
(** See method [statics.create] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

