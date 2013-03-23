(** This class is a centralized place for formatting f ...
  
  {% <p>This class is a centralized place for formatting functions. It includes
functions to format various different types of data, such as text, dates and numeric values.</p>

<h2>Localization</h2>

<p>This class contains several options for localization. These can be set once the library has loaded,
all calls to the functions from that point will use the locale settings that were specified.</p>

<p>Options include:</p>

<ul>
<li>thousandSeparator</li>
<li>decimalSeparator</li>
<li>currenyPrecision</li>
<li>currencySign</li>
<li>currencyAtEnd</li>
</ul>


<p>This class also uses the default date format defined here: <a href="#!/api/Ext.Date-property-defaultFormat" rel="Ext.Date-property-defaultFormat" class="docClass">Ext.Date.defaultFormat</a>.</p>

<h2>Using with renderers</h2>

<p>There are two helper functions that return a new function that can be used in conjunction with
grid renderers:</p>

<pre><code>columns: [\{
    dataIndex: 'date',
    renderer: <a href="#!/api/Ext.util.Format-method-dateRenderer" rel="Ext.util.Format-method-dateRenderer" class="docClass">Ext.util.Format.dateRenderer</a>('Y-m-d')
\}, \{
    dataIndex: 'time',
    renderer: <a href="#!/api/Ext.util.Format-method-numberRenderer" rel="Ext.util.Format-method-numberRenderer" class="docClass">Ext.util.Format.numberRenderer</a>('0.000')
\}]
</code></pre>

<p>Functions that only take a single argument can also be passed directly:</p>

<pre><code>columns: [\{
    dataIndex: 'cost',
    renderer: <a href="#!/api/Ext.util.Format-method-usMoney" rel="Ext.util.Format-method-usMoney" class="docClass">Ext.util.Format.usMoney</a>
\}, \{
    dataIndex: 'productCode',
    renderer: <a href="#!/api/Ext.util.Format-method-uppercase" rel="Ext.util.Format-method-uppercase" class="docClass">Ext.util.Format.uppercase</a>
\}]
</code></pre>

<h2>Using with XTemplates</h2>

<p>XTemplates can also directly use <a href="#!/api/Ext.util.Format" rel="Ext.util.Format" class="docClass">Ext.util.Format</a> functions:</p>

<pre><code>new <a href="#!/api/Ext.XTemplate" rel="Ext.XTemplate" class="docClass">Ext.XTemplate</a>([
    'Date: \{startDate:date("Y-m-d")\}',
    'Cost: \{cost:usMoney\}'
]);
</code></pre> %}
  *)

class type t =
object('self)
  
  method attributes : _ Js.t -> unit Js.meth
  (** {% <p>Formats an object of name value properties as HTML element attribute values suitable for using when creating textual markup.</p> %}
    
    {b Parameters}:
    {ul {- attributes: [_ Js.t]
    {% <p>An object containing the HTML attributes as properties eg: <code>\{height:40, vAlign:'top'\}</code></p> %}
    }
    }
    *)
  method capitalize : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-capitalize" rel="Ext.String-method-capitalize" class="docClass">Ext.String.capitalize</a>.</p>

<p>Capitalize the given string</p> %}
    
    {b Parameters}:
    {ul {- string: [Js.js_string Js.t]
    }
    }
    *)
  method currency : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> bool Js.t Js.optdef -> Js.js_string Js.t
    Js.meth
  (** {% <p>Format a number as a currency.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The numeric value to format</p> %}
    }
    {- sign: [Js.js_string Js.t] (optional)
    {% <p>The currency sign to use (defaults to <a href="#!/api/Ext.util.Format-property-currencySign" rel="Ext.util.Format-property-currencySign" class="docClass">currencySign</a>)</p> %}
    }
    {- decimals: [Js.number Js.t] (optional)
    {% <p>The number of decimals to use for the currency
(defaults to <a href="#!/api/Ext.util.Format-property-currencyPrecision" rel="Ext.util.Format-property-currencyPrecision" class="docClass">currencyPrecision</a>)</p> %}
    }
    {- _end: [bool Js.t] (optional)
    {% <p>True if the currency sign should be at the end of the string
(defaults to <a href="#!/api/Ext.util.Format-property-currencyAtEnd" rel="Ext.util.Format-property-currencyAtEnd" class="docClass">currencyAtEnd</a>)</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The formatted currency string</p> %}
    }
    }
    *)
  method date : _ Js.t -> Js.js_string Js.t Js.optdef -> Js.js_string Js.t
    Js.meth
  (** {% <p>Formats the passed date using the specified format pattern.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The value to format. If a string is passed, it is converted to a Date
by the Javascript's built-in Date#parse method.</p> %}
    }
    {- format: [Js.js_string Js.t] (optional)
    {% <p>Any valid date format string. Defaults to <a href="#!/api/Ext.Date-property-defaultFormat" rel="Ext.Date-property-defaultFormat" class="docClass">Ext.Date.defaultFormat</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The formatted date string.</p> %}
    }
    }
    *)
  method dateRenderer : Js.js_string Js.t -> _ Js.callback Js.meth
  (** {% <p>Returns a date rendering function that can be reused to apply a date format multiple times efficiently.</p> %}
    
    {b Parameters}:
    {ul {- format: [Js.js_string Js.t]
    {% <p>Any valid date format string. Defaults to <a href="#!/api/Ext.Date-property-defaultFormat" rel="Ext.Date-property-defaultFormat" class="docClass">Ext.Date.defaultFormat</a>.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.callback] {% <p>The date formatting function</p> %}
    }
    }
    *)
  method defaultValue : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  (** {% <p>Checks a reference and converts it to the default value if it's empty.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>Reference to check</p> %}
    }
    {- defaultValue: [Js.js_string Js.t] (optional)
    {% <p>The value to insert of it's undefined.</p> %}
     Defaults to: ""
    }
    }
    *)
  method ellipsis : Js.js_string Js.t -> Js.number Js.t ->
    bool Js.t Js.optdef -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-ellipsis" rel="Ext.String-method-ellipsis" class="docClass">Ext.String.ellipsis</a>.</p>

