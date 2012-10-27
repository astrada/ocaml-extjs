(** A Model represents some object that your applicati ...
  
  {% <p>A Model represents some object that your application manages. For example, one might define a Model for Users,
Products, Cars, or any other real-world object that we want to model in the system. Models are registered via the
<a href="#!/api/Ext.ModelManager" rel="Ext.ModelManager" class="docClass">model manager</a>, and are used by <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">stores</a>, which are in turn used by many
of the data-bound components in Ext.</p>

<p>Models are defined as a set of fields and any arbitrary methods and properties relevant to the model. For example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        {name: 'name',  type: 'string'},
        {name: 'age',   type: 'int', convert: null},
        {name: 'phone', type: 'string'},
        {name: 'alive', type: 'boolean', defaultValue: true, convert: null}
    ],

    changeName: function() {
        var oldName = this.get('name'),
            newName = oldName + " The Barbarian";

        this.set('name', newName);
    }
});
</code></pre>

<p>The fields array is turned into a <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">MixedCollection</a> automatically by the <a href="#!/api/Ext.ModelManager" rel="Ext.ModelManager" class="docClass">ModelManager</a>, and all other functions and properties are copied to the new Model's prototype.</p>

<p>By default, the built in numeric and boolean field types have a (\@link <a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">Ext.data.Field.convert</a>} function which coerces string
values in raw data into the field's type. For better performance with <a href="#!/api/Ext.data.reader.Json" rel="Ext.data.reader.Json" class="docClass">Json</a> or <a href="#!/api/Ext.data.reader.Array" rel="Ext.data.reader.Array" class="docClass">Array</a>
readers <em>if you are in control of the data fed into this Model</em>, you can null out the default convert function which will cause
the raw property to be copied directly into the Field's value.</p>

<p>Now we can create instances of our User model and call any model logic we defined:</p>

<pre><code>var user = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('User', {
    name : 'Conan',
    age  : 24,
    phone: '555-555-5555'
});

user.changeName();
user.get('name'); //returns "Conan The Barbarian"
</code></pre>

<h1>Validations</h1>

<p>Models have built-in support for validations, which are executed against the validator functions in <a href="#!/api/Ext.data.validations" rel="Ext.data.validations" class="docClass">Ext.data.validations</a> (<a href="#!/api/Ext.data.validations" rel="Ext.data.validations" class="docClass">see all validation functions</a>). Validations are easy to add to
models:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        {name: 'name',     type: 'string'},
        {name: 'age',      type: 'int'},
        {name: 'phone',    type: 'string'},
        {name: 'gender',   type: 'string'},
        {name: 'username', type: 'string'},
        {name: 'alive',    type: 'boolean', defaultValue: true}
    ],

    validations: [
        {type: 'presence',  field: 'age'},
        {type: 'length',    field: 'name',     min: 2},
        {type: 'inclusion', field: 'gender',   list: ['Male', 'Female']},
        {type: 'exclusion', field: 'username', list: ['Admin', 'Operator']},
        {type: 'format',    field: 'username', matcher: /([a-z]+)[0-9]{2,3}/}
    ]
});
</code></pre>

<p>The validations can be run by simply calling the <a href="#!/api/Ext.data.Model-method-validate" rel="Ext.data.Model-method-validate" class="docClass">validate</a> function, which returns a <a href="#!/api/Ext.data.Errors" rel="Ext.data.Errors" class="docClass">Ext.data.Errors</a>
object:</p>

<pre><code>var instance = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('User', {
    name: 'Ed',
    gender: 'Male',
    username: 'edspencer'
});

var errors = instance.validate();
</code></pre>

<h1>Associations</h1>

