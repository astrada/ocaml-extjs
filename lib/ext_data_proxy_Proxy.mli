(** Proxies are used by Stores to handle the loading a ...
  
  {% <p>Proxies are used by <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Stores</a> to handle the loading and saving of <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a>
data. Usually developers will not need to create or interact with proxies directly.</p>

<h1>Types of Proxy</h1>

<p>There are two main types of Proxy - <a href="#!/api/Ext.data.proxy.Client" rel="Ext.data.proxy.Client" class="docClass">Client</a> and <a href="#!/api/Ext.data.proxy.Server" rel="Ext.data.proxy.Server" class="docClass">Server</a>.
The Client proxies save their data locally and include the following subclasses:</p>

<ul>
<li><a href="#!/api/Ext.data.proxy.LocalStorage" rel="Ext.data.proxy.LocalStorage" class="docClass">LocalStorageProxy</a> - saves its data to localStorage if the browser supports it</li>
<li><a href="#!/api/Ext.data.proxy.SessionStorage" rel="Ext.data.proxy.SessionStorage" class="docClass">SessionStorageProxy</a> - saves its data to sessionStorage if the browsers supports it</li>
<li><a href="#!/api/Ext.data.proxy.Memory" rel="Ext.data.proxy.Memory" class="docClass">MemoryProxy</a> - holds data in memory only, any data is lost when the page is refreshed</li>
</ul>


<p>The Server proxies save their data by sending requests to some remote server. These proxies include:</p>

<ul>
<li><a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ajax</a> - sends requests to a server on the same domain</li>
<li><a href="#!/api/Ext.data.proxy.JsonP" rel="Ext.data.proxy.JsonP" class="docClass">JsonP</a> - uses JSON-P to send requests to a server on a different domain</li>
<li><a href="#!/api/Ext.data.proxy.Rest" rel="Ext.data.proxy.Rest" class="docClass">Rest</a> - uses RESTful HTTP methods (GET/PUT/POST/DELETE) to communicate with server</li>
<li><a href="#!/api/Ext.data.proxy.Direct" rel="Ext.data.proxy.Direct" class="docClass">Direct</a> - uses <a href="#!/api/Ext.direct.Manager" rel="Ext.direct.Manager" class="docClass">Ext.direct.Manager</a> to send requests</li>
</ul>


<p>Proxies operate on the principle that all operations performed are either Create, Read, Update or Delete. These four
operations are mapped to the methods <a href="#!/api/Ext.data.proxy.Proxy-method-create" rel="Ext.data.proxy.Proxy-method-create" class="docClass">create</a>, <a href="#!/api/Ext.data.proxy.Proxy-method-read" rel="Ext.data.proxy.Proxy-method-read" class="docClass">read</a>, <a href="#!/api/Ext.data.proxy.Proxy-method-update" rel="Ext.data.proxy.Proxy-method-update" class="docClass">update</a> and <a href="#!/api/Ext.data.proxy.Proxy-method-destroy" rel="Ext.data.proxy.Proxy-method-destroy" class="docClass">destroy</a>
respectively. Each Proxy subclass implements these functions.</p>

<p>The CRUD methods each expect an <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a> object as the sole argument. The Operation
encapsulates information about the action the Store wishes to perform, the <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">model</a> instances
that are to be modified, etc. See the <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a> documentation for more details. Each CRUD
method also accepts a callback function to be called asynchronously on completion.</p>

<p>Proxies also support batching of Operations via a <a href="#!/api/Ext.data.Batch" rel="Ext.data.Batch" class="docClass">batch</a> object, invoked by the <a href="#!/api/Ext.data.proxy.Proxy-method-batch" rel="Ext.data.proxy.Proxy-method-batch" class="docClass">batch</a>
method.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isProxy : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Proxy, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method isSynchronous : bool Js.t Js.prop
  (** {% <p>Identifies the proxy as (a)synchronous.</p> %}
    
    Defaults to: [false]
    *)
  method batch : _ Js.t -> Ext_data_Batch.t Js.t Js.meth
  (** {% <p>Performs a batch of <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operations</a>, in the order specified by <a href="#!/api/Ext.data.proxy.Proxy-cfg-batchOrder" rel="Ext.data.proxy.Proxy-cfg-batchOrder" class="docClass">batchOrder</a>. Used
internally by <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>'s <a href="#!/api/Ext.data.Store-method-sync" rel="Ext.data.Store-method-sync" class="docClass">sync</a> method. Example usage:</p>

<pre><code>myProxy.batch(\{
    create : [myModel1, myModel2],
    update : [myModel3],
    destroy: [myModel4, myModel5]
\});
</code></pre>

<p>Where the myModel* above are <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> instances - in this case 1 and 2 are new instances and
have not been saved before, 3 has been saved previously but needs to be updated, and 4 and 5 have already been
saved but should now be destroyed.</p>

<p>Note that the previous version of this method took 2 arguments (operations and listeners). While this is still
supported for now, the current signature is now a single <code>options</code> argument that can contain both operations and
listeners, in addition to other options. The multi-argument signature will likely be deprecated in a future release.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>Object containing one or more properties supported by the batch method:</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Batch.t Js.t] {% <p>The newly created Batch</p> %}
    }
    }
    *)
  method create : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  (** {% <p>Performs the given create operation.</p> %}
    
    {b Parameters}:
    {ul {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The Operation to perform</p> %}
    }
    {- callback: [_ Js.callback]
    {% <p>Callback function to be called when the Operation has completed (whether
successful or not)</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>Scope to execute the callback function in</p> %}
    }
    }
    *)
  method destroy : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  (** {% <p>Performs the given destroy operation.</p> %}
    
    {b Parameters}:
    {ul {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The Operation to perform</p> %}
    }
    {- callback: [_ Js.callback]
    {% <p>Callback function to be called when the Operation has completed (whether
successful or not)</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>Scope to execute the callback function in</p> %}
    }
    }
    *)
  method getModel : Ext_data_Model.t Js.t Js.meth
  (** {% <p>Returns the model attached to this Proxy</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t] {% <p>The model</p> %}
    }
    }
    *)
  method getReader : Ext_data_reader_Reader.t Js.t Js.meth
  (** {% <p>Returns the reader currently attached to this proxy instance</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_reader_Reader.t Js.t]
    {% <p>The Reader instance</p> %}
    }
    }
    *)
  method getWriter : Ext_data_writer_Writer.t Js.t Js.meth
  (** {% <p>Returns the writer currently attached to this proxy instance</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_writer_Writer.t Js.t]
    {% <p>The Writer instance</p> %}
    }
    }
    *)
  method read : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t -> unit
    Js.meth
  (** {% <p>Performs the given read operation.</p> %}
    
    {b Parameters}:
    {ul {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The Operation to perform</p> %}
    }
    {- callback: [_ Js.callback]
    {% <p>Callback function to be called when the Operation has completed (whether
successful or not)</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>Scope to execute the callback function in</p> %}
    }
    }
    *)
  method setModel : _ Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>Sets the model associated with this proxy. This will only usually be called by a Store</p> %}
    
    {b Parameters}:
    {ul {- model: [_ Js.t]
    {% <p>The new model. Can be either the model name string,
or a reference to the model's constructor</p> %}
    }
    {- setOnStore: [bool Js.t]
    {% <p>Sets the new model on the associated Store, if one is present</p> %}
    }
    }
    *)
  method setReader : _ Js.t -> Ext_data_reader_Reader.t Js.t Js.meth
  (** {% <p>Sets the Proxy's Reader by string, config object or Reader instance</p> %}
    
    {b Parameters}:
    {ul {- reader: [_ Js.t]
    {% <p>The new Reader, which can be either a type string,
a configuration object or an <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.reader.Reader</a> instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_reader_Reader.t Js.t]
    {% <p>The attached Reader object</p> %}
    }
    }
    *)
  method setWriter : _ Js.t -> Ext_data_writer_Writer.t Js.t Js.meth
  (** {% <p>Sets the Proxy's Writer by string, config object or Writer instance</p> %}
    
    {b Parameters}:
    {ul {- writer: [_ Js.t]
    {% <p>The new Writer, which can be either a type string,
a configuration object or an <a href="#!/api/Ext.data.writer.Writer" rel="Ext.data.writer.Writer" class="docClass">Ext.data.writer.Writer</a> instance</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_writer_Writer.t Js.t]
    {% <p>The attached Writer object</p> %}
    }
    }
    *)
  method update : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  (** {% <p>Performs the given update operation.</p> %}
    
    {b Parameters}:
    {ul {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The Operation to perform</p> %}
    }
    {- callback: [_ Js.callback]
    {% <p>Callback function to be called when the Operation has completed (whether
successful or not)</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>Scope to execute the callback function in</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method batchActions : bool Js.t Js.prop
  (** {% <p>True to batch actions of a particular type when synchronizing the store. Defaults to true.</p> %}
    
    Defaults to: [true]
    *)
  method batchOrder : Js.js_string Js.t Js.prop
  (** {% <p>Comma-separated ordering 'create', 'update' and 'destroy' actions when batching. Override this to set a different
order for the batched CRUD actions to be executed in. Defaults to 'create,update,destroy'.</p> %}
    
    Defaults to: ['create,update,destroy']
    *)
  method model : _ Js.t Js.prop
  (** {% <p>The name of the Model to tie to this Proxy. Can be either the string name of the Model, or a reference to the
Model constructor. Required.</p> %}
    *)
  method reader : _ Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.reader.Reader</a> to use to decode the server's response or data read from client. This can either be a
Reader instance, a config object or just a valid Reader type name (e.g. 'json', 'xml').</p> %}
    *)
  method writer : _ Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.writer.Writer" rel="Ext.data.writer.Writer" class="docClass">Ext.data.writer.Writer</a> to use to encode any request sent to the server or saved to client. This can either be
a Writer instance, a config object or just a valid Writer type name (e.g. 'json', 'xml').</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method metachange : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when this proxy's reader provides new metadata. Metadata usually consists
of new field definitions, but can include any configuration data required by an
application, and can be processed as needed in the event handler.
This event is currently only fired for JsonReaders. Note that this event is also
propagated by <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>, which is typically where it would be handled.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_data_proxy_Proxy.t Js.t]
    }
    {- meta: [_ Js.t] {% <p>The JSON metadata</p> %}
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
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

