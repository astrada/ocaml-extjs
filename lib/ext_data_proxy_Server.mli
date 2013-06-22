(** ServerProxy is a superclass of JsonPProxy and <a h ...
  
  {% <p>ServerProxy is a superclass of <a href="#!/api/Ext.data.proxy.JsonP" rel="Ext.data.proxy.JsonP" class="docClass">JsonPProxy</a> and <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">AjaxProxy</a>, and
would not usually be used directly.</p>

<p>ServerProxy should ideally be named HttpProxy as it is a superclass for all HTTP proxies - for Ext JS 4.x it has been
called ServerProxy to enable any 3.x applications that reference the HttpProxy to continue to work (HttpProxy is now
an alias of AjaxProxy).</p> %}
  *)

class type t =
object('self)
  inherit Ext_data_proxy_Proxy.t
  
  method afterRequest : Ext_data_Request.t Js.t -> bool Js.t -> unit Js.meth
  (** {% <p>Optional callback function which can be used to clean up after a request has been completed.</p> %}
    
    {b Parameters}:
    {ul {- request: [Ext_data_Request.t Js.t]
    {% <p>The Request object</p> %}
    }
    {- success: [bool Js.t]
    {% <p>True if the request was successful</p> %}
    }
    }
    *)
  method buildRequest : Ext_data_Operation.t Js.t -> Ext_data_Request.t Js.t
    Js.meth
  (** {% <p>Creates an <a href="#!/api/Ext.data.Request" rel="Ext.data.Request" class="docClass">Request</a> object from <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a>.</p>

<p>This gets called from doRequest methods in subclasses of Server proxy.</p> %}
    
    {b Parameters}:
    {ul {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The operation to execute</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Request.t Js.t] {% <p>The request object</p> %}
    }
    }
    *)
  method buildUrl : Ext_data_Request.t Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Generates a url based on a given <a href="#!/api/Ext.data.Request" rel="Ext.data.Request" class="docClass">Ext.data.Request</a> object. By default, ServerProxy's buildUrl will add the