<p>Models can have associations with other Models via <a href="#!/api/Ext.data.association.HasOne" rel="Ext.data.association.HasOne" class="docClass">Ext.data.association.HasOne</a>,
<a href="#!/api/Ext.data.association.BelongsTo" rel="Ext.data.association.BelongsTo" class="docClass">belongsTo</a> and <a href="#!/api/Ext.data.association.HasMany" rel="Ext.data.association.HasMany" class="docClass">hasMany</a> associations.
For example, let's say we're writing a blog administration application which deals with Users, Posts and Comments.
We can express the relationships between these models like this:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Post', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['id', 'user_id'],

    belongsTo: 'User',
    hasMany  : {model: 'Comment', name: 'comments'}
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Comment', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['id', 'user_id', 'post_id'],

    belongsTo: 'Post'
});

<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['id'],

    hasMany: [
        'Post',
        {model: 'Comment', name: 'comments'}
    ]
});
</code></pre>

<p>See the docs for <a href="#!/api/Ext.data.association.HasOne" rel="Ext.data.association.HasOne" class="docClass">Ext.data.association.HasOne</a>, <a href="#!/api/Ext.data.association.BelongsTo" rel="Ext.data.association.BelongsTo" class="docClass">Ext.data.association.BelongsTo</a> and
<a href="#!/api/Ext.data.association.HasMany" rel="Ext.data.association.HasMany" class="docClass">Ext.data.association.HasMany</a> for details on the usage and configuration of associations.
Note that associations can also be specified like this:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['id'],

    associations: [
        {type: 'hasMany', model: 'Post',    name: 'posts'},
        {type: 'hasMany', model: 'Comment', name: 'comments'}
    ]
});
</code></pre>

<h1>Using a Proxy</h1>

<p>Models are great for representing types of data and relationships, but sooner or later we're going to want to load or
save that data somewhere. All loading and saving of data is handled via a <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Proxy</a>, which
can be set directly on the Model:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['id', 'name', 'email'],

    proxy: {
        type: 'rest',
        url : '/users'
    }
});
</code></pre>

<p>Here we've set up a <a href="#!/api/Ext.data.proxy.Rest" rel="Ext.data.proxy.Rest" class="docClass">Rest Proxy</a>, which knows how to load and save data to and from a
RESTful backend. Let's see how this works:</p>

<pre><code>var user = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('User', {name: 'Ed Spencer', email: 'ed\@sencha.com'});

user.save(); //POST /users
</code></pre>

<p>Calling <a href="#!/api/Ext.data.Model-method-save" rel="Ext.data.Model-method-save" class="docClass">save</a> on the new Model instance tells the configured RestProxy that we wish to persist this Model's
data onto our server. RestProxy figures out that this Model hasn't been saved before because it doesn't have an id,
and performs the appropriate action - in this case issuing a POST request to the url we configured (/users). We
configure any Proxy on any Model and always follow this API - see <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">Ext.data.proxy.Proxy</a> for a full list.</p>

<p>Loading data via the Proxy is equally easy:</p>

<pre><code>//get a reference to the User model class
var User = <a href="#!/api/Ext.ModelManager-method-getModel" rel="Ext.ModelManager-method-getModel" class="docClass">Ext.ModelManager.getModel</a>('User');

//Uses the configured RestProxy to make a GET request to /users/123
User.load(123, {
    success: function(user) {
        console.log(user.getId()); //logs 123
    }
});
</code></pre>

<p>Models can also be updated and destroyed easily:</p>

<pre><code>//the user Model we loaded in the last snippet:
user.set('name', 'Edward Spencer');

//tells the Proxy to save the Model. In this case it will perform a PUT request to /users/123 as this Model already has an id
user.save({
    success: function() {
        console.log('The User was updated');
    }
});

//tells the Proxy to destroy the Model. Performs a DELETE request to /users/123
user.destroy({
    success: function() {
        console.log('The User was destroyed!');
    }
});
</code></pre>

<h1>Usage in Stores</h1>

<p>It is very common to want to load a set of Model instances to be displayed and manipulated in the UI. We do this by
creating a <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a>:</p>

<pre><code>var store = <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', {
    model: 'User'
});

//uses the Proxy we set up on Model to load the Store data
store.load();
</code></pre>

