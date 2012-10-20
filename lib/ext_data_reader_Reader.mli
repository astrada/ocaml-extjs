(** Readers are used to interpret data to be loaded in ...
  
  {% <p>Readers are used to interpret data to be loaded into a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> instance or a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> - often in response to an AJAX request. In general there is usually no need to create
a Reader instance directly, since a Reader is almost always used together with a <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a>,
and is configured using the Proxy's <a href="#!/api/Ext.data.proxy.Proxy-cfg-reader" rel="Ext.data.proxy.Proxy-cfg-reader" class="docClass">reader</a> configuration property:</p>

<pre><code><a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    model: 'User',
    proxy: {
        type: 'ajax',
        url : 'users.json',
        reader: {
            type: 'json',
            root: 'users'
        }
    },
});
</code></pre>

<p>The above reader is configured to consume a JSON string that looks something like this:</p>

<pre><code>{
    "success": true,
    "users": [
        { "name": "User 1" },
        { "name": "User 2" }
    ]
}
</code></pre>

<h1>Loading Nested Data</h1>

<p>Readers have the ability to automatically load deeply-nested data objects based on the <a href="#!/api/Ext.data.association.Association" rel="Ext.data.association.Association" class="docClass">associations</a> configured on each Model. Below is an example demonstrating the flexibility of these associations in a
fictional CRM system which manages a User, their Orders, OrderItems and Products. First we'll define the models:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("User", {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        'id', 'name'
    ],

    hasMany: {model: 'Order', name: 'orders'},

    proxy: {
        type: 'rest',
        url : 'users.json',
        reader: {
            type: 'json',
            root: 'users'
        }
    }
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("Order", {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        'id', 'total'
    ],

    hasMany  : {model: 'OrderItem', name: 'orderItems', associationKey: 'order_items'},
    belongsTo: 'User'
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("OrderItem", {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        'id', 'price', 'quantity', 'order_id', 'product_id'
    ],

    belongsTo: ['Order', {model: 'Product', associationKey: 'product'}]
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>("Product", {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        'id', 'name'
    ],

    hasMany: 'OrderItem'
});
</code></pre>

<p>This may be a lot to take in - basically a User has many Orders, each of which is composed of several OrderItems.
Finally, each OrderItem has a single Product. This allows us to consume data like this:</p>

<pre><code>{
    "users": [
        {
            "id": 123,
            "name": "Ed",
            "orders": [
                {
                    "id": 50,
                    "total": 100,
                    "order_items": [
                        {
                            "id"      : 20,
                            "price"   : 40,
                            "quantity": 2,
                            "product" : {
                                "id": 1000,
                                "name": "MacBook Pro"
                            }
                        },
                        {
                            "id"      : 21,
                            "price"   : 20,
                            "quantity": 3,
                            "product" : {
                                "id": 1001,
                                "name": "iPhone"
                            }
                        }
                    ]
                }
            ]
        }
    ]
}
</code></pre>

<p>The JSON response is deeply nested - it returns all Users (in this case just 1 for simplicity's sake), all of the
Orders for each User (again just 1 in this case), all of the OrderItems for each Order (2 order items in this case),
and finally the Product associated with each OrderItem. Now we can read the data and use it as follows:</p>

<pre><code>var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    model: "User"
});

store.load({
    callback: function() {
        //the user that was loaded
        var user = store.first();

        console.log("Orders for " + user.get('name') + ":")

        //iterate over the Orders for each User
        user.orders().each(function(order) {
            console.log("Order ID: " + order.getId() + ", which contains items:");

            //iterate over the OrderItems for each Order
            order.orderItems().each(function(orderItem) {
                //we know that the Product data is already loaded, so we can use the synchronous getProduct
                //usually, we would use the asynchronous version (see <a href="#!/api/Ext.data.association.BelongsTo" rel="Ext.data.association.BelongsTo" class="docClass">Ext.data.association.BelongsTo</a>)
                var product = orderItem.getProduct();

                console.log(orderItem.get('quantity') + ' orders of ' + product.get('name'));
            });
        });
    }
});
</code></pre>

<p>Running the code above results in the following:</p>

<pre><code>Orders for Ed:
Order ID: 50, which contains items:
2 orders of MacBook Pro
3 orders of iPhone
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method metaData : 'a Js.t Js.readonly_prop
  (** {% <p>The raw meta data that was most recently read, if any. Meta data can include existing
Reader config options like <a href="#!/api/Ext.data.reader.Reader-cfg-idProperty" rel="Ext.data.reader.Reader-cfg-idProperty" class="docClass">idProperty</a>, <a href="#!/api/Ext.data.reader.Reader-cfg-totalProperty" rel="Ext.data.reader.Reader-cfg-totalProperty" class="docClass">totalProperty</a>, etc. that get
automatically applied to the Reader, and those can still be accessed directly from the Reader
if needed. However, meta data is also often used to pass other custom data to be processed
by application code. For example, it is common when reconfiguring the data model of a grid to
also pass a corresponding column model config to be applied to the grid. Any such data will
not get applied to the Reader directly (it just gets passed through and is ignored by Ext).
This metaData property gives you access to all meta data that was passed, including any such
custom data ignored by the reader.</p>

<p>This is a read-only property, and it will get replaced each time a new meta data object is
passed to the reader. Note that typically you would handle proxy's
<a href="#!/api/Ext.data.proxy.Proxy-event-metachange" rel="Ext.data.proxy.Proxy-event-metachange" class="docClass">metachange</a> event which passes this exact same meta
object to listeners. However this property is available if it's more convenient to access it
via the reader directly in certain cases.</p> %}
    *)
  method rawData : 'a Js.t Js.prop
  (** {% <p>The raw data object that was last passed to <a href="#!/api/Ext.data.reader.Reader-method-readRecords" rel="Ext.data.reader.Reader-method-readRecords" class="docClass">readRecords</a>. Stored for further processing if needed.</p> %}
    *)
  method getResponseData : 'a Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  (** {% <p>Takes a raw response object (as passed to the <a href="#!/api/Ext.data.reader.Reader-method-read" rel="Ext.data.reader.Reader-method-read" class="docClass">read</a> method) and returns the useful data