cache-buster param to the end of the url. Subclasses may need to perform additional modifications to the url.</p> %}
    
    {b Parameters}:
    {ul {- request: [Ext_data_Request.t Js.t]
    {% <p>The request object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The url</p> %}
    }
    }
    *)
  method create : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  (** {% <p>in a ServerProxy all four CRUD operations are executed in the same manner, so we delegate to doRequest in each case</p>

<p>Performs the given create operation.</p> %}
    
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
  method doRequest : Ext_data_Operation.t Js.t -> _ Js.callback -> _ Js.t ->
    unit Js.meth
  (** {% <p>In ServerProxy subclasses, the <a href="#!/api/Ext.data.proxy.Server-method-create" rel="Ext.data.proxy.Server-method-create" class="docClass">create</a>, <a href="#!/api/Ext.data.proxy.Server-method-read" rel="Ext.data.proxy.Server-method-read" class="docClass">read</a>, <a href="#!/api/Ext.data.proxy.Server-method-update" rel="Ext.data.proxy.Server-method-update" class="docClass">update</a> and <a href="#!/api/Ext.data.proxy.Server-method-destroy" rel="Ext.data.proxy.Server-method-destroy" class="docClass">destroy</a> methods all
pass through to doRequest. Each ServerProxy subclass must implement the doRequest method - see <a href="#!/api/Ext.data.proxy.JsonP" rel="Ext.data.proxy.JsonP" class="docClass">Ext.data.proxy.JsonP</a> and <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a> for examples. This method carries the same signature as
each of the methods that delegate to it.</p> %}
    
    {b Parameters}:
    {ul {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a> object</p> %}
    }
    {- callback: [_ Js.callback]
    {% <p>The callback function to call when the Operation has completed</p> %}
    }
    {- scope: [_ Js.t]
    {% <p>The scope in which to execute the callback</p> %}
    }
    }
    *)
  method encodeFilters : Ext_util_Filter.t Js.js_array Js.t ->
    Js.js_string Js.t Js.meth
  (** {% <p>Encodes the array of <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a> objects into a string to be sent in the request url. By default,
this simply JSON-encodes the filter data</p> %}
    
    {b Parameters}:
    {ul {- filters: [Ext_util_Filter.t Js.js_array Js.t]
    {% <p>The array of <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Filter</a> objects</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The encoded filters</p> %}
    }
    }
    *)
  method encodeSorters : Ext_util_Sorter.t Js.js_array Js.t ->
    Js.js_string Js.t Js.meth
  (** {% <p>Encodes the array of <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Ext.util.Sorter</a> objects into a string to be sent in the request url. By default,
this simply JSON-encodes the sorter data</p> %}
    
    {b Parameters}:
    {ul {- sorters: [Ext_util_Sorter.t Js.js_array Js.t]
    {% <p>The array of <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Sorter</a> objects</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The encoded sorters</p> %}
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
  method setExtraParam : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Sets a value in the underlying <a href="#!/api/Ext.data.proxy.Server-cfg-extraParams" rel="Ext.data.proxy.Server-cfg-extraParams" class="docClass">extraParams</a>.</p> %}
    
    {b Parameters}:
    {ul {- name: [Js.js_string Js.t]
    {% <p>The key for the new value</p> %}
    }
    {- value: [_ Js.t] {% <p>The value</p> %}
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
  inherit Ext_data_proxy_Proxy.configs
  
  method api : _ Js.t Js.prop
  (** {% <p>Specific urls to call on CRUD action methods "create", "read", "update" and "destroy". Defaults to:</p>

<pre><code>api: \{
    create  : undefined,
    read    : undefined,
    update  : undefined,
    destroy : undefined
\}
</code></pre>

<p>The url is built based upon the action being executed [create|read|update|destroy] using the commensurate
<a href="#!/api/Ext.data.proxy.Server-cfg-api" rel="Ext.data.proxy.Server-cfg-api" class="docClass">api</a> property, or if undefined default to the configured
<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>.<a href="#!/api/Ext.data.proxy.Server-cfg-url" rel="Ext.data.proxy.Server-cfg-url" class="docClass">url</a>.</p>

<p>For example:</p>

<pre><code>api: \{
    create  : '/controller/new',
    read    : '/controller/load',
    update  : '/controller/update',
    destroy : '/controller/destroy_action'
\}
</code></pre>

<p>If the specific URL for a given CRUD action is undefined, the CRUD action request will be directed to the
configured <a href="#!/api/Ext.data.proxy.Server-cfg-url" rel="Ext.data.proxy.Server-cfg-url" class="docClass">url</a>.</p> %}
    *)
  method cacheString : Js.js_string Js.t Js.prop
  (** {% <p>The name of the cache param added to the url when using noCache. Defaults to "_dc".</p> %}
    
    Defaults to: ["_dc"]
    *)
  method directionParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the direction parameter to send in a request. <strong>This is only used when simpleSortMode is set to
true.</strong></p> %}
    
    Defaults to: ["dir"]
    *)
  method extraParams : _ Js.t Js.prop
  (** {% <p>Extra parameters that will be included on every request. Individual requests with params of the same name
will override these params when they are in conflict.</p> %}
    *)
  method filterParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the 'filter' parameter to send in a request. Defaults to 'filter'. Set this to undefined if you don't
want to send a filter parameter.</p> %}
    
    Defaults to: ["filter"]
    *)
  method groupDirectionParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the direction parameter to send in a request. <strong>This is only used when simpleGroupMode is set to
true.</strong></p> %}
    
    Defaults to: ["groupDir"]
    *)
  method groupParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the 'group' parameter to send in a request. Defaults to 'group'. Set this to undefined if you don't