<p>A Store is just a collection of Model instances - usually loaded from a server somewhere. Store can also maintain a
set of added, updated and removed Model instances to be synchronized with the server via the Proxy. See the <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store docs</a> for more information on Stores.</p> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method dirty : bool Js.t Js.readonly_prop
  (** {% <p>True if this Record has been modified.</p> %}
    
    Defaults to: [false]
    *)
  method editing : bool Js.t Js.readonly_prop
  (** {% <p>Internal flag used to track whether or not the model instance is currently being edited.</p> %}
    
    Defaults to: [false]
    *)
  method fields : Ext_util_MixedCollection.t Js.t Js.prop
  (** {% <p>A <a href="#!/api/Ext.util.MixedCollection" rel="Ext.util.MixedCollection" class="docClass">Collection</a> of the fields defined for this Model (including fields defined in superclasses)</p>

<p>This is a collection of <a href="#!/api/Ext.data.Field" rel="Ext.data.Field" class="docClass">Ext.data.Field</a> instances, each of which encapsulates information that the field was configured with.
By default, you can specify a field as simply a String, representing the <em>name</em> of the field, but a Field encapsulates
<a href="#!/api/Ext.data.Field-cfg-type" rel="Ext.data.Field-cfg-type" class="docClass">data type</a>, <a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">custom conversion</a> of raw data, and a <a href="#!/api/Ext.data.Field-cfg-mapping" rel="Ext.data.Field-cfg-mapping" class="docClass">mapping</a>
property to specify by name of index, how to extract a field's value from a raw data object.</p> %}
    *)
  method isModel : bool Js.t Js.prop
  (** {% <p><code>true</code> in this class to identify an object as an instantiated Model, or subclass thereof.</p> %}
    
    Defaults to: [true]
    *)
  method modified : _ Js.t Js.prop
  (** {% <p>Key: value pairs of all fields whose values have changed</p> %}
    *)
  method phantom : bool Js.t Js.prop
  (** {% <p>True when the record does not yet exist in a server-side database (see <a href="#!/api/Ext.data.Model-method-setDirty" rel="Ext.data.Model-method-setDirty" class="docClass">setDirty</a>).
Any record which has a real database pk set as its id property is NOT a phantom -- it's real.</p> %}
    
    Defaults to: [false]
    *)
  method raw : _ Js.t Js.prop
  (** {% <p>The raw data used to create this model if created via a reader.</p> %}
    *)
  method store : _ Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Store</a> to which this instance belongs. NOTE: If this
instance is bound to multiple stores, this property will reference only the
first. To examine all the stores, use the <a href="#!/api/Ext.data.Model-property-stores" rel="Ext.data.Model-property-stores" class="docClass">stores</a> property instead.</p> %}
    *)
  method stores : _ Js.js_array Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Stores</a> to which this instance is bound.</p> %}
    *)
  method beginEdit : unit Js.meth
  (** {% <p>Begins an edit. While in edit mode, no events (e.g.. the <code>update</code> event) are relayed to the containing store.
When an edit has begun, it must be followed by either <a href="#!/api/Ext.data.Model-method-endEdit" rel="Ext.data.Model-method-endEdit" class="docClass">endEdit</a> or <a href="#!/api/Ext.data.Model-method-cancelEdit" rel="Ext.data.Model-method-cancelEdit" class="docClass">cancelEdit</a>.</p> %}
    *)
  method cancelEdit : unit Js.meth
  (** {% <p>Cancels all changes made in the current edit operation.</p> %}
    *)
  method commit : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Usually called by the <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> which owns the model instance. Commits all changes made to the
instance since either creation or the last commit operation.</p>

