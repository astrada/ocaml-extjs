(** AjaxProxy is one of the most widely-used ways of g ...
  
  {% <p>AjaxProxy is one of the most widely-used ways of getting data into your application. It uses AJAX requests to load
data from the server, usually to be placed into a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a>. Let's take a look at a typical setup.
Here we're going to set up a Store that has an AjaxProxy. To prepare, we'll also set up a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a>:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['id', 'name', 'email']
});

//The Store contains the AjaxProxy as an inline configuration
var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    model: 'User',
    proxy: {
        type: 'ajax',
        url : 'users.json'
    }
});

store.load();
</code></pre>

<p>Our example is going to load user data into a Store, so we start off by defining a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> with
the fields that we expect the server to return. Next we set up the Store itself, along with a
<a href="#!/api/Ext.data.Store-cfg-proxy" rel="Ext.data.Store-cfg-proxy" class="docClass">proxy</a> configuration. This configuration was automatically turned into an
<a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a> instance, with the url we specified being passed into AjaxProxy's constructor.
It's as if we'd done this:</p>

<pre><code>new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    url: 'users.json',
    model: 'User',
    reader: 'json'
});
</code></pre>

<p>A couple of extra configurations appeared here - <a href="#!/api/Ext.data.proxy.Ajax-cfg-model" rel="Ext.data.proxy.Ajax-cfg-model" class="docClass">model</a> and <a href="#!/api/Ext.data.proxy.Ajax-cfg-reader" rel="Ext.data.proxy.Ajax-cfg-reader" class="docClass">reader</a>. These are set by default when we
create the proxy via the Store - the Store already knows about the Model, and Proxy's default <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Reader</a> is <a href="#!/api/Ext.data.reader.Json" rel="Ext.data.reader.Json" class="docClass">JsonReader</a>.</p>

<p>Now when we call store.load(), the AjaxProxy springs into action, making a request to the url we configured
('users.json' in this case). As we're performing a read, it sends a GET request to that url (see
<a href="#!/api/Ext.data.proxy.Ajax-property-actionMethods" rel="Ext.data.proxy.Ajax-property-actionMethods" class="docClass">actionMethods</a> to customize this - by default any kind of read will be sent as a GET request and any kind of write
will be sent as a POST request).</p>

<h1>Limitations</h1>

<p>AjaxProxy cannot be used to retrieve data from other domains. If your application is running on http://domainA.com it
cannot load data from http://domainB.com because browsers have a built-in security policy that prohibits domains
talking to each other via AJAX.</p>

<p>If you need to read data from another domain and can't set up a proxy server (some software that runs on your own
domain's web server and transparently forwards requests to http://domainB.com, making it look like they actually came
from http://domainA.com), you can use <a href="#!/api/Ext.data.proxy.JsonP" rel="Ext.data.proxy.JsonP" class="docClass">Ext.data.proxy.JsonP</a> and a technique known as JSON-P (JSON with
Padding), which can help you get around the problem so long as the server on http://domainB.com is set up to support
JSON-P responses. See <a href="#!/api/Ext.data.proxy.JsonP" rel="Ext.data.proxy.JsonP" class="docClass">JsonPProxy</a>'s introduction docs for more details.</p>

<h1>Readers and Writers</h1>

<p>AjaxProxy can be configured to use any type of <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Reader</a> to decode the server's response.
If no Reader is supplied, AjaxProxy will default to using a <a href="#!/api/Ext.data.reader.Json" rel="Ext.data.reader.Json" class="docClass">JsonReader</a>. Reader
configuration can be passed in as a simple object, which the Proxy automatically turns into a <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Reader</a> instance:</p>

<pre><code>var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    model: 'User',
    reader: {
        type: 'xml',
        root: 'users'
    }
});

proxy.getReader(); //returns an <a href="#!/api/Ext.data.reader.Xml" rel="Ext.data.reader.Xml" class="docClass">XmlReader</a> instance based on the config we supplied
</code></pre>

<h1>Url generation</h1>

<p>AjaxProxy automatically inserts any sorting, filtering, paging and grouping options into the url it generates for
each request. These are controlled with the following configuration options:</p>

<ul>
<li><a href="#!/api/Ext.data.proxy.Ajax-cfg-pageParam" rel="Ext.data.proxy.Ajax-cfg-pageParam" class="docClass">pageParam</a> - controls how the page number is sent to the server (see also <a href="#!/api/Ext.data.proxy.Ajax-cfg-startParam" rel="Ext.data.proxy.Ajax-cfg-startParam" class="docClass">startParam</a> and <a href="#!/api/Ext.data.proxy.Ajax-cfg-limitParam" rel="Ext.data.proxy.Ajax-cfg-limitParam" class="docClass">limitParam</a>)</li>
<li><a href="#!/api/Ext.data.proxy.Ajax-cfg-sortParam" rel="Ext.data.proxy.Ajax-cfg-sortParam" class="docClass">sortParam</a> - controls how sort information is sent to the server</li>
<li><a href="#!/api/Ext.data.proxy.Ajax-cfg-groupParam" rel="Ext.data.proxy.Ajax-cfg-groupParam" class="docClass">groupParam</a> - controls how grouping information is sent to the server</li>
<li><a href="#!/api/Ext.data.proxy.Ajax-cfg-filterParam" rel="Ext.data.proxy.Ajax-cfg-filterParam" class="docClass">filterParam</a> - controls how filter information is sent to the server</li>
</ul>