<p>Truncate a string and add an ellipsis ('...') to the end if it exceeds the specified length.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The string to truncate.</p> %}
    }
    {- length: [Js.number Js.t]
    {% <p>The maximum length to allow before truncating.</p> %}
    }
    {- word: [bool Js.t] (optional)
    {% <p><code>true</code> to try to find a common word break.</p> %}
     Defaults to: false
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The converted text.</p> %}
    }
    }
    *)
  method escapeRegex : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Escapes the passed string for use in a regular expression.</p> %}
    
    {b Parameters}:
    {ul {- str: [Js.js_string Js.t]
    }
    }
    *)
  method fileSize : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Simple format for a file size (xxx bytes, xxx KB, xxx MB).</p> %}
    
    {b Parameters}:
    {ul {- size: [_ Js.t]
    {% <p>The numeric value to format</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The formatted file size</p> %}
    }
    }
    *)
  method format : Js.js_string Js.t -> _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-format" rel="Ext.String-method-format" class="docClass">Ext.String.format</a>.</p>

<p>Allows you to define a tokenized string and pass an arbitrary number of arguments to replace the tokens.  Each
token must be unique, and must increment in the format \{0\}, \{1\}, etc.  Example usage:</p>

<pre><code>var cls = 'my-class',
    text = 'Some text';
var s = <a href="#!/api/Ext.String-method-format" rel="Ext.String-method-format" class="docClass">Ext.String.format</a>('&lt;div class="\{0\}"&gt;\{1\}&lt;/div&gt;', cls, text);
// s now contains the string: '&lt;div class="my-class"&gt;Some text&lt;/div&gt;'
</code></pre> %}
    
    {b Parameters}:
    {ul {- string: [Js.js_string Js.t]
    {% <p>The tokenized string to be formatted.</p> %}
    }
    {- values: [_ Js.t]
    {% <p>The values to replace tokens <code>\{0\}</code>, <code>\{1\}</code>, etc in order.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The formatted string.</p> %}
    }
    }
    *)
  method htmlDecode : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-htmlDecode" rel="Ext.String-method-htmlDecode" class="docClass">Ext.String.htmlDecode</a>.</p>

<p>Convert certain characters (&amp;, &lt;, >, ', and &quot;) from their HTML character equivalents.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The string to decode.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The decoded text.</p> %}
    }
    }
    *)
  method htmlEncode : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-htmlEncode" rel="Ext.String-method-htmlEncode" class="docClass">Ext.String.htmlEncode</a>.</p>

<p>Convert certain characters (&amp;, &lt;, >, ', and &quot;) to their HTML character equivalents for literal display in web pages.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The string to encode.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The encoded text.</p> %}
    }
    }
    *)
  method leftPad : Js.js_string Js.t -> Js.number Js.t ->
    Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-leftPad" rel="Ext.String-method-leftPad" class="docClass">Ext.String.leftPad</a>.</p>

<p>Pads the left side of a string with a specified character.  This is especially useful
for normalizing number and date strings.  Example usage:</p>