<p>Developers should subscribe to the <a href="#!/api/Ext.data.Store-event-update" rel="Ext.data.Store-event-update" class="docClass">Ext.data.Store.update</a> event to have their code notified of commit
operations.</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>True to skip notification of the owning store of the change.
Defaults to false.</p> %}
    }
    }
    *)
  method copy : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  (** {% <p>Creates a copy (clone) of this Model instance.</p> %}
    
    {b Parameters}:
    {ul {- id: [Js.js_string Js.t] (optional)
    {% <p>A new id, defaults to the id of the instance being copied.
See <code><a href="#!/api/Ext.data.Model-static-method-id" rel="Ext.data.Model-static-method-id" class="docClass">id</a></code>. To generate a phantom instance with a new id use:</p>

<pre><code>var rec = record.copy(); // clone the record
<a href="#!/api/Ext.data.Model-static-method-id" rel="Ext.data.Model-static-method-id" class="docClass">Ext.data.Model.id</a>(rec); // automatically generate a unique sequential id
</code></pre> %}
    }
    }
    *)
  method destroy : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Destroys the model using the configured proxy.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>Options to pass to the proxy. Config object for <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t] {% <p>The Model instance</p> %}
    }
    }
    *)
  method endEdit : bool Js.t -> Js.js_string Js.t Js.js_array Js.t -> unit
    Js.meth
  (** {% <p>Ends an edit. If any data was modified, the containing store is notified (ie, the store's <code>update</code> event will
fire).</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t]
    {% <p>True to not notify the store of the change</p> %}
    }
    {- modifiedFieldNames: [Js.js_string Js.t Js.js_array Js.t]
    {% <p>Array of field names changed during edit.</p> %}
    }
    }
    *)
  method get : Js.js_string Js.t -> _ Js.t Js.meth
  (** {% <p>Returns the value of the given field</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [Js.js_string Js.t]
    {% <p>The field to fetch the value for</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The value</p> %}
    }
    }
    *)
  method getAssociatedData : _ Js.t Js.meth
  (** {% <p>Gets all of the data from this Models <em>loaded</em> associations. It does this recursively - for example if we have a
User which hasMany Orders, and each Order hasMany OrderItems, it will return an object like this:</p>

<pre><code>{
    orders: [
        {
            id: 123,
            status: 'shipped',
            orderItems: [
                ...
            ]
        }
    ]
}
</code></pre> %}
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>The nested data set for the Model's loaded associations</p> %}
    }
    }
    *)
  method getChanges : _ Js.t Js.meth
  (** {% <p>Gets a hash of only the fields that have been modified since this Model was created or commited.</p> %}
    *)
  method getData : bool Js.t -> _ Js.t Js.meth
  (** {% <p>Gets all values for each field in this model and returns an object
containing the current data.</p> %}
    
    {b Parameters}:
    {ul {- includeAssociated: [bool Js.t]
    {% <p>True to also include associated data. Defaults to false.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object hash containing all the values in this model</p> %}
    }
    }
    *)
  method getId : _ Js.t Js.meth
  (** {% <p>Returns the unique ID allocated to this model instance as defined by <a href="#!/api/Ext.data.Model-cfg-idProperty" rel="Ext.data.Model-cfg-idProperty" class="docClass">idProperty</a>.</p> %}
    
    {b Returns}:
    {ul {- [_ Js.t] {% <p>The id</p> %}
    }
    }
    *)
  method getProxy : _ Js.t Js.meth
  (** {% <p>Returns the configured Proxy for this Model.</p> %}
    
    {b Returns}:
    {ul {- [#Ext_data_proxy_Proxy.t Js.t] {% <p>The proxy</p> %}
    }
    }
    *)
  method isModified : Js.js_string Js.t -> bool Js.t Js.meth
  (** {% <p>Returns true if the passed field name has been <code><a href="#!/api/Ext.data.Model-property-modified" rel="Ext.data.Model-property-modified" class="docClass">modified</a></code> since the load or last commit.</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [Js.js_string Js.t]
    {% <p><a href="#!/api/Ext.data.Field-cfg-name" rel="Ext.data.Field-cfg-name" class="docClass">Ext.data.Field.name</a></p> %}
    }
    }
    *)
  method isValid : bool Js.t Js.meth
  (** {% <p>Checks if the model is valid. See <a href="#!/api/Ext.data.Model-method-validate" rel="Ext.data.Model-method-validate" class="docClass">validate</a>.</p> %}
    
    {b Returns}:
    {ul {- [bool Js.t] {% <p>True if the model is valid.</p> %}
    }
    }
    *)
  method join : _ Js.t -> unit Js.meth
  (** {% <p>Tells this model instance that it has been added to a store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store to which this model has been added.</p> %}
    }
    }
    *)
  method reject : bool Js.t Js.optdef -> unit Js.meth
  (** {% <p>Usually called by the <a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a> to which this model instance has been <a href="#!/api/Ext.data.Model-method-join" rel="Ext.data.Model-method-join" class="docClass">joined</a>. Rejects
all changes made to the model instance since either creation, or the last commit operation. Modified fields are
reverted to their original values.</p>

<p>Developers should subscribe to the <a href="#!/api/Ext.data.Store-event-update" rel="Ext.data.Store-event-update" class="docClass">Ext.data.Store.update</a> event to have their code notified of reject
operations.</p> %}
    
    {b Parameters}:
    {ul {- silent: [bool Js.t] (optional)
    {% <p>True to skip notification of the owning store of the change.
Defaults to false.</p> %}
    }
    }
    *)
  method save : _ Js.t -> 'self Js.t Js.meth
  (** {% <p>Saves the model instance using the configured proxy.</p> %}
    
    {b Parameters}:
    {ul {- options: [_ Js.t]
    {% <p>Options to pass to the proxy. Config object for <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Ext.data.Operation</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Ext_data_Model.t Js.t] {% <p>The Model instance</p> %}
    }
    }
    *)
  method set : _ Js.t -> _ Js.t -> Js.js_string Js.t Js.js_array Js.t Js.meth
  (** {% <p>Sets the given field to the given value, marks the instance as dirty</p> %}
    
    {b Parameters}:
    {ul {- fieldName: [_ Js.t]
    {% <p>The field to set, or an object containing key/value pairs</p> %}
    }
    {- newValue: [_ Js.t]
    {% <p>The value to set</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t Js.js_array Js.t]
    {% <p>The array of modified field names or null if nothing was modified.</p> %}
    }
    }
    *)
  method setDirty : unit Js.meth
  (** {% <p>Marks this <strong>Record</strong> as <code><a href="#!/api/Ext.data.Model-property-dirty" rel="Ext.data.Model-property-dirty" class="docClass">dirty</a></code>. This method is used interally when adding <code><a href="#!/api/Ext.data.Model-property-phantom" rel="Ext.data.Model-property-phantom" class="docClass">phantom</a></code> records
to a <a href="#!/api/Ext.data.proxy.Server-cfg-writer" rel="Ext.data.proxy.Server-cfg-writer" class="docClass">writer enabled store</a>.</p>

<p>Marking a record <code><a href="#!/api/Ext.data.Model-property-dirty" rel="Ext.data.Model-property-dirty" class="docClass">dirty</a></code> causes the phantom to be returned by <a href="#!/api/Ext.data.Store-method-getUpdatedRecords" rel="Ext.data.Store-method-getUpdatedRecords" class="docClass">Ext.data.Store.getUpdatedRecords</a>
where it will have a create action composed for it during <a href="#!/api/Ext.data.Model-method-save" rel="Ext.data.Model-method-save" class="docClass">model save</a> operations.</p> %}
    *)
  method setId : _ Js.t -> unit Js.meth
  (** {% <p>Sets the model instance's id field to the given id.</p> %}
    
    {b Parameters}:
    {ul {- id: [_ Js.t] {% <p>The new id</p> %}
    }
    }
    *)
  method setProxy : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Sets the Proxy to use for this model. Accepts any options that can be accepted by
<a href="#!/api/Ext-method-createByAlias" rel="Ext-method-createByAlias" class="docClass">Ext.createByAlias</a>.</p> %}
    
    {b Parameters}:
    {ul {- proxy: [_ Js.t] {% <p>The proxy</p> %}
    }
    }
    *)
  method unjoin : _ Js.t -> unit Js.meth
  (** {% <p>Tells this model instance that it has been removed from the store.</p> %}
    
    {b Parameters}:
    {ul {- store: [Ext_data_Store.t Js.t]
    {% <p>The store from which this model has been removed.</p> %}
    }
    }
    *)
  method validate : Ext_data_Errors.t Js.t Js.meth
  (** {% <p>Validates the current data against all of its configured <a href="#!/api/Ext.data.Model-cfg-validations" rel="Ext.data.Model-cfg-validations" class="docClass">validations</a>.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Errors.t Js.t] {% <p>The errors object</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method associations : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array of <a href="#!/api/Ext.data.association.Association" rel="Ext.data.association.Association" class="docClass">associations</a> for this model.</p> %}
    *)
  method belongsTo : _ Js.t Js.prop
  (** {% <p>One or more <a href="#!/api/Ext.data.association.BelongsTo" rel="Ext.data.association.BelongsTo" class="docClass">BelongsTo associations</a> for this model.</p> %}
    *)
  method clientIdProperty : Js.js_string Js.t Js.prop
  (** {% <p>The name of a property that is used for submitting this Model's unique client-side identifier
to the server when multiple phantom records are saved as part of the same <a href="#!/api/Ext.data.Operation" rel="Ext.data.Operation" class="docClass">Operation</a>.
In such a case, the server response should include the client id for each record
so that the server response data can be used to update the client-side records if necessary.
This property cannot have the same name as any of this Model's fields.</p> %}
    *)
  method defaultProxyType : Js.js_string Js.t Js.prop
  (** {% <p>The string type of the default Model Proxy. Defaults to 'ajax'.</p> %}
    
    Defaults to: ['ajax']
    *)
  method fields : _ Js.t Js.prop
  (** {% <p>The fields for this model. This is an Array of <strong><a href="#!/api/Ext.data.Field" rel="Ext.data.Field" class="docClass">Field</a></strong> definition objects. A Field
definition may simply be the <em>name</em> of the Field, but a Field encapsulates <a href="#!/api/Ext.data.Field-cfg-type" rel="Ext.data.Field-cfg-type" class="docClass">data type</a>,
<a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">custom conversion</a> of raw data, and a <a href="#!/api/Ext.data.Field-cfg-mapping" rel="Ext.data.Field-cfg-mapping" class="docClass">mapping</a>
property to specify by name of index, how to extract a field's value from a raw data object, so it is best practice
to specify a full set of <a href="#!/api/Ext.data.Field" rel="Ext.data.Field" class="docClass">Field</a> config objects.</p> %}
    *)
  method hasMany : _ Js.t Js.prop
  (** {% <p>One or more <a href="#!/api/Ext.data.association.HasMany" rel="Ext.data.association.HasMany" class="docClass">HasMany associations</a> for this model.</p> %}
    *)
  method idProperty : Js.js_string Js.t Js.prop
  (** {% <p>The name of the field treated as this Model's unique id. Defaults to 'id'.</p> %}
    
    Defaults to: ['id']
    *)
  method idgen : _ Js.t Js.prop
  (** {% <p>The id generator to use for this model. The default id generator does not generate
values for the <a href="#!/api/Ext.data.Model-cfg-idProperty" rel="Ext.data.Model-cfg-idProperty" class="docClass">idProperty</a>.</p>

<p>This can be overridden at the model level to provide a custom generator for a model.
The simplest form of this would be:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.data.MyModel', {
     extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
     requires: ['<a href="#!/api/Ext.data.SequentialIdGenerator" rel="Ext.data.SequentialIdGenerator" class="docClass">Ext.data.SequentialIdGenerator</a>'],
     idgen: 'sequential',
     ...
 });
</code></pre>

<p>The above would generate <a href="#!/api/Ext.data.SequentialIdGenerator" rel="Ext.data.SequentialIdGenerator" class="docClass">sequential</a> id's such
as 1, 2, 3 etc..</p>

<p>Another useful id generator is <a href="#!/api/Ext.data.UuidGenerator" rel="Ext.data.UuidGenerator" class="docClass">Ext.data.UuidGenerator</a>:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.data.MyModel', {
     extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
     requires: ['<a href="#!/api/Ext.data.UuidGenerator" rel="Ext.data.UuidGenerator" class="docClass">Ext.data.UuidGenerator</a>'],
     idgen: 'uuid',
     ...
 });
