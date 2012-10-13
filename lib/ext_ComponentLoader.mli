(** This class is used to load content via Ajax into a ...
  
  {% <p>This class is used to load content via Ajax into a <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>. In general
this class will not be instanced directly, rather a loader configuration will be passed to the
constructor of the <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>.</p>

<h2>HTML Renderer</h2>

<p>By default, the content loaded will be processed as raw html. The response text
from the request is taken and added to the component. This can be used in
conjunction with the <a href="#!/api/Ext.ComponentLoader-cfg-scripts" rel="Ext.ComponentLoader-cfg-scripts" class="docClass">scripts</a> option to execute any inline scripts in
the resulting content. Using this renderer has the same effect as passing the
<a href="#!/api/Ext.Component-cfg-html" rel="Ext.Component-cfg-html" class="docClass">Ext.Component.html</a> configuration option.</p>

<h2>Data Renderer</h2>

<p>This renderer allows content to be added by using JSON data and a <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a>.
The content received from the response is passed to the <a href="#!/api/Ext.Component-method-update" rel="Ext.Component-method-update" class="docClass">Ext.Component.update</a> method.
This content is run through the attached <a href="#!/api/Ext.Component-cfg-tpl" rel="Ext.Component-cfg-tpl" class="docClass">Ext.Component.tpl</a> and the data is added to
the Component. Using this renderer has the same effect as using the <a href="#!/api/Ext.Component-cfg-data" rel="Ext.Component-cfg-data" class="docClass">Ext.Component.data</a>
configuration in conjunction with a <a href="#!/api/Ext.Component-cfg-tpl" rel="Ext.Component-cfg-tpl" class="docClass">Ext.Component.tpl</a>.</p>

<h2>Component Renderer</h2>

<p>This renderer can only be used with a <a href="#!/api/Ext.container.Container" rel="Ext.container.Container" class="docClass">Ext.container.Container</a> and subclasses. It allows for
Components to be loaded remotely into a Container. The response is expected to be a single/series of
<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> configuration objects. When the response is received, the data is decoded
and then passed to <a href="#!/api/Ext.container.Container-method-add" rel="Ext.container.Container-method-add" class="docClass">Ext.container.Container.add</a>. Using this renderer has the same effect as specifying
the <a href="#!/api/Ext.container.Container-cfg-items" rel="Ext.container.Container-cfg-items" class="docClass">Ext.container.Container.items</a> configuration on a Container.</p>

<h2>Custom Renderer</h2>

<p>A custom function can be passed to handle any other special case, see the <a href="#!/api/Ext.ComponentLoader-cfg-renderer" rel="Ext.ComponentLoader-cfg-renderer" class="docClass">renderer</a> option.</p>

<h2>Example Usage</h2>

<pre><code>var cmp = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>', {
    renderTo: <a href="#!/api/Ext-method-getBody" rel="Ext-method-getBody" class="docClass">Ext.getBody</a>(),
    tpl: '{firstName} - {lastName}',
    loader: {
        url: 'myPage.php',
        renderer: 'data',
        params: {
            userId: 1
        }
    }
});

// call the loader manually (or use autoLoad:true instead)
cmp.getLoader().load();
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_ElementLoader.t
  
  method setTarget : 'a Js.t -> unit Js.meth
  (** {% <p>Set a {<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>} as the target of this loader. Note that if the target is changed,
any active requests will be aborted.</p> %}
    
    {b Parameters}:
    {ul {- target: ['a Js.t]
    {% <p>The component to be the target of this loader. If a string is passed
it will be looked up via its id.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_ElementLoader.configs
  
  method loadMask : 'a Js.t Js.prop
  (** {% <p>True or a <a href="#!/api/Ext.LoadMask" rel="Ext.LoadMask" class="docClass">Ext.LoadMask</a> configuration to enable masking during loading.</p> %}
    
    Defaults to: [false]
    *)
  method renderer_2 : 'a Js.t Js.prop
  (** {% <p>The type of content that is to be loaded into, which can be one of 3 types:</p>

<ul>
<li><strong>html</strong> : Loads raw html content, see <a href="#!/api/Ext.Component-cfg-html" rel="Ext.Component-cfg-html" class="docClass">Ext.Component.html</a></li>
<li><strong>data</strong> : Loads raw html content, see <a href="#!/api/Ext.Component-cfg-data" rel="Ext.Component-cfg-data" class="docClass">Ext.Component.data</a></li>
<li><strong>component</strong> : Loads child {<a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>} instances. This option is only valid when used with a Container.</li>
</ul>


<p>Alternatively, you can pass a function which is called with the following parameters.</p>

<ul>
<li>loader - Loader instance</li>
<li>response - The server response</li>
<li>active - The active request</li>
</ul>


<p>The function must return false is loading is not successful. Below is a sample of using a custom renderer:</p>

<pre><code>new <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a>({
    loader: {
        url: 'myPage.php',
        renderer: function(loader, response, active) {
            var text = response.responseText;
            loader.getTarget().update('The response is ' + text);
            return true;
        }
    }
});
</code></pre> %}
    
    Defaults to: ['html']
    *)
  method scripts : bool Js.t Js.prop
  (** {% <p>True to parse any inline script tags in the response. This only used when using the html
<a href="#!/api/Ext.ComponentLoader-cfg-renderer" rel="Ext.ComponentLoader-cfg-renderer" class="docClass">renderer</a>.</p> %}
    *)
  method target : 'a Js.t Js.prop
  (** {% <p>The target <a href="#!/api/Ext.Component" rel="Ext.Component" class="docClass">Ext.Component</a> for the loader.
If a string is passed it will be looked up via the id.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_ElementLoader.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_ElementLoader.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