segment from it. This must be implemented by each subclass.</p> %}
    
    {b Parameters}:
    {ul {- response: ['a Js.t]
    {% <p>The response object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_ResultSet.t Js.t] {% <p>A ResultSet object</p> %}
    }
    }
    *)
  method read : 'a Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  (** {% <p>Reads the given response object. This method normalizes the different types of response object that may be passed to it.
If it's an XMLHttpRequest object, hand off to the subclass' <a href="#!/api/Ext.data.reader.Reader-method-getResponseData" rel="Ext.data.reader.Reader-method-getResponseData" class="docClass">getResponseData</a> method.
Else, hand off the reading of records to the <a href="#!/api/Ext.data.reader.Reader-method-readRecords" rel="Ext.data.reader.Reader-method-readRecords" class="docClass">readRecords</a> method.</p> %}
    
    {b Parameters}:
    {ul {- response: ['a Js.t]
    {% <p>The response object. This may be either an XMLHttpRequest object or a plain JS object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_ResultSet.t Js.t]
    {% <p>The parsed or default ResultSet object</p> %}
    }
    }
    *)
  method readRecords : 'a Js.t -> Ext_data_ResultSet.t Js.t Js.meth
  (** {% <p>Abstracts common functionality used by all Reader subclasses. Each subclass is expected to call this function
before running its own logic and returning the <a href="#!/api/Ext.data.ResultSet" rel="Ext.data.ResultSet" class="docClass">Ext.data.ResultSet</a> instance. For most Readers additional
processing should not be needed.</p> %}
    
    {b Parameters}:
    {ul {- data: ['a Js.t]
    {% <p>The raw data object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_ResultSet.t Js.t] {% <p>A ResultSet object</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method idProperty : Js.js_string Js.t Js.prop
  (** {% <p>Name of the property within a row object that contains a record identifier value. Defaults to the id of the
model. If an idProperty is explicitly specified it will override the idProperty defined on the model.</p> %}
    *)
  method implicitIncludes : bool Js.t Js.prop
  (** {% <p>True to automatically parse models nested within other models in a response object. See the
<a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.reader.Reader</a> intro docs for full explanation.</p> %}
    
    Defaults to: [true]
    *)
  method messageProperty : Js.js_string Js.t Js.prop
  (** {% <p>The name of the property which contains a response message. This property is optional.</p> %}
    *)
  method readRecordsOnFailure : bool Js.t Js.prop
  (** {% <p>True to extract the records from a data packet even if the <a href="#!/api/Ext.data.reader.Reader-cfg-successProperty" rel="Ext.data.reader.Reader-cfg-successProperty" class="docClass">successProperty</a> returns false.</p> %}
    
    Defaults to: [true]
    *)
  method root : Js.js_string Js.t Js.prop
  (** {% <p>The name of the property which contains the data items corresponding to the Model(s) for which this
Reader is configured.  For JSON reader it's a property name (or a dot-separated list of property names
if the root is nested).  For XML reader it's a CSS selector.  For Array reader the root is not applicable
since the data is assumed to be a single-level array of arrays.</p>

<p>By default the natural root of the data will be used: the root JSON array, the root XML element, or the array.</p>

<p>The data packet value for this property should be an empty array to clear the data or show no data.</p> %}
    
    Defaults to: ['']
    *)
  method successProperty : Js.js_string Js.t Js.prop
  (** {% <p>Name of the property from which to retrieve the <code>success</code> attribute, the value of which indicates
whether a given request succeeded or failed (typically a boolean or 'true'|'false'). See
<a href="#!/api/Ext.data.proxy.Server" rel="Ext.data.proxy.Server" class="docClass">Ext.data.proxy.Server</a>.<a href="#!/api/Ext.data.proxy.Server-event-exception" rel="Ext.data.proxy.Server-event-exception" class="docClass">exception</a> for additional information.</p> %}
    
    Defaults to: ["success"]
    *)
  method totalProperty : Js.js_string Js.t Js.prop
  (** {% <p>Name of the property from which to retrieve the total number of records in the dataset. This is only needed if
the whole dataset is not passed in one go, but is being paged from the remote server.</p> %}
    
    Defaults to: ["total"]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method _exception : (t Js.t -> XmlHttpRequest.xmlHttpRequest Js.t ->
    Ext_data_ResultSet.t Js.t -> 'a Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires when the reader receives improperly encoded data from the server</p> %}
    
    {b Parameters}:
    {ul {- reader: [Ext_data_reader_Reader.t Js.t]
    {% <p>A reference to this reader</p> %}
    }
    {- response: [XmlHttpRequest.xmlHttpRequest Js.t]
    {% <p>The XMLHttpRequest response object</p> %}
    }
    {- error: [Ext_data_ResultSet.t Js.t]
    {% <p>The error object</p> %}
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