<pre><code>var s = <a href="#!/api/Ext.String-method-leftPad" rel="Ext.String-method-leftPad" class="docClass">Ext.String.leftPad</a>('123', 5, '0');
// s now contains the string: '00123'
</code></pre> %}
    
    {b Parameters}:
    {ul {- string: [Js.js_string Js.t]
    {% <p>The original string.</p> %}
    }
    {- size: [Js.number Js.t]
    {% <p>The total length of the output string.</p> %}
    }
    {- character: [Js.js_string Js.t] (optional)
    {% <p>The character with which to pad the original string.</p> %}
     Defaults to: ' '
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The padded string.</p> %}
    }
    }
    *)
  method lowercase : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Converts a string to all lower case letters.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The text to convert</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The converted text</p> %}
    }
    }
    *)
  method math : _ Js.callback Js.meth
  (** {% <p>It does simple math for use in a template, for example:</p>

<pre><code>var tpl = new <a href="#!/api/Ext.Template" rel="Ext.Template" class="docClass">Ext.Template</a>('\{value\} * 10 = \{value:math("* 10")\}');
</code></pre> %}
    
    {b Returns}:
    {ul {- [_ Js.callback]
    {% <p>A function that operates on the passed value.</p> %}
    }
    }
    *)
  method nl2br : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Converts newline characters to the HTML tag <code>&lt;br/&gt;</code></p> %}
    
    {b Parameters}:
    {ul {- v: [Js.js_string Js.t]
    {% <p>The string value to format.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t]
    {% <p>The string with embedded <code>&lt;br/&gt;</code> tags in place of newlines.</p> %}
    }
    }
    *)
  method number : Js.number Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  (** {% <p>Formats the passed number according to the passed format string.</p>

<p>The number of digits after the decimal separator character specifies the number of
decimal places in the resulting string. The <em>local-specific</em> decimal character is
used in the result.</p>

<p>The <em>presence</em> of a thousand separator character in the format string specifies that
the <em>locale-specific</em> thousand separator (if any) is inserted separating thousand groups.</p>

<p>By default, "," is expected as the thousand separator, and "." is expected as the decimal separator.</p>

<h2>New to Ext JS 4</h2>

<p>Locale-specific characters are always used in the formatted output when inserting
thousand and decimal separators.</p>

<p>The format string must specify separator characters according to US/UK conventions ("," as the
thousand separator, and "." as the decimal separator)</p>

<p>To allow specification of format strings according to local conventions for separator characters, add
the string <code>/i</code> to the end of the format string.</p>

<p>examples (123456.789):</p>

<ul>
<li><code>0</code> - (123456) show only digits, no precision</li>
<li><code>0.00</code> - (123456.78) show only digits, 2 precision</li>
<li><code>0.0000</code> - (123456.7890) show only digits, 4 precision</li>
<li><code>0,000</code> - (123,456) show comma and digits, no precision</li>
<li><code>0,000.00</code> - (123,456.78) show comma and digits, 2 precision</li>
<li><code>0,0.00</code> - (123,456.78) shortcut method, show comma and digits, 2 precision</li>
</ul>


<p>To allow specification of the formatting string using UK/US grouping characters (,) and
decimal (.) for international numbers, add /i to the end. For example: 0.000,00/i</p> %}
    
    {b Parameters}:
    {ul {- v: [Js.number Js.t]
    {% <p>The number to format.</p> %}
    }
    {- format: [Js.js_string Js.t]
    {% <p>The way you would like to format this text.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The formatted number.</p> %}
    }
    }
    *)
  method numberRenderer : Js.js_string Js.t -> _ Js.callback Js.meth
  (** {% <p>Returns a number rendering function that can be reused to apply a number format multiple
times efficiently.</p> %}
    
    {b Parameters}:
    {ul {- format: [Js.js_string Js.t]
    {% <p>Any valid number format string for <a href="#!/api/Ext.util.Format-method-number" rel="Ext.util.Format-method-number" class="docClass">number</a></p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.callback] {% <p>The number formatting function</p> %}
    }
    }
    *)
  method parseBox : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Parses a number or string representing margin sizes into an object.
Supports CSS-style margin declarations (e.g. 10, "10", "10 10", "10 10 10" and
"10 10 10 10" are all valid options and would return the same result).</p> %}
    
    {b Parameters}:
    {ul {- v: [_ Js.t]
    {% <p>The encoded margins</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>An object with margin sizes for top, right, bottom and left</p> %}
    }
    }
    *)
  method plural : Js.number Js.t -> Js.js_string Js.t ->
    Js.js_string Js.t Js.optdef -> unit Js.meth
  (** {% <p>Selectively do a plural form of a word based on a numeric value. For example, in a template,
<code>\{commentCount:plural("Comment")\}</code>  would result in <code>"1 Comment"</code> if commentCount was 1 or
would be <code>"x Comments"</code> if the value is 0 or greater than 1.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.number Js.t]
    {% <p>The value to compare against</p> %}
    }
    {- singular: [Js.js_string Js.t]
    {% <p>The singular form of the word</p> %}
    }
    {- plural: [Js.js_string Js.t] (optional)
    {% <p>The plural form of the word (defaults to the singular with an "s")</p> %}
    }
    }
    *)
  method round : _ Js.t -> Js.number Js.t -> Js.number Js.t Js.meth
  (** {% <p>Rounds the passed number to the required decimal precision.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The numeric value to round.</p> %}
    }
    {- precision: [Js.number Js.t]
    {% <p>The number of decimal places to which to round the first parameter's value.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.number Js.t] {% <p>The rounded value.</p> %}
    }
    }
    *)
  method stripScripts : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Strips all script tags.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The text from which to strip script tags</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The stripped text</p> %}
    }
    }
    *)
  method stripTags : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Strips all HTML tags.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The text from which to strip tags</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The stripped text</p> %}
    }
    }
    *)
  method substr : Js.js_string Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.js_string Js.t Js.meth
  (** {% <p>Returns a substring from within an original string.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The original text</p> %}
    }
    {- start: [Js.number Js.t]
    {% <p>The start index of the substring</p> %}
    }
    {- length: [Js.number Js.t]
    {% <p>The length of the substring</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The substring</p> %}
    }
    }
    *)
  method trim : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Alias for <a href="#!/api/Ext.String-method-trim" rel="Ext.String-method-trim" class="docClass">Ext.String.trim</a>.</p>

