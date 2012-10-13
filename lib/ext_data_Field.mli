(** Fields are used to define what a Model is. They ar ...
  
  {% <p>Fields are used to define what a Model is. They aren't instantiated directly - instead, when we create a class that
extends <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>, it will automatically create a Field instance for each field configured in a <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a>. For example, we might set up a model like this:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        'name', 'email',
        {name: 'age', type: 'int'},
        {name: 'gender', type: 'string', defaultValue: 'Unknown'}
    ]
});
</code></pre>

<p>Four fields will have been created for the User Model - name, email, age and gender. Note that we specified a couple
of different formats here; if we only pass in the string name of the field (as with name and email), the field is set
up with the 'auto' type. It's as if we'd done this instead:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        {name: 'name', type: 'auto'},
        {name: 'email', type: 'auto'},
        {name: 'age', type: 'int'},
        {name: 'gender', type: 'string', defaultValue: 'Unknown'}
    ]
});
</code></pre>

<h1>Types and conversion</h1>

<p>The <a href="#!/api/Ext.data.Field-cfg-type" rel="Ext.data.Field-cfg-type" class="docClass">type</a> is important - it's used to automatically convert data passed to the field into the correct format.
In our example above, the name and email fields used the 'auto' type and will just accept anything that is passed
into them. The 'age' field had an 'int' type however, so if we passed 25.4 this would be rounded to 25.</p>

<p>Sometimes a simple type isn't enough, or we want to perform some processing when we load a Field's data. We can do
this using a <a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">convert</a> function. Here, we're going to create a new field based on another:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        {
            name: 'firstName',
            convert: function(value, record) {
                var fullName  = record.get('name'),
                    splits    = fullName.split(" "),
                    firstName = splits[0];

                return firstName;
            }
        },
        'name', 'email',
        {name: 'age', type: 'int'},
        {name: 'gender', type: 'string', defaultValue: 'Unknown'}
    ]
});
</code></pre>

<p>Now when we create a new User, the firstName is populated automatically based on the name:</p>

<pre><code>var ed = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('User', {name: 'Ed Spencer'});

console.log(ed.get('firstName')); //logs 'Ed', based on our convert function
</code></pre>

<p>Fields which are configured with a custom <code>convert</code> function are read <em>after</em> all other fields
when constructing and reading records, so that if convert functions rely on other, non-converted fields
(as in this example), they can be sure of those fields being present.</p>

<p>In fact, if we log out all of the data inside ed, we'll see this:</p>

<pre><code>console.log(ed.data);

//outputs this:
{
    age: 0,
    email: "",
    firstName: "Ed",
    gender: "Unknown",
    name: "Ed Spencer"
}
</code></pre>

<p>The age field has been given a default of zero because we made it an int type. As an auto field, email has defaulted
to an empty string. When we registered the User model we set gender's <a href="#!/api/Ext.data.Field-cfg-defaultValue" rel="Ext.data.Field-cfg-defaultValue" class="docClass">defaultValue</a> to 'Unknown' so we see
that now. Let's correct that and satisfy ourselves that the types work as we expect:</p>

<pre><code>ed.set('gender', 'Male');
ed.get('gender'); //returns 'Male'

ed.set('age', 25.4);
ed.get('age'); //returns 25 - we wanted an int, not a float, so no decimal places allowed
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method convert : 'a Js.callback Js.prop
  (** {% <p>A function which converts the value provided by the Reader into an object that will be stored in the Model.</p>

<p>If configured as <code>null</code>, then no conversion will be applied to the raw data property when this Field
is read. This will increase performance. but you must ensure that the data is of the correct type and does
not <em>need</em> converting.</p>

<p>It is passed the following parameters:</p>

<ul>
<li><p><strong>v</strong> : Mixed</p>

<p>The data value as read by the Reader, if undefined will use the configured <code><a href="#!/api/Ext.data.Field-cfg-defaultValue" rel="Ext.data.Field-cfg-defaultValue" class="docClass">defaultValue</a></code>.</p></li>
<li><p><strong>rec</strong> : <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a></p>

<p>The data object containing the Model as read so far by the Reader. Note that the Model may not be fully populated
at this point as the fields are read in the order that they are defined in your
<a href="#!/api/Ext.data.Model-cfg-fields" rel="Ext.data.Model-cfg-fields" class="docClass">fields</a> array.</p></li>
</ul>


<p>Example of convert functions:</p>

<pre><code>function fullName(v, record){
    return record.data.last + ', ' + record.data.first;
}

function location(v, record){
    return !record.data.city ? '' : (record.data.city + ', ' + record.data.state);
}

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Dude', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        {name: 'fullname',  convert: fullName},
        {name: 'firstname', mapping: 'name.first'},
        {name: 'lastname',  mapping: 'name.last'},
        {name: 'city', defaultValue: 'homeless'},
        'state',
        {name: 'location',  convert: location}
    ]
});

