(** A class used to load remote content to an Element. ...
  
  {% <p>A class used to load remote content to an Element. Sample usage:</p>

<pre><code><a href="#!/api/Ext-method-get" rel="Ext-method-get" class="docClass">Ext.get</a>('el').load(\{
    url: 'myPage.php',
    scripts: true,
    params: \{
        id: 1
    \}
\});
</code></pre>

<p>In general this class will not be instanced directly, rather the <a href="#!/api/Ext.dom.Element-method-load" rel="Ext.dom.Element-method-load" class="docClass">Ext.Element.load</a> method
will be used.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method isLoader : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated ElementLoader, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method abort : unit Js.meth
  (** {% <p>Aborts the active load request</p> %}
    *)
  method destroy : unit Js.meth
  (** {% <p>Destroys the loader. Any active requests will be aborted.</p> %}
    *)
  method getTarget : _ Js.t Js.meth
  (** {% <p>Returns the target of this loader.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_Component.t Js.t]
    {% <p>The target or null if none exists.</p> %}
    }
    }
    *)
  method isAutoRefreshing : bool Js.t Js.meth
  (** {% <p>Checks whether the loader is automatically refreshing. See <a href="#!/api/Ext.ElementLoader-method-startAutoRefresh" rel="Ext.ElementLoader-method-startAutoRefresh" class="docClass">startAutoRefresh</a>.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t]
    {% <p>True if the loader is automatically refreshing</p> %}
    }
    }
    *)
  method load : _ Js.t -> unit Js.meth
  (** {% <p>Loads new data from the server.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>The options for the request. They can be any configuration option that can be specified for
the class, with the exception of the target option. Note that any options passed to the method will override any
class defaults.</p> %}
    }
    }
    *)
  method setTarget : _ Js.t -> unit Js.meth
  (** {% <p>Sets an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a> as the target of this loader.
Note that if the target is changed, any active requests will be aborted.</p> %}
    
    {b Parameters}:
    {ul {- target: [_ Js.t] {% <p>The element or its ID.</p> %}
    }
    }
    *)
  method startAutoRefresh : Js.number Js.t -> _ Js.t Js.optdef -> unit
    Js.meth
  (** {% <p>Automatically refreshes the content over a specified period.</p> %}
    
    {b Parameters}:
    {ul {- interval: [Js.number Js.t]
    {% <p>The interval to refresh in ms.</p> %}
    }
    {- options: [_ Js.t] (optional)
    {% <p>The options to pass to the load method. See <a href="#!/api/Ext.ElementLoader-method-load" rel="Ext.ElementLoader-method-load" class="docClass">load</a></p> %}
    }
    }
    *)
  method stopAutoRefresh : unit Js.meth
  (** {% <p>Clears any auto refresh. See <a href="#!/api/Ext.ElementLoader-method-startAutoRefresh" rel="Ext.ElementLoader-method-startAutoRefresh" class="docClass">startAutoRefresh</a>.</p> %}
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method ajaxOptions : _ Js.t Js.prop
  (** {% <p>Any additional options to be passed to the request, for example timeout or headers.</p> %}
    *)
  method autoLoad : _ Js.t Js.prop
  (** {% <p>True to have the loader make a request as soon as it is created.
This argument can also be a set of options that will be passed to <a href="#!/api/Ext.ElementLoader-method-load" rel="Ext.ElementLoader-method-load" class="docClass">load</a> is called.</p> %}
    
    Defaults to: [false]
    *)
  method baseParams : _ Js.t Js.prop
  (** {% <p>Params that will be attached to every request. These parameters
will not be overridden by any params in the load options.</p> %}
    *)
  method callback : _ Js.callback Js.prop
  (** {% <p>A function to be called when a load request finishes.
Will be called with the following config parameters:</p>

<ul>
<li>this - The ElementLoader instance.</li>
<li>success - True if successful request.</li>
<li>response - The response object.</li>
<li>options - Ajax options.</li>
</ul> %}
    *)
  method failure : _ Js.callback Js.prop
  (** {% <p>A function to be called when a load request fails.
Will be called with the following config parameters:</p>

<ul>
<li>this - The ElementLoader instance.</li>
<li>response - The response object.</li>
<li>options - Ajax options.</li>
</ul> %}
    *)
  method loadMask : _ Js.t Js.prop
  (** {% <p>True or a string to show when the element is loading.</p> %}
    
    Defaults to: [false]
    *)
  method params : _ Js.t Js.prop
  (** {% <p>Any params to be attached to the Ajax request. These parameters will
be overridden by any params in the load options.</p> %}
    *)
  method renderer : _ Js.callback Js.prop
  (** {% <p>A custom function to render the content to the element. The function should
return false if the renderer could not be applied. The passed parameters are:</p>

<ul>
<li>The loader</li>
<li>The response</li>
<li>The active request</li>
</ul> %}
    *)
  method scope : _ Js.t Js.prop
  (** {% <p>The scope to execute the <a href="#!/api/Ext.ElementLoader-cfg-success" rel="Ext.ElementLoader-cfg-success" class="docClass">success</a> and <a href="#!/api/Ext.ElementLoader-cfg-failure" rel="Ext.ElementLoader-cfg-failure" class="docClass">failure</a> functions in.</p> %}
    *)
  method scripts : bool Js.t Js.prop
  (** {% <p>True to parse any inline script tags in the response.</p> %}
    
    Defaults to: [false]
    *)
  method success : _ Js.callback Js.prop
  (** {% <p>A function to be called when a load request is successful.
Will be called with the following config parameters:</p>

<ul>
<li>this - The ElementLoader instance.</li>
<li>response - The response object.</li>
<li>options - Ajax options.</li>
</ul> %}
    *)
  method target : _ Js.t Js.prop
  (** {% <p>The target element for the loader. It can be the DOM element, the id or an <a href="#!/api/Ext.dom.Element" rel="Ext.dom.Element" class="docClass">Ext.Element</a>.</p> %}
    *)
  method url : Js.js_string Js.t Js.prop
  (** {% <p>The url to retrieve the content from.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method beforeload : (t Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires before a load request is made to the server.
Returning false from an event listener can prevent the load
from occurring.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_ElementLoader.t Js.t]
    }
    {- options: [_ Js.t]
    {% <p>The options passed to the request</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method _exception : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fires after an unsuccessful load.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_ElementLoader.t Js.t]
    }
    {- response: [_ Js.t]
    {% <p>The response from the server</p> %}
    }
    {- options: [_ Js.t]
    {% <p>The options passed to the request</p> %}
    }
    {- eOpts: [_ Js.t]
    {% <p>The options object passed to <a href="#!/api/Ext.util.Observable-method-addListener" rel="Ext.util.Observable-method-addListener" class="docClass">Ext.util.Observable.addListener</a>.</p> %}
    }
    }
    *)
  method load : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit) Js.callback
    Js.writeonly_prop
  (** {% <p>Fires after a successful load.</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_ElementLoader.t Js.t]
    }
    {- response: [_ Js.t]
    {% <p>The response from the server</p> %}
    }
    {- options: [_ Js.t]
    {% <p>The options passed to the request</p> %}
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

