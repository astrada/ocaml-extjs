(** The root of all classes created with Ext.define....
  
  {% <p>The root of all classes created with <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>.</p>

<p><a href="#!/api/Ext.Base" rel="Ext.Base" class="docClass">Ext.Base</a> is the building block of all Ext classes. All classes in Ext inherit from <a href="#!/api/Ext.Base" rel="Ext.Base" class="docClass">Ext.Base</a>.
All prototype and static members of this class are inherited by all other classes.</p>
 %}
  *)

class type t =
object('self)
  
  method self : Ext_Class.t Js.t Js.prop
  (** {% <p>Get the reference to the current class from which this object was instantiated. Unlike <a href="#!/api/Ext.Base-method-statics" rel="Ext.Base-method-statics" class="docClass">statics</a>,
<code>this.self</code> is scope-dependent and it's meant to be used for dynamic inheritance. See <a href="#!/api/Ext.Base-method-statics" rel="Ext.Base-method-statics" class="docClass">statics</a>
for a detailed comparison</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.Cat', {
    statics: {
        speciesName: 'Cat' // My.Cat.speciesName = 'Cat'
    },

    constructor: function() {
        alert(this.self.speciesName); // dependent on 'this'
    },

    clone: function() {
        return new this.self();
    }
});


<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.SnowLeopard', {
    extend: 'My.Cat',
    statics: {
        speciesName: 'Snow Leopard'         // My.SnowLeopard.speciesName = 'Snow Leopard'
    }
});

var cat = new My.Cat();                     // alerts 'Cat'
var snowLeopard = new My.SnowLeopard();     // alerts 'Snow Leopard'

var clone = snowLeopard.clone();
alert(<a href="#!/api/Ext-method-getClassName" rel="Ext-method-getClassName" class="docClass">Ext.getClassName</a>(clone));             // alerts 'My.SnowLeopard'
</code></pre>
 %}
    *)
  method callParent : ('a Js.t -> 'b Js.t) Js.meth
  (** {% <p>Call the "parent" method of the current method. That is the method previously
overridden by derivation or by an override (see <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>).</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.Base', {
     constructor: function (x) {
         this.x = x;
     },

     statics: {
         method: function (x) {
             return x;
         }
     }
 });

 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.Derived', {
     extend: 'My.Base',

     constructor: function () {
         this.callParent([21]);
     }
 });

 var obj = new My.Derived();

 alert(obj.x);  // alerts 21
</code></pre>

<p>This can be used with an override as follows:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.DerivedOverride', {
     override: 'My.Derived',

     constructor: function (x) {
         this.callParent([x*2]); // calls original My.Derived constructor
     }
 });

 var obj = new My.Derived();

 alert(obj.x);  // now alerts 42
</code></pre>

<p>This also works with static methods.</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.Derived2', {
     extend: 'My.Base',

     statics: {
         method: function (x) {
             return this.callParent([x*2]); // calls My.Base.method
         }
     }
 });

 alert(My.Base.method(10);     // alerts 10
 alert(My.Derived2.method(10); // alerts 20
</code></pre>

<p>Lastly, it also works with overridden static methods.</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.Derived2Override', {
     override: 'My.Derived2',

     statics: {
         method: function (x) {
             return this.callParent([x*2]); // calls My.Derived2.method
         }
     }
 });

 alert(My.Derived2.method(10); // now alerts 40
</code></pre>
 %}
    
    {b Parameters}:
    - args: ['a Js.t]
    {% <p>The arguments, either an array or the <code>arguments</code> object
from the current method, for example: <code>this.callParent(arguments)</code></p>
 %}
    
    
    {b Returns}:
    - ['a Js.t]
    {% <p>Returns the result of calling the parent method</p>
 %}
    
    *)
  method callSuper : ('a Js.t -> 'b Js.t) Js.meth
  (** {% <p>This method is used by an override to call the superclass method but bypass any
overridden method. This is often done to "patch" a method that contains a bug
but for whatever reason cannot be fixed directly.</p>

<p>Consider:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.some.Class', {
     method: function () {
         console.log('Good');
     }
 });

 <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Ext.some.DerivedClass', {
     method: function () {
         console.log('Bad');

         // ... logic but with a bug ...

         this.callParent();
     }
 });
</code></pre>

<p>To patch the bug in <code>DerivedClass.method</code>, the typical solution is to create an
override:</p>

<pre><code> <a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('App.paches.DerivedClass', {
     override: 'Ext.some.DerivedClass',

     method: function () {
         console.log('Fixed');

         // ... logic but with bug fixed ...

         this.callSuper();
     }
 });
</code></pre>