// create the data store
var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    reader: {
        type: 'json',
        model: 'Dude',
        idProperty: 'key',
        root: 'daRoot',
        totalProperty: 'total'
    }
});

var myData = [
    { key: 1,
      name: { first: 'Fat',    last:  'Albert' }
      // notice no city, state provided in data object
    },
    { key: 2,
      name: { first: 'Barney', last:  'Rubble' },
      city: 'Bedrock', state: 'Stoneridge'
    },
    { key: 3,
      name: { first: 'Cliff',  last:  'Claven' },
      city: 'Boston',  state: 'MA'
    }
];
</code></pre> %}
    *)
  method dateFormat : Js.js_string Js.t Js.prop
  (** {% <p>Used when converting received data into a Date when the <a href="#!/api/Ext.data.Field-cfg-type" rel="Ext.data.Field-cfg-type" class="docClass">type</a> is specified as <code>"date"</code>.</p>

<p>The format dtring is also used when serializing Date fields for use by <a href="#!/api/Ext.data.writer.Writer" rel="Ext.data.writer.Writer" class="docClass">Writers</a>.</p>

<p>A format string for the <a href="#!/api/Ext.Date-method-parse" rel="Ext.Date-method-parse" class="docClass">Ext.Date.parse</a> function, or "timestamp" if the value provided by
the Reader is a UNIX timestamp, or "time" if the value provided by the Reader is a javascript millisecond
timestamp. See <a href="#!/api/Ext.Date" rel="Ext.Date" class="docClass">Ext.Date</a>.</p> %}
    *)
  method defaultValue : 'a Js.t Js.prop
  (** {% <p>The default value used when the creating an instance from a raw data object, and the property referenced by the
<code><a href="#!/api/Ext.data.Field-cfg-mapping" rel="Ext.data.Field-cfg-mapping" class="docClass">mapping</a></code> does not exist in that data object.</p>

<p>May be specified as <code>undefined</code> to prevent defaulting in a value.</p> %}
    
    Defaults to: [""]
    *)
  method mapping : 'a Js.t Js.prop
  (** {% <p>(Optional) A path expression for use by the <a href="#!/api/Ext.data.reader.Reader" rel="Ext.data.reader.Reader" class="docClass">Ext.data.reader.Reader</a> implementation that is creating the
<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Model</a> to extract the Field value from the data object. If the path expression is the same
as the field name, the mapping may be omitted.</p>

<p>The form of the mapping expression depends on the Reader being used.</p>

<ul>
<li><p><a href="#!/api/Ext.data.reader.Json" rel="Ext.data.reader.Json" class="docClass">Ext.data.reader.Json</a></p>

<p>The mapping is a string containing the javascript expression to reference the data from an element of the data
item's <a href="#!/api/Ext.data.reader.Json-cfg-root" rel="Ext.data.reader.Json-cfg-root" class="docClass">root</a> Array. Defaults to the field name.</p></li>
<li><p><a href="#!/api/Ext.data.reader.Xml" rel="Ext.data.reader.Xml" class="docClass">Ext.data.reader.Xml</a></p>

<p>The mapping is an <a href="#!/api/Ext.dom.Query" rel="Ext.dom.Query" class="docClass">Ext.DomQuery</a> path to the data item relative to the DOM element that represents the
<a href="#!/api/Ext.data.reader.Xml-cfg-record" rel="Ext.data.reader.Xml-cfg-record" class="docClass">record</a>. Defaults to the field name.</p></li>
<li><p><a href="#!/api/Ext.data.reader.Array" rel="Ext.data.reader.Array" class="docClass">Ext.data.reader.Array</a></p>

<p>The mapping is a number indicating the Array index of the field's value. Defaults to the field specification's
Array position.</p></li>
</ul>


<p>If a more complex value extraction strategy is required, then configure the Field with a <a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">convert</a>
function. This is passed the whole row object, and may interrogate it in whatever way is necessary in order to
return the desired data.</p> %}
    *)
  method name : Js.js_string Js.t Js.prop
  (** {% <p>The name by which the field is referenced within the Model. This is referenced by, for example, the <code>dataIndex</code>
property in column definition objects passed to <a href="#!/api/Ext.grid.property.HeaderContainer" rel="Ext.grid.property.HeaderContainer" class="docClass">Ext.grid.property.HeaderContainer</a>.</p>

<p>Note: In the simplest case, if no properties other than <code>name</code> are required, a field definition may consist of
just a String for the field name.</p> %}
    *)
  method persist : bool Js.t Js.prop
  (** {% <p>False to exclude this field from the <a href="#!/api/Ext.data.Model-property-modified" rel="Ext.data.Model-property-modified" class="docClass">Ext.data.Model.modified</a> fields in a model. This will also exclude
the field from being written using a <a href="#!/api/Ext.data.writer.Writer" rel="Ext.data.writer.Writer" class="docClass">Ext.data.writer.Writer</a>. This option is useful when model fields are
used to keep state on the client but do not need to be persisted to the server. Defaults to true.</p> %}
    
    Defaults to: [true]
    *)
  method serialize : 'a Js.callback Js.prop
  (** {% <p>A function which converts the Model's value for this Field into a form which can be used by whatever <a href="#!/api/Ext.data.writer.Writer" rel="Ext.data.writer.Writer" class="docClass">Writer</a>
is being used to sync data with the server.</p>

<p>The function should return a string which represents the Field's value.</p>

<p>It is passed the following parameters:</p>

<ul>
<li><p><strong>v</strong> : Mixed</p>

<p>The Field's value - the value to be serialized.</p></li>
<li><p><strong>rec</strong> : <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a></p>

<p>The record being serialized.</p></li>
</ul> %}
    *)
  method sortDir : Js.js_string Js.t Js.prop
  (** {% <p>Initial direction to sort (<code>"ASC"</code> or <code>"DESC"</code>). Defaults to <code>"ASC"</code>.</p> %}
    
    Defaults to: ["ASC"]
    *)
  method sortType : 'a Js.callback Js.prop
  (** {% <p>A function which converts a Field's value to a comparable value in order to ensure correct sort ordering.
Predefined functions are provided in <a href="#!/api/Ext.data.SortTypes" rel="Ext.data.SortTypes" class="docClass">Ext.data.SortTypes</a>. A custom sort example:</p>

<pre><code>// current sort     after sort we want
// +-+------+          +-+------+
// |1|First |          |1|First |
// |2|Last  |          |3|Second|
// |3|Second|          |2|Last  |
// +-+------+          +-+------+

sortType: function(value) {
   switch (value.toLowerCase()) // native toLowerCase():
   {
      case 'first': return 1;
      case 'second': return 2;
      default: return 3;
   }
}
</code></pre> %}
    *)
  method type_ : 'a Js.t Js.prop
  (** {% <p>The data type for automatic conversion from received data to the <em>stored</em> value if
<code><a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">convert</a></code> has not been specified. This may be specified as a string value.
Possible values are</p>

<ul>
<li>auto (Default, implies no conversion)</li>
<li>string</li>
<li>int</li>
<li>float</li>
<li>boolean</li>
<li>date</li>
</ul>


<p>This may also be specified by referencing a member of the <a href="#!/api/Ext.data.Types" rel="Ext.data.Types" class="docClass">Ext.data.Types</a> class.</p>

<p>Developers may create their own application-specific data types by defining new members of the <a href="#!/api/Ext.data.Types" rel="Ext.data.Types" class="docClass">Ext.data.Types</a> class.</p> %}
    *)
  method useNull : bool Js.t Js.prop
  (** {% <p>Use when converting received data into a INT, FLOAT, BOOL or STRING type. If the value cannot be
parsed, <code>null</code> will be used if useNull is true, otherwise a default value for that type will be used:</p>

<ul>
<li>for INT and FLOAT - <code>0</code>.</li>
<li>for STRING - <code>""</code>.</li>
<li>for BOOL - <code>false</code>.</li>
</ul>


<p>Note that when parsing of DATE type fails, the value will be <code>null</code> regardless of this setting.</p> %}
    
    Defaults to: [false]
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

