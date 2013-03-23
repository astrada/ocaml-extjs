(** Base Writer class used by most subclasses of Ext.d ...
  
  {% <p>Base Writer class used by most subclasses of <a href="#!/api/Ext.data.proxy.Server" rel="Ext.data.proxy.Server" class="docClass">Ext.data.proxy.Server</a>. This class is responsible for taking a
set of <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a> objects and a <a href="#!/api/Ext.data.Request" rel="Ext.data.Request" class="docClass">Ext.data.Request</a> object and modifying that request based on
the Operations.</p>

<p>For example a <a href="#!/api/Ext.data.writer.Json" rel="Ext.data.writer.Json" class="docClass">Ext.data.writer.Json</a> would format the Operations and their <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a> instances based on
the config options passed to the JsonWriter's constructor.</p>

<p>Writers are not needed for any kind of local storage - whether via a <a href="#!/api/Ext.data.proxy.WebStorage" rel="Ext.data.proxy.WebStorage" class="docClass">Web Storage
proxy</a> (see <a href="#!/api/Ext.data.proxy.LocalStorage" rel="Ext.data.proxy.LocalStorage" class="docClass">localStorage</a> and <a href="#!/api/Ext.data.proxy.SessionStorage" rel="Ext.data.proxy.SessionStorage" class="docClass">sessionStorage</a>) or just in memory via a <a href="#!/api/Ext.data.proxy.Memory" rel="Ext.data.proxy.Memory" class="docClass">MemoryProxy</a>.</p>

<h1>Dates</h1>

<p>Before sending dates to the server, they can be formatted using one of the <a href="#!/api/Ext.Date" rel="Ext.Date" class="docClass">Ext.Date</a> formats.
These formats can be specified both on the field and the writer itself. In terms of precedence, from highest to lowest:</p>

<ul>
<li><a href="#!/api/Ext.data.writer.Writer-cfg-dateFormat" rel="Ext.data.writer.Writer-cfg-dateFormat" class="docClass">Writer.dateFormat</a> The writer dateFormat will always have the highest precedence</li>
<li><a href="#!/api/Ext.data.Field-cfg-dateWriteFormat" rel="Ext.data.Field-cfg-dateWriteFormat" class="docClass">Ext.data.Field.dateWriteFormat</a> The dateWriteFormat will be used if no format is specified on the writer</li>
<li><a href="#!/api/Ext.data.Field-cfg-dateFormat" rel="Ext.data.Field-cfg-dateFormat" class="docClass">Field.dateFormat</a>/<a href="#!/api/Ext.data.Field-cfg-dateReadFormat" rel="Ext.data.Field-cfg-dateReadFormat" class="docClass">Field.dateReadFormat</a>
Finally, if none of the above options are specified the field will be formatted using the format that was used to read the date from the server.</li>
</ul> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method getRecordData : Ext_data_Model.t Js.t ->
    Ext_data_Operation.t Js.t Js.optdef -> _ Js.t Js.meth
  (** {% <p>Formats the data for each record before sending it to the server. This
method should be overridden to format the data in a way that differs from the default.</p> %}
    
    {b Parameters}:
    {ul {- record: [Ext_data_Model.t Js.t]
    {% <p>The record that we are writing to the server.</p> %}
    }
    {- operation: [Ext_data_Operation.t Js.t] (optional)
    {% <p>An operation object.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object literal of name/value keys to be written to the server.
By default this method returns the data property on the record.</p> %}
    }
    }
    *)
  method write : Ext_data_Request.t Js.t -> Ext_data_Request.t Js.t Js.meth
  (** {% <p>Prepares a Proxy's <a href="#!/api/Ext.data.Request" rel="Ext.data.Request" class="docClass">Ext.data.Request</a> object</p> %}
    
    {b Parameters}:
    {ul {- request: [Ext_data_Request.t Js.t]
    {% <p>The request object</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Request.t Js.t]
    {% <p>The modified request object</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method dateFormat : Js.js_string Js.t Js.prop
  (** {% <p>This is used for each field of type date in the model to format the value before
it is sent to the server.</p> %}
    *)
  method nameProperty : Js.js_string Js.t Js.prop
  (** {% <p>This property is used to read the key for each value that will be sent to the server. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Person', \{
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [\{
        name: 'first',
        mapping: 'firstName'
    \}, \{
        name: 'last',
        mapping: 'lastName'
    \}, \{
        name: 'age'
    \}]
\});
new <a href="#!/api/Ext.data.writer.Writer" rel="Ext.data.writer.Writer" class="docClass">Ext.data.writer.Writer</a>(\{
    writeAllFields: true,
    nameProperty: 'mapping'
\});

// This will be sent to the server
\{
    firstName: 'first name value',
    lastName: 'last name value',
    age: 1
\}
</code></pre>

<p>If the value is not present, the field name will always be used.</p> %}
    
    Defaults to: ['name']
    *)
  method writeAllFields : bool Js.t Js.prop
  (** {% <p>True to write all fields from the record to the server. If set to false it will only send the fields that were
modified. Note that any fields that have <a href="#!/api/Ext.data.Field-cfg-persist" rel="Ext.data.Field-cfg-persist" class="docClass">Ext.data.Field.persist</a> set to false will still be ignored.</p> %}
    
    Defaults to: [true]
    *)
  method writeRecordId : bool Js.t Js.prop
  (** {% <p>By default, each record's id is always included in the output for non-phantom records since in most
cases the id will be required on the server to process the record action. This is helpful since the id
will normally not be modified, and so would not be sent to the server unless <a href="#!/api/Ext.data.writer.Writer-cfg-writeAllFields" rel="Ext.data.writer.Writer-cfg-writeAllFields" class="docClass">writeAllFields</a>
was explicitly enabled.</p>

<p>However, there are cases where it is not desirable for the record id to be passed in the data directly.
For example, when using a RESTful API the record id would typically be appended to the url instead.</p> %}
    
    Defaults to: [true]
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  
end

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