want to send a group parameter.</p> %}
    
    Defaults to: ["group"]
    *)
  method idParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the parameter which carries the id of the entity being operated upon.</p> %}
    
    Defaults to: ["id"]
    *)
  method limitParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the 'limit' parameter to send in a request. Defaults to 'limit'. Set this to undefined if you don't
want to send a limit parameter.</p> %}
    
    Defaults to: ["limit"]
    *)
  method noCache : bool Js.t Js.prop
  (** {% <p>Disable caching by adding a unique parameter name to the request. Set to false to allow caching. Defaults to true.</p> %}
    
    Defaults to: [true]
    *)
  method pageParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the 'page' parameter to send in a request. Defaults to 'page'. Set this to undefined if you don't
want to send a page parameter.</p> %}
    
    Defaults to: ["page"]
    *)
  method simpleGroupMode : bool Js.t Js.prop
  (** {% <p>Enabling simpleGroupMode in conjunction with remoteGroup will only send one group property and a direction when a
remote group is requested. The <a href="#!/api/Ext.data.proxy.Server-cfg-groupDirectionParam" rel="Ext.data.proxy.Server-cfg-groupDirectionParam" class="docClass">groupDirectionParam</a> and <a href="#!/api/Ext.data.proxy.Server-cfg-groupParam" rel="Ext.data.proxy.Server-cfg-groupParam" class="docClass">groupParam</a> will be sent with the property name and either 'ASC'
or 'DESC'.</p> %}
    
    Defaults to: [false]
    *)
  method simpleSortMode : bool Js.t Js.prop
  (** {% <p>Enabling simpleSortMode in conjunction with remoteSort will only send one sort property and a direction when a
remote sort is requested. The <a href="#!/api/Ext.data.proxy.Server-cfg-directionParam" rel="Ext.data.proxy.Server-cfg-directionParam" class="docClass">directionParam</a> and <a href="#!/api/Ext.data.proxy.Server-cfg-sortParam" rel="Ext.data.proxy.Server-cfg-sortParam" class="docClass">sortParam</a> will be sent with the property name
and either 'ASC' or 'DESC'.</p> %}
    
    Defaults to: [false]
    *)
  method sortParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the 'sort' parameter to send in a request. Defaults to 'sort'. Set this to undefined if you don't
want to send a sort parameter.</p> %}
    
    Defaults to: ["sort"]
    *)
  method startParam : Js.js_string Js.t Js.prop
  (** {% <p>The name of the 'start' parameter to send in a request. Defaults to 'start'. Set this to undefined if you don't
want to send a start parameter.</p> %}
    
    Defaults to: ["start"]
    *)
  method timeout : Js.number Js.t Js.prop
  (** {% <p>The number of milliseconds to wait for a response. Defaults to 30000 milliseconds (30 seconds).</p> %}
    
    Defaults to: [30000]
    *)
  method url : Js.js_string Js.t Js.prop
  (** {% <p>The URL from which to request the data object.</p> %}
    *)
  method afterRequest : ('self Js.t, Ext_data_Request.t Js.t -> bool Js.t ->
    unit) Js.meth_callback Js.writeonly_prop
  (** See method [t.afterRequest] *)
  
end

class type events =
object
  inherit Ext_data_proxy_Proxy.events
  
  method _exception : (#Ext_data_proxy_Proxy.t Js.t -> _ Js.t ->
    Ext_data_Operation.t Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the server returns an exception. This event may also be listened
to in the event that a request has timed out or has been aborted.</p> %}
    
    {b Parameters}:
    {ul {- this: [#Ext_data_proxy_Proxy.t Js.t]
    }
    {- response: [_ Js.t]
    {% <p>The response from the AJAX request</p> %}
    }
    {- operation: [Ext_data_Operation.t Js.t]
    {% <p>The operation that triggered request</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  
end

class type statics =
object
  inherit Ext_data_proxy_Proxy.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

