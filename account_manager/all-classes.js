function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){if(h<=j){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{for(var g=f-1;g>=0;g--){c[h+g]=e[j+g]}}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_from_array(b){return b.slice(1)}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var m=new MlString("Pervasives.do_at_exit"),c=new MlString("Ext.data.Model"),h=new MlString("email"),n=new MlString("name"),d=new MlString("AM.model.User");function o(p){return function(r){var s=r;for(;;){if(s){var q=s[2];try{}catch(t){}var s=q;continue}return 0}}(caml_ml_out_channels_list(0))}function f(p){return o(0)}caml_register_named_value(m,f);var b=[0,0];function g(p){b[1]=[0,p,b[1]];return 0}var l=undefined,k=Array;g(function(p){return p instanceof k?0:[0,new MlWrappedString(p.toString())]});(function(p){return p}(this.HTMLElement)===l);var j=function(p){return Ext}(0),a=undefined,i={},e=function(p){return p}(i);e.extend=c.toString();i.fields=caml_js_from_array([0,n.toString(),h.toString()]);j.define(d.toString(),i,a);f(0);return}());function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){if(h<=j){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{for(var g=f-1;g>=0;g--){c[h+g]=e[j+g]}}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var z=new MlString("Pervasives.do_at_exit"),p=new MlString("success"),g=new MlString("users"),x=new MlString("json"),o=new MlString("data/updateUsers.json"),f=new MlString("data/users.json"),w=new MlString("ajax"),n=new MlString("AM.model.User"),e=new MlString("Ext.data.Store"),u=new MlString("AM.store.Users");function c(A){return function(C){var D=C;for(;;){if(D){var B=D[2];try{}catch(E){}var D=B;continue}return 0}}(caml_ml_out_channels_list(0))}function d(A){return c(0)}caml_register_named_value(z,d);var s=[0,0];function l(A){s[1]=[0,A,s[1]];return 0}var b=undefined,j=Array;l(function(A){return A instanceof j?0:[0,new MlWrappedString(A.toString())]});(function(A){return A}(this.HTMLElement)===b);var h=function(A){return Ext}(0),y=undefined;function r(A){return A}var a={root:g.toString(),successProperty:p.toString()},i=p.toString();a.type=x.toString();var v={},k=o.toString(),m={read:f.toString(),update:o.toString()};v.type=w.toString();v.api=m;v.reader=a;var q={model:n.toString()},t=r(q);t.extend=e.toString();q.autoLoad=!!1;q.proxy=v;h.define(u.toString(),q,y);d(0);return}());function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){if(h<=j){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{for(var g=f-1;g>=0;g--){c[h+g]=e[j+g]}}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_call_parent(a,b){a.superclass[b].apply(a,arguments)}function caml_js_from_array(b){return b.slice(1)}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_meth_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[0];c.unshift(this);return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var h=new MlString("Pervasives.do_at_exit"),v=new MlString("Users"),m=new MlString("name"),f=new MlString("Name"),u=new MlString("email"),l=new MlString("Email"),e=new MlString("initComponent"),t=new MlString("All Users"),k=new MlString("Ext.grid.Panel"),d=new MlString("widget.userlist"),s=new MlString("AM.view.user.List");function c(w){return function(y){var z=y;for(;;){if(z){var x=z[2];try{}catch(A){}var z=x;continue}return 0}}(caml_ml_out_channels_list(0))}function j(w){return c(0)}caml_register_named_value(h,j);var b=[0,0];function p(w){b[1]=[0,w,b[1]];return 0}var i=undefined,o=Array;p(function(w){return w instanceof o?0:[0,new MlWrappedString(w.toString())]});(function(w){return w}(this.HTMLElement)===i);var n=function(w){return Ext}(0),g=undefined;function a(w){return w}var q={title:t.toString()},r=a(q);r.extend=k.toString();r.alias=caml_js_from_array([0,d.toString()]);q.initComponent=caml_js_wrap_meth_callback(function(x,A){x.store=v.toString();var z={text:f.toString(),dataIndex:m.toString()},w=m.toString();z.flex=1;var B={text:l.toString(),dataIndex:u.toString()},y=u.toString();B.flex=1;x.columns=caml_js_from_array([0,z,B]);return caml_js_call_parent(x,e)});n.define(s.toString(),q,g);j(0);return}());function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){if(h<=j){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{for(var g=f-1;g>=0;g--){c[h+g]=e[j+g]}}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_call_parent(a,b){a.superclass[b].apply(a,arguments)}function caml_js_from_array(b){return b.slice(1)}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[undefined];return caml_call_gen(b,c)}}function caml_js_wrap_meth_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[0];c.unshift(this);return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var n=new MlString("Pervasives.do_at_exit"),d=new MlString("Email"),x=new MlString("email"),l=new MlString("textfield"),b=new MlString("Name"),w=new MlString("name"),k=new MlString("textfield"),E=new MlString("form"),u=new MlString("Save"),j=new MlString("save"),C=new MlString("Cancel"),s=new MlString("initComponent"),i=new MlString("Edit User"),B=new MlString("fit"),r=new MlString("Ext.window.Window"),h=new MlString("widget.useredit"),A=new MlString("AM.view.user.Edit");function g(F){return function(H){var I=H;for(;;){if(I){var G=I[2];try{}catch(J){}var I=G;continue}return 0}}(caml_ml_out_channels_list(0))}function q(F){return g(0)}caml_register_named_value(n,q);var f=[0,0];function a(F){f[1]=[0,F,f[1]];return 0}var v=undefined,D=Array;a(function(F){return F instanceof D?0:[0,new MlWrappedString(F.toString())]});(function(F){return F}(this.HTMLElement)===v);var m=function(F){return Ext}(0);function o(F){return F}var e=undefined;function y(F){return F}function c(I,G,J){var H=J.toString(),F=G.toString();return{xtype:I.toString(),name:G.toString(),fieldLabel:J.toString()}}var z={title:i.toString(),autoShow:!!1};z.layout=B.toString();var t=y(z);t.extend=r.toString();t.alias=caml_js_from_array([0,h.toString()]);var p=!!1;z.initComponent=caml_js_wrap_meth_callback(function(I,K){var H=c(l,x,d),F=[0,c(k,w,b),H],J={xtype:E.toString()};J.items=caml_js_from_array(F);I.items=caml_js_from_array([0,J]);var L={text:u.toString()};L.action=j.toString();var G={text:C.toString()};G.handler=caml_js_wrap_callback(function(M,N){return o(I).close()});I.buttons=caml_js_from_array([0,L,G]);return caml_js_call_parent(I,s)});m.define(A.toString(),z,e);q(0);return}());function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){if(h<=j){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{for(var g=f-1;g>=0;g--){c[h+g]=e[j+g]}}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_from_array(b){return b.slice(1)}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[undefined];return caml_call_gen(b,c)}}function caml_js_wrap_meth_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[0];c.unshift(this);return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var i=new MlString("Pervasives.do_at_exit"),z=new MlString("window"),p=new MlString("form"),g=new MlString("useredit"),x=new MlString("form"),n=new MlString("User"),e=new MlString("Users"),w=new MlString("user.Edit"),k=new MlString("user.List"),d=new MlString("Ext.app.Controller"),v=new MlString("AM.controller.Users");function c(A){return function(C){var D=C;for(;;){if(D){var B=D[2];try{}catch(E){}var D=B;continue}return 0}}(caml_ml_out_channels_list(0))}function j(A){return c(0)}caml_register_named_value(i,j);var a=[0,0],s=undefined;function t(A){a[1]=[0,A,a[1]];return 0}var b=Array;t(function(A){return A instanceof b?0:[0,new MlWrappedString(A.toString())]});function o(A){return A}o(this.HTMLElement)===s;var h=function(A){return Ext}(0),q=undefined;function r(A){return A}var u={};function f(A){return A}u.itemdblclick=caml_js_wrap_meth_callback(function(D,E,A,C,F,B){return D.editUser(E,A)});var y={};y.click=caml_js_wrap_meth_callback(function(C,B,A){return C.updateUser(B)});var m={};m.models=caml_js_from_array([0,n.toString()]);m.stores=caml_js_from_array([0,e.toString()]);m.views=caml_js_from_array([0,k.toString(),w.toString()]);var l=r(m);l.extend=d.toString();m.init=caml_js_wrap_meth_callback(function(B,A){return f(B).control({"viewport userlist":u,"useredit button[action=save]":y},q)});m.editUser=caml_js_wrap_callback(function(B,C){var A=h.widget(o(g.toString()),s);return A.down(x.toString()).loadRecord(C)});m.updateUser=caml_js_wrap_meth_callback(function(D,B){var C=B.up(z.toString(),s,s),A=C.down(p.toString(),s),E=A.getRecord();E.set(A.getValues(s,s,s,s),q);C.close();return D.getUsersStore().sync()});h.define(v.toString(),m,q);j(0);return}());function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){if(h<=j){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{for(var g=f-1;g>=0;g--){c[h+g]=e[j+g]}}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_from_array(b){return b.slice(1)}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_meth_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[0];c.unshift(this);return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var s=new MlString("Pervasives.do_at_exit"),m=new MlString("Ext.container.Viewport"),h=new MlString("userlist"),r=new MlString("fit"),l=new MlString("app"),g=new MlString("AM"),q=new MlString("Users");function b(t){return function(v){var w=v;for(;;){if(w){var u=w[2];try{}catch(x){}var w=u;continue}return 0}}(caml_ml_out_channels_list(0))}function d(t){return b(0)}caml_register_named_value(s,d);var n=[0,0];function a(t){n[1]=[0,t,n[1]];return 0}var i=Array;a(function(t){return t instanceof i?0:[0,new MlWrappedString(t.toString())]});function p(t){return t}var k=function(t){return Ext}(0),e={},c={xtype:h.toString()};e.layout=r.toString();e.items=caml_js_from_array([0,c]);var o=caml_js_wrap_meth_callback(function(t,v){var u=p(e);return k.create(p(m.toString()),u)}),f={name:g.toString(),appFolder:l.toString(),launch:o},j=l.toString();f.controllers=caml_js_from_array([0,q.toString()]);k.application(f);d(0);return}());