<p>Each request sent by AjaxProxy is described by an <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a>. To see how we can customize
the generated urls, let's say we're loading the Proxy with the following Operation:</p>

<pre><code>var operation = new <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a>({
    action: 'read',
    page  : 2
});
</code></pre>

<p>Now we'll issue the request for this Operation by calling <a href="#!/api/Ext.data.proxy.Ajax-method-read" rel="Ext.data.proxy.Ajax-method-read" class="docClass">read</a>:</p>

<pre><code>var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    url: '/users'
});

proxy.read(operation); //GET /users?page=2
</code></pre>

<p>Easy enough - the Proxy just copied the page property from the Operation. We can customize how this page data is sent
to the server:</p>

<pre><code>var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    url: '/users',
    pageParam: 'pageNumber'
});

proxy.read(operation); //GET /users?pageNumber=2
</code></pre>

<p>Alternatively, our Operation could have been configured to send start and limit parameters instead of page:</p>

<pre><code>var operation = new <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a>({
    action: 'read',
    start : 50,
    limit : 25
});

var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    url: '/users'
});

proxy.read(operation); //GET /users?start=50&amp;limit;=25
</code></pre>

<p>Again we can customize this url:</p>

<pre><code>var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    url: '/users',
    startParam: 'startIndex',
    limitParam: 'limitIndex'
});

proxy.read(operation); //GET /users?startIndex=50&amp;limitIndex;=25
</code></pre>

<p>AjaxProxy will also send sort and filter information to the server. Let's take a look at how this looks with a more
expressive Operation object:</p>

<pre><code>var operation = new <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a>({
    action: 'read',
    sorters: [
        new <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Ext.util.Sorter</a>({
            property : 'name',
            direction: 'ASC'
        }),
        new <a href="#!/api/Ext.util.Sorter" rel="Ext.util.Sorter" class="docClass">Ext.util.Sorter</a>({
            property : 'age',
            direction: 'DESC'
        })
    ],
    filters: [
        new <a href="#!/api/Ext.util.Filter" rel="Ext.util.Filter" class="docClass">Ext.util.Filter</a>({
            property: 'eyeColor',
            value   : 'brown'
        })
    ]
});
</code></pre>

<p>This is the type of object that is generated internally when loading a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> with sorters and
filters defined. By default the AjaxProxy will JSON encode the sorters and filters, resulting in something like this
(note that the url is escaped before sending the request, but is left unescaped here for clarity):</p>

<pre><code>var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
    url: '/users'
});

proxy.read(operation); //GET /users?sort=[{"property":"name","direction":"ASC"},{"property":"age","direction":"DESC"}]&amp;filter;=[{"property":"eyeColor","value":"brown"}]
</code></pre>

<p>We can again customize how this is created by supplying a few configuration options. Let's say our server is set up
to receive sorting information is a format like "sortBy=name#ASC,age#DESC". We can configure AjaxProxy to provide
that format like this:</p>

<pre><code> var proxy = new <a href="#!/api/Ext.data.proxy.Ajax" rel="Ext.data.proxy.Ajax" class="docClass">Ext.data.proxy.Ajax</a>({
     url: '/users',
     sortParam: 'sortBy',
     filterParam: 'filterBy',

     //our custom implementation of sorter encoding - turns our sorters into "name#ASC,age#DESC"
     encodeSorters: function(sorters) {
         var length   = sorters.length,
             sortStrs = [],
             sorter, i;

         for (i = 0; i &lt; length; i++) {
             sorter = sorters[i];

             sortStrs[i] = sorter.property + '#' + sorter.direction
         }

         return sortStrs.join(",");
     }
 });

 proxy.read(operation); //GET /users?sortBy=name#ASC,age#DESC&amp;filterBy;=[{"property":"eyeColor","value":"brown"}]
</code></pre>

<p>We can also provide a custom <a href="#!/api/Ext.data.proxy.Ajax-method-encodeFilters" rel="Ext.data.proxy.Ajax-method-encodeFilters" class="docClass">encodeFilters</a> function to encode our filters.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_data_proxy_Proxy.t
  inherit Ext_data_proxy_Server.t
  
  method actionMethods : _ Js.t Js.prop
  (** {% <p>Mapping of action name to HTTP request method. In the basic AjaxProxy these are set to 'GET' for 'read' actions
and 'POST' for 'create', 'update' and 'destroy' actions. The <a href="#!/api/Ext.data.proxy.Rest" rel="Ext.data.proxy.Rest" class="docClass">Ext.data.proxy.Rest</a> maps these to the
correct RESTful methods.</p> %}
    
    Defaults to: [{create: 'POST', read: 'GET', update: 'POST', destroy: 'POST'}]
    *)
  method getMethod : Ext_data_Request.t Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Returns the HTTP method name for a given request. By default this returns based on a lookup on
<a href="#!/api/Ext.data.proxy.Ajax-property-actionMethods" rel="Ext.data.proxy.Ajax-property-actionMethods" class="docClass">actionMethods</a>.</p> %}
    
    {b Parameters}:
    {ul {- request: [Ext_data_Request.t Js.t]
    {% <p>The request object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The HTTP method to use (should be one of 'GET', 'POST', 'PUT' or 'DELETE')</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_data_proxy_Proxy.configs
  inherit Ext_data_proxy_Server.configs
  
  method headers : _ Js.t Js.prop
  (** {% <p>Any headers to add to the Ajax request. Defaults to undefined.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_data_proxy_Proxy.events
  inherit Ext_data_proxy_Server.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_data_proxy_Proxy.statics
  inherit Ext_data_proxy_Server.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