<p>The patch method cannot use <code>callParent</code> to call the superclass <code>method</code> since
that would call the overridden method containing the bug. In other words, the
above patch would only produce "Fixed" then "Good" in the console log, whereas,
using <code>callParent</code> would produce "Fixed" then "Bad" then "Good".</p>
 %}
    
    {b Parameters}:
    - args: ['a Js.t]
    {% <p>The arguments, either an array or the <code>arguments</code> object
from the current method, for example: <code>this.callSuper(arguments)</code></p>
 %}
    
    
    {b Returns}:
    - ['a Js.t]
    {% <p>Returns the result of calling the superclass method</p>
 %}
    
    *)
  method getInitialConfig : (Js.js_string Js.t -> 'a Js.t) Js.meth
  (** {% <p>Returns the initial configuration passed to constructor when instantiating
this class.</p>
 %}
    
    {b Parameters}:
    - name: [Js.js_string Js.t]
    {% <p>Name of the config option to return.</p>
 %}
    
    
    {b Returns}:
    - ['a Js.t]
    {% <p>The full config object or a single config value
when <code>name</code> parameter specified.</p>
 %}
    
    *)
  method initConfig : ('a Js.t -> t Js.t) Js.meth
  (** {% <p>Initialize configuration for this class. a typical example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.awesome.Class', {
    // The default config
    config: {
        name: 'Awesome',
        isAwesome: true
    },

    constructor: function(config) {
        this.initConfig(config);
    }
});

var awesome = new My.awesome.Class({
    name: 'Super Awesome'
});

alert(awesome.getName()); // 'Super Awesome'
</code></pre>
 %}
    
    {b Parameters}:
    - config: ['a Js.t] {% 
 %}
    
    
    {b Returns}:
    - [Ext_Base.t Js.t] {% <p>this</p>
 %}
    
    *)
  method statics : Ext_Class.t Js.t Js.meth
  (** {% <p>Get the reference to the class from which this object was instantiated. Note that unlike <a href="#!/api/Ext.Base-property-self" rel="Ext.Base-property-self" class="docClass">self</a>,
<code>this.statics()</code> is scope-independent and it always returns the class from which it was called, regardless of what
<code>this</code> points to during run-time</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.Cat', {
    statics: {
        totalCreated: 0,
        speciesName: 'Cat' // My.Cat.speciesName = 'Cat'
    },

    constructor: function() {
        var statics = this.statics();

        alert(statics.speciesName);     // always equals to 'Cat' no matter what 'this' refers to
                                        // equivalent to: My.Cat.speciesName

        alert(this.self.speciesName);   // dependent on 'this'

        statics.totalCreated++;
    },

    clone: function() {
        var cloned = new this.self;                      // dependent on 'this'

        cloned.groupName = this.statics().speciesName;   // equivalent to: My.Cat.speciesName

        return cloned;
    }
});


<a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.SnowLeopard', {
    extend: 'My.Cat',

    statics: {
        speciesName: 'Snow Leopard'     // My.SnowLeopard.speciesName = 'Snow Leopard'
    },

    constructor: function() {
        this.callParent();
    }
});

var cat = new My.Cat();                 // alerts 'Cat', then alerts 'Cat'

var snowLeopard = new My.SnowLeopard(); // alerts 'Cat', then alerts 'Snow Leopard'

var clone = snowLeopard.clone();
alert(<a href="#!/api/Ext-method-getClassName" rel="Ext-method-getClassName" class="docClass">Ext.getClassName</a>(clone));         // alerts 'My.SnowLeopard'
alert(clone.groupName);                 // alerts 'Cat'

alert(My.Cat.totalCreated);             // alerts 3
</code></pre>
 %}
    *)
  
end

val addMembers : 'a Js.t -> unit
(**
  {% <p>Add methods / properties to the prototype of this class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.awesome.Cat', {
    constructor: function() {
        ...
    }
});

 My.awesome.Cat.addMembers({
     meow: function() {
        alert('Meowww...');
     }
 });

 var kitty = new My.awesome.Cat;
 kitty.meow();
</code></pre>
 %}
  
  {b Parameters}:
  - members: ['a Js.t] {% 
 %}
  
  *)

val addStatics : 'a Js.t -> t Js.t
(**
  {% <p>Add / override static properties of this class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.cool.Class', {
    ...
});

My.cool.Class.addStatics({
    someProperty: 'someValue',      // My.cool.Class.someProperty = 'someValue'
    method1: function() { ... },    // My.cool.Class.method1 = function() { ... };
    method2: function() { ... }     // My.cool.Class.method2 = function() { ... };
});
</code></pre>
 %}
  
  {b Parameters}:
  - members: ['a Js.t] {% 
 %}
  
  
  {b Returns}:
  - [Ext_Base.t Js.t] {% <p>this</p>
 %}
  
  *)

val create : unit -> 'a Js.t
(**
  {% <p>Create a new instance of this Class.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.cool.Class', {
    ...
});

My.cool.Class.create({
    someConfig: true
});
</code></pre>

<p>All parameters are passed to the constructor of the class.</p>
 %}
  
  {b Returns}:
  - ['a Js.t] {% <p>the created instance.</p>
 %}
  
  *)

val createAlias : 'a Js.t -> 'b Js.t -> unit
(**
  {% <p>Create aliases for existing prototype methods. Example:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.cool.Class', {
    method1: function() { ... },
    method2: function() { ... }
});

var test = new My.cool.Class();

My.cool.Class.createAlias({
    method3: 'method1',
    method4: 'method2'
});

test.method3(); // test.method1()

My.cool.Class.createAlias('method5', 'method3');

test.method5(); // test.method3() -&gt; test.method1()
</code></pre>
 %}
  
  {b Parameters}:
  - alias: ['a Js.t]
  {% <p>The new method name, or an object to set multiple aliases. See
<a href="#!/api/Ext.Function-method-flexSetter" rel="Ext.Function-method-flexSetter" class="docClass">flexSetter</a></p>
 %}
  - origin: ['a Js.t] {% <p>The original method name</p>
 %}
  
  *)

val getName : unit -> Js.js_string Js.t
(**
  {% <p>Get the current class' name in string format.</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('My.cool.Class', {
    constructor: function() {
        alert(this.self.getName()); // alerts 'My.cool.Class'
    }
});

My.cool.Class.getName(); // 'My.cool.Class'
</code></pre>
 %}
  
  {b Returns}:
  - [Js.js_string Js.t] {% <p>className</p>
 %}
  
  *)

