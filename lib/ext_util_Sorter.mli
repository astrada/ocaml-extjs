(** Represents a single sorter that can be applied to ...
  
  {% <p>Represents a single sorter that can be applied to a Store. The sorter is used
to compare two values against each other for the purpose of ordering them. Ordering
is achieved by specifying either:</p>

<ul>
<li><a href="#!/api/Ext.util.Sorter-cfg-property" rel="Ext.util.Sorter-cfg-property" class="docClass">A sorting property</a></li>
<li><a href="#!/api/Ext.util.Sorter-cfg-sorterFn" rel="Ext.util.Sorter-cfg-sorterFn" class="docClass">A sorting function</a></li>
</ul>


<p>As a contrived example, we can specify a custom sorter that sorts by rank:</p>

<pre><code><a href="#!/api/Ext-method-define" rel="Ext-method-define" class="docClass">Ext.define</a>('Person', \{
    extend: '<a href="#!/api/Ext.data.Model" rel="Ext.data.Model" class="docClass">Ext.data.Model</a>',
    fields: ['name', 'rank']
\});

<a href="#!/api/Ext-method-create" rel="Ext-method-create" class="docClass">Ext.create</a>('<a href="#!/api/Ext.data.Store" rel="Ext.data.Store" class="docClass">Ext.data.Store</a>', \{
    model: 'Person',
    proxy: 'memory',
    sorters: [\{
        sorterFn: function(o1, o2)\{
            var getRank = function(o)\{
                var name = o.get('rank');
                if (name === 'first') \{
                    return 1;
                \} else if (name === 'second') \{
                    return 2;
                \} else \{
                    return 3;
                \}
            \},
            rank1 = getRank(o1),
            rank2 = getRank(o2);

            if (rank1 === rank2) \{
                return 0;
            \}

            return rank1 &lt; rank2 ? -1 : 1;
        \}
    \}],
    data: [\{
        name: 'Person1',
        rank: 'second'
    \}, \{
        name: 'Person2',
        rank: 'third'
    \}, \{
        name: 'Person3',
        rank: 'first'
    \}]
\});
</code></pre> %}
  *)

class type t =
object('self)
  inherit Ext_Base.t
  
  method setDirection : Js.js_string Js.t -> unit Js.meth
  (** {% <p>Set the sorting direction for this sorter.</p> %}
    
    {b Parameters}:
    {ul {- direction: [Js.js_string Js.t]
    {% <p>The direction to sort in. Should be either 'ASC' or 'DESC'.</p> %}
    }
    }
    *)
  method toggle : unit Js.meth
  (** {% <p>Toggles the sorting direction for this sorter.</p> %}
    *)
  method updateSortFunction : _ Js.callback Js.optdef -> unit Js.meth
  (** {% <p>Update the sort function for this sorter.</p> %}
    
    {b Parameters}:
    {ul {- fn: [_ Js.callback] (optional)
    {% <p>A new sorter function for this sorter. If not specified it will use the default
sorting function.</p> %}
    }
    }
    *)
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method direction : Js.js_string Js.t Js.prop
  (** {% <p>The direction to sort by.</p> %}
    
    Defaults to: ["ASC"]
    *)
  method property : Js.js_string Js.t Js.prop
  (** {% <p>The property to sort by. Required unless <a href="#!/api/Ext.util.Sorter-cfg-sorterFn" rel="Ext.util.Sorter-cfg-sorterFn" class="docClass">sorterFn</a> is provided. The property is extracted from the object
directly and compared for sorting using the built in comparison operators.</p> %}
    *)
  method root : Js.js_string Js.t Js.prop
  (** {% <p>Optional root property. This is mostly useful when sorting a Store, in which case we set the root to 'data' to
make the filter pull the <a href="#!/api/Ext.util.Sorter-cfg-property" rel="Ext.util.Sorter-cfg-property" class="docClass">property</a> out of the data object of each item</p> %}
    *)
  method sorterFn : _ Js.callback Js.prop
  (** {% <p>A specific sorter function to execute. Can be passed instead of <a href="#!/api/Ext.util.Sorter-cfg-property" rel="Ext.util.Sorter-cfg-property" class="docClass">property</a>. This sorter function allows
for any kind of custom/complex comparisons. The sorterFn receives two arguments, the objects being compared. The
function should return:</p>

<ul>
<li>-1 if o1 is "less than" o2</li>
<li>0 if o1 is "equal" to o2</li>
<li>1 if o1 is "greater than" o2</li>
</ul> %}
    *)
  method transform : _ Js.callback Js.prop
  (** {% <p>A function that will be run on each value before it is compared in the sorter. The function will receive a single
argument, the value.</p> %}
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