<p>Trims whitespace from either end of a string, leaving spaces within the string intact.  Example:</p>

<pre><code>var s = '  foo bar  ';
alert('-' + s + '-');                   //alerts "- foo bar -"
alert('-' + <a href="#!/api/Ext.String-method-trim" rel="Ext.String-method-trim" class="docClass">Ext.String.trim</a>(s) + '-');  //alerts "-foo bar-"
</code></pre> %}
    
    {b Parameters}:
    {ul {- string: [Js.js_string Js.t]
    {% <p>The string to trim.</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The trimmed string.</p> %}
    }
    }
    *)
  method undef : _ Js.t -> _ Js.t Js.meth
  (** {% <p>Checks a reference and converts it to empty string if it is undefined.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>Reference to check</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [_ Js.t]
    {% <p>Empty string if converted, otherwise the original value</p> %}
    }
    }
    *)
  method uppercase : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Converts a string to all upper case letters.</p> %}
    
    {b Parameters}:
    {ul {- value: [Js.js_string Js.t]
    {% <p>The text to convert</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The converted text</p> %}
    }
    }
    *)
  method usMoney : _ Js.t -> Js.js_string Js.t Js.meth
  (** {% <p>Format a number as US currency.</p> %}
    
    {b Parameters}:
    {ul {- value: [_ Js.t]
    {% <p>The numeric value to format</p> %}
    }
    }
    
    {b Returns}:
    {ul {- [Js.js_string Js.t] {% <p>The formatted currency string</p> %}
    }
    }
    *)
  method currencyAtEnd : bool Js.t Js.prop
  (** {% <p>This may be set to <code>true</code> to make the <a href="#!/api/Ext.util.Format-method-currency" rel="Ext.util.Format-method-currency" class="docClass">currency</a> function
append the currency sign to the formatted value.</p>

<p>This may be overridden in a locale file.</p> %}
    
    Defaults to: [false]
    *)
  method currencyPrecision : Js.number Js.t Js.prop
  (** {% <p>The number of decimal places that the <a href="#!/api/Ext.util.Format-method-currency" rel="Ext.util.Format-method-currency" class="docClass">currency</a> function displays.</p>

<p>This may be overridden in a locale file.</p> %}
    
    Defaults to: [2]
    *)
  method currencySign : Js.js_string Js.t Js.prop
  (** {% <p>The currency sign that the <a href="#!/api/Ext.util.Format-method-currency" rel="Ext.util.Format-method-currency" class="docClass">currency</a> function displays.</p>

<p>This may be overridden in a locale file.</p> %}
    
    Defaults to: ['$']
    *)
  method decimalSeparator : Js.js_string Js.t Js.prop
  (** {% <p>The character that the <a href="#!/api/Ext.util.Format-method-number" rel="Ext.util.Format-method-number" class="docClass">number</a> function uses as a decimal point.</p>

<p>This may be overridden in a locale file.</p> %}
    
    Defaults to: ['.']
    *)
  method thousandSeparator : Js.js_string Js.t Js.prop
  (** {% <p>The character that the <a href="#!/api/Ext.util.Format-method-number" rel="Ext.util.Format-method-number" class="docClass">number</a> function uses as a thousand separator.</p>

<p>This may be overridden in a locale file.</p> %}
    
    Defaults to: [',']
    *)
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

val get_instance : unit -> t Js.t
(** Singleton instance for lazy-loaded modules. *)

val instance : t Js.t
(** Singleton instance. *)

val of_configs : configs Js.t -> t Js.t
(** [of_configs c] casts a config object [c] to an instance of class [t] *)

val to_configs : t Js.t -> configs Js.t
(** [to_configs o] casts instance [o] of class [t] to a config object *)