</code></pre>

<p>An id generation can also be further configured:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.data.MyModel', {
     extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
     idgen: {
         type: 'sequential',
         seed: 1000,
         prefix: 'ID_'
     }
 });
</code></pre>

<p>The above would generate id's such as ID_1000, ID_1001, ID_1002 etc..</p>

<p>If multiple models share an id space, a single generator can be shared:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.data.MyModelX', {
     extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
     idgen: {
         type: 'sequential',
         id: 'xy'
     }
 });

 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.data.MyModelY', {
     extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
     idgen: {
         type: 'sequential',
         id: 'xy'
     }
 });
</code></pre>

<p>For more complex, shared id generators, a custom generator is the best approach.
See <a href="#!/api/Ext.data.IdGenerator" rel="Ext.data.IdGenerator" class="docClass">Ext.data.IdGenerator</a> for details on creating custom id generators.</p> %}
    *)
  method persistenceProperty : Js.js_string Js.t Js.prop
  (** {% <p>The name of the property on this Persistable object that its data is saved to. Defaults to 'data'
(i.e: all persistable data resides in <code>this.data</code>.)</p> %}
    
    Defaults to: ['data']
    *)
  method proxy : _ Js.t Js.prop
  (** {% <p>The <a href="#!/api/Ext.data.proxy.Proxy" rel="Ext.data.proxy.Proxy" class="docClass">proxy</a> to use for this model.</p> %}
    *)
  method validations : _ Js.t Js.js_array Js.t Js.prop
  (** {% <p>An array of <a href="#!/api/Ext.data.validations" rel="Ext.data.validations" class="docClass">validations</a> for this model.</p> %}
    *)
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method idchanged : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  (** {% <p>Fired when this model's id changes</p> %}
    
    {b Parameters}:
    {ul {- this: [Ext_data_Model.t Js.t]
    }
    {- oldId: [_ Js.t] {% <p>The old id</p> %}
    }
    {- newId: [_ Js.t] {% <p>The new id</p> %}
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
  
  method _COMMIT : Js.js_string Js.t Js.prop
  (** {% <p>The update operation of type 'commit'. Used by <a href="#!/api/Ext.data.Store-event-update" rel="Ext.data.Store-event-update" class="docClass">Store.update</a> event.</p> %}
    
    Defaults to: ['commit']
    *)
  method _EDIT : Js.js_string Js.t Js.prop
  (** {% <p>The update operation of type 'edit'. Used by <a href="#!/api/Ext.data.Store-event-update" rel="Ext.data.Store-event-update" class="docClass">Store.update</a> event.</p> %}
    
    Defaults to: ['edit']
    *)
  method _REJECT : Js.js_string Js.t Js.prop
  (** {% <p>The update operation of type 'reject'. Used by <a href="#!/api/Ext.data.Store-event-update" rel="Ext.data.Store-event-update" class="docClass">Store.update</a> event.</p> %}
    
    Defaults to: ['reject']
    *)
  method getFields : Ext_data_Field.t Js.js_array Js.t Js.meth
  (** {% <p>Returns an Array of <a href="#!/api/Ext.data.Field" rel="Ext.data.Field" class="docClass">Field</a> definitions which define this Model's structure</p>

<p>Fields are sorted upon Model class definition. Fields with custom <a href="#!/api/Ext.data.Field-cfg-convert" rel="Ext.data.Field-cfg-convert" class="docClass">convert</a> functions
are moved to <em>after</em> fields with no convert functions. This is so that convert functions which rely on existing
field values will be able to read those field values.</p> %}
    
    {b Returns}:
    {ul {- [Ext_data_Field.t Js.js_array Js.t]
    {% <p>The defined Fields for this Model.</p> %}
    }
    }
    *)
  method getProxy : _ Js.t Js.meth
  (** {% <p>Returns the configured Proxy for this Model</p> %}
    
    {b Returns}:
    {ul {- [#Ext_data_proxy_Proxy.t Js.t] {% <p>The proxy</p> %}
    }
    }
    *)
  method id : 'self Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Generates a sequential id. This method is typically called when a record is <a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">create</a>d and <a href="#!/api/Ext.data.Model-method-constructor" rel="Ext.data.Model-method-constructor" class="docClass">no id has been specified</a>. The id will automatically be assigned to the
record. The returned id takes the form: {PREFIX}-{AUTO_ID}.</p>

<ul>
<li><strong>PREFIX</strong> : String - <a href="#!/api/Ext.data.Model-static-property-PREFIX" rel="Ext.data.Model-static-property-PREFIX" class="docClass">Ext.data.Model.PREFIX</a> (defaults to 'ext-record')</li>
<li><strong>AUTO_ID</strong> : String - <a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>.AUTO_ID (defaults to 1 initially)</li>
</ul> %}
    
    {b Parameters}:
    {ul {- _rec: [Ext_data_Model.t Js.t]
    {% <p>The record being created. The record does not exist, it's a <a href="#!/api/Ext.data.Model-property-phantom" rel="Ext.data.Model-property-phantom" class="docClass">phantom</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>auto-generated string id, <code>"ext-record-i++"</code>;</p> %}
    }
    }
    *)
  method load : _ Js.t -> _ Js.t Js.optdef -> unit Js.meth
  (** {% <p>Asynchronously loads a model instance by id. Sample usage:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('MyApp.User', {
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: [
        {name: 'id', type: 'int'},
        {name: 'name', type: 'string'}
    ]
});

MyApp.User.load(10, {
    scope: this,
    failure: function(record, operation) {
        //do something if the load failed
    },
    success: function(record, operation) {
        //do something if the load succeeded
    },
    callback: function(record, operation) {
        //do something whether the load succeeded or failed
    }
});
</code></pre> %}
    
    {b Parameters}:
    {ul {- id: [_ Js.t]
    {% <p>The id of the model to load</p> %}
    }
    {- config: [_ Js.t] (optional)
    {% <p>config object containing success, failure and callback functions, plus
optional scope</p> %}
    }
    }
    *)
  method setFields : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  (** {% <p>Apply a new set of field and/or property definitions to the existing model. This will replace any existing
fields, including fields inherited from superclasses. Mainly for reconfiguring the
model based on changes in meta data (called from Reader's onMetaChange method).</p> %}
    
    {b Parameters}:
    {ul {- fields: [_ Js.t]
    }
    {- idProperty: [_ Js.t]
    }
    {- clientIdProperty: [_ Js.t]
    }
    }
    *)
  method setProxy : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Sets the Proxy to use for this model. Accepts any options that can be accepted by
<a href="#!/api/Ext-method-createByAlias" rel="Ext-method-createByAlias" class="docClass">Ext.createByAlias</a>.</p> %}
    
    {b Parameters}:
    {ul {- proxy: [_ Js.t] {% <p>The proxy</p> %}
    }
    }
    *)
  
end

val static : statics Js.t
(** Static instance. *)

val getFields : unit -> Ext_data_Field.t Js.js_array Js.t
(** See method [statics.getFields] *)

val getProxy : unit -> _ Js.t
(** See method [statics.getProxy] *)

val id : 'self Js.t -> Js.js_string Js.t
(** See method [statics.id] *)

val load : _ Js.t -> _ Js.t Js.optdef -> unit
(** See method [statics.load] *)

val setFields : _ Js.t -> _ Js.t -> _ Js.t -> unit
(** See method [statics.setFields] *)

val setProxy : _ Js.t -> _ Js.t
(** See method [statics.setProxy] *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

