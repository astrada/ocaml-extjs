/*
Copyright(c) 2012 Company Name
*/
function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_js_from_array(b){return b.slice(1)}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[undefined];return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var k=new MlString("Pervasives.do_at_exit"),B=new MlString("#AACE36"),P=new MlString("0"),ac=new MlString("#2FA042"),ar=new MlString("100"),aG=new MlString("#79A933"),h=new MlString("0"),x=new MlString("#70A333"),M=new MlString("13"),n=new MlString("#559332"),D=new MlString("34"),R=new MlString("#277B2F"),ae=new MlString("58"),av=new MlString("#005F27"),aK=new MlString("86"),m=new MlString("#005020"),C=new MlString("100"),Q=new MlString("#79AB35"),ad=new MlString("0"),at=new MlString("#7CBA3D"),aI=new MlString("53"),j=new MlString("#00AA4B"),A=new MlString("100"),O=new MlString("url(#grad3)"),ab=new MlString("C187.476,212.482,156.516,222.408,123.44,222.408"),aq=new MlString("c0.009,0.005,0.02,0.011,0.028,0.017c0.002,0.001,0.008,0.005,0.01,0.006c25.392,15.756,43.88,41.564,49.94,71.859"),aF=new MlString("c2.462,1.278,4.871,2.648,7.22,4.102c0.006,0.004,0.009,0.006,0.016,0.01c0.009,0.005,0.018,0.011,0.025,0.016"),g=new MlString("l-8.117-4.067c-10.97-27.17-15.778-56.844-13.485-86.749c12.607-6.37,23.053-16.485,29.815-28.949l5.545-9.901l68.032,34.101"),w=new MlString("M123.44,222.408c-2.519,0-5.05-0.057-7.591-0.174c-14.436-0.662-28.343-3.192-41.515-7.32"),L=new MlString(""),Z=new MlString("path"),an=new MlString("url(#grad2)"),aC=new MlString("l14.101-7.202l7.859-4.011c36.137-18.041,60.955-55.376,60.955-98.509L213.364,195.358z"),d=new MlString("c0,0.032-0.001,0.063-0.001,0.095v0.008c-0.192,12.063-4.956,23.016-12.633,31.202c-3.517,3.753-7.647,6.924-12.23,9.355"),t=new MlString("c0,0.009,0,0.019-0.001,0.026v0.081c0,0.007-0.001,0.015-0.001,0.022v0.059c0,0.009-0.001,0.019-0.001,0.026v0.017"),aj=new MlString("c15.615,7.571,26.39,23.571,26.39,42.092v0.107c0,0.015-0.001,0.031-0.001,0.046v0.168c-0.001,0.014-0.001,0.028-0.001,0.042v0.066"),l=new MlString("c-25.889,17.124-56.849,27.05-89.924,27.05c-2.519,0-5.05-0.057-7.591-0.174c-14.436-0.662-28.343-3.192-41.515-7.32l56.748,28.445"),aH=new MlString("c-7.44,18.621-11.77,37.728-13.228,56.742c12.607-6.37,23.053-16.485,29.815-28.949L88.093,85.247z M213.364,195.358"),i=new MlString("c-0.01-0.005-0.018-0.009-0.027-0.014c-0.001-0.001-0.003-0.002-0.004-0.002c-7.075-3.631-13.103-9.016-17.512-15.578"),y=new MlString("c-0.009-0.005-0.018-0.01-0.027-0.014c-0.006-0.003-0.013-0.007-0.018-0.01c-0.006-0.003-0.013-0.006-0.019-0.009"),N=new MlString("c-0.003-0.002-0.006-0.004-0.009-0.005c-0.011-0.006-0.022-0.011-0.033-0.017c-0.004-0.002-0.008-0.004-0.013-0.006"),aa=new MlString("c-0.014-0.007-0.027-0.014-0.04-0.02c-0.003-0.002-0.003-0.002-0.006-0.004c-0.013-0.006-0.025-0.012-0.037-0.018"),ap=new MlString("c-0.015-0.008-0.029-0.015-0.044-0.022l-0.001-0.001c-0.014-0.007-0.028-0.014-0.042-0.021c-0.001-0.001-0.003-0.002-0.004-0.002"),aE=new MlString("M88.093,85.247l-3.657-1.834c-0.214-0.103-0.426-0.208-0.638-0.315h-0.001"),f=new MlString(""),v=new MlString("path"),K=new MlString("url(#grad1)"),Y=new MlString("c11.18-0.001,21.795-2.669,31.203-7.424C50.44,154.002,55.248,183.676,66.218,210.846"),am=new MlString("c-29.686-15.598-51.36-44.362-57.28-78.53c5.306,1.575,10.887,2.541,16.665,2.804c1.084,0.05,2.161,0.075,3.235,0.075"),aB=new MlString("c-0.011-0.005-0.025-0.014-0.036-0.02c-0.004-0.002-0.005-0.002-0.009-0.004c-0.013-0.007-0.025-0.014-0.038-0.02l-0.003-0.002"),c=new MlString("c-0.002-0.001-0.006-0.003-0.008-0.005c-0.013-0.006-0.023-0.011-0.035-0.018c-0.005-0.002-0.007-0.003-0.011-0.006"),s=new MlString("c-0.009-0.005-0.02-0.01-0.029-0.015c-0.006-0.003-0.007-0.004-0.014-0.007c-0.038-0.021-0.074-0.039-0.113-0.06"),H=new MlString("c-0.008-0.005-0.012-0.007-0.021-0.011c-0.009-0.005-0.018-0.01-0.027-0.014c-0.007-0.005-0.013-0.008-0.02-0.012"),W=new MlString("c-0.006-0.003-0.013-0.007-0.019-0.01c-0.01-0.005-0.017-0.009-0.028-0.015c-0.009-0.005-0.016-0.008-0.025-0.013"),ai=new MlString("M66.218,210.846l-6.824-3.421c-0.016-0.009-0.033-0.018-0.048-0.025"),az=new MlString(""),aO=new MlString("path"),q=new MlString("#C5D83E"),F=new MlString("C157.467,286.208,157.467,286.212,157.467,286.214"),U=new MlString("C157.468,286.101,157.468,286.107,157.468,286.112 M157.467,286.214c0-0.003,0-0.006,0-0.008"),ag=new MlString("C157.469,286.053,157.469,286.062,157.469,286.069 M157.468,286.112c0-0.005,0-0.011,0-0.017"),ax=new MlString("C157.47,285.995,157.469,286.002,157.469,286.01 M157.469,286.069c0-0.008,0-0.016,0-0.022"),aL=new MlString("C157.47,285.949,157.47,285.955,157.47,285.964 M157.469,286.01c0-0.008,0.001-0.016,0.001-0.022"),ao=new MlString("C157.471,285.889,157.471,285.898,157.47,285.907 M157.47,285.964c0-0.009,0-0.017,0-0.023"),aD=new MlString("C157.471,285.841,157.471,285.85,157.471,285.858 M157.47,285.907c0.001-0.008,0.001-0.018,0.001-0.026"),e=new MlString("C157.471,285.785,157.471,285.8,157.471,285.814 M157.471,285.858c0-0.008,0-0.017,0-0.026"),u=new MlString("C157.472,285.733,157.472,285.745,157.472,285.756 M157.471,285.814c0-0.014,0-0.028,0.001-0.042"),I=new MlString("C157.472,285.68,157.472,285.694,157.472,285.708 M157.472,285.756c0-0.012,0-0.023,0-0.034"),X=new MlString("C157.472,285.628,157.472,285.641,157.472,285.653 M157.472,285.708c0-0.015,0-0.028,0-0.045"),ak=new MlString("C157.473,285.574,157.472,285.588,157.472,285.604 M157.472,285.653c0-0.012,0-0.024,0-0.037"),aA=new MlString("C157.473,285.523,157.473,285.536,157.473,285.55 M157.472,285.604c0-0.015,0.001-0.031,0.001-0.046"),a=new MlString("C157.473,285.467,157.473,285.482,157.473,285.498 M157.473,285.55c0-0.014,0-0.027,0-0.04"),r=new MlString("c-1.074,0-2.151-0.025-3.235-0.075c-5.778-0.263-11.359-1.229-16.665-2.804L0,109.718z M157.473,285.498c0-0.015,0-0.031,0-0.047"),G=new MlString("c0,9.64,2.916,18.597,7.915,26.039c-7.44,18.621-11.77,37.728-13.228,56.742c-9.408,4.755-20.023,7.423-31.203,7.424"),V=new MlString("M0,109.718c0-43.13,24.815-80.463,60.955-98.499L82.914,0C68.122,7.85,58.046,23.406,58.046,41.316"),ah=new MlString(""),ay=new MlString("path"),aN=new MlString("grad3"),p=new MlString("grad2"),E=new MlString("grad1"),T=new MlString("all"),af=new MlString("Ext.draw.Component");function aJ(aP){return function(aR){var aS=aR;for(;;){if(aS){var aQ=aS[2];try{}catch(aT){}var aS=aQ;continue}return 0}}(caml_ml_out_channels_list(0))}function z(aP){return aJ(0)}caml_register_named_value(k,z);var au=[0,0],b=true;function aw(aP){au[1]=[0,aP,au[1]];return 0}var al=undefined,J=Array;aw(function(aP){return aP instanceof J?0:[0,new MlWrappedString(aP.toString())]});function S(aP){return aP}S(window.HTMLElement)===al;var o=function(aP){return Ext}(0),aM=undefined;o.onReady(caml_js_wrap_callback(function(aV){var a2={};a2[P.toString()]={color:B.toString()};a2[ar.toString()]={color:ac.toString()};var a0={};a0[h.toString()]={color:aG.toString()};a0[M.toString()]={color:x.toString()};a0[D.toString()]={color:n.toString()};a0[ae.toString()]={color:R.toString()};a0[aK.toString()]={color:av.toString()};a0[C.toString()]={color:m.toString()};var aZ={};aZ[ad.toString()]={color:Q.toString()};aZ[aI.toString()]={color:at.toString()};aZ[A.toString()]={color:j.toString()};var a6=O.toString(),aT=caml_js_from_array([0,w.toString(),g.toString(),aF.toString(),aq.toString(),ab.toString()]).join(L.toString()),bd={type:Z.toString(),path:aT,fill:a6},a7=an.toString(),aW=caml_js_from_array([0,aE.toString(),ap.toString(),aa.toString(),N.toString(),y.toString(),i.toString(),aH.toString(),l.toString(),aj.toString(),t.toString(),d.toString(),aC.toString()]).join(f.toString()),aP={type:v.toString(),path:aW,fill:a7},a8=K.toString(),aX=caml_js_from_array([0,ai.toString(),W.toString(),H.toString(),s.toString(),c.toString(),aB.toString(),am.toString(),Y.toString()]).join(az.toString()),a1={type:aO.toString(),path:aX,fill:a8},a9=q.toString(),aY=caml_js_from_array([0,V.toString(),G.toString(),r.toString(),a.toString(),aA.toString(),ak.toString(),X.toString(),I.toString(),u.toString(),e.toString(),aD.toString(),ao.toString(),aL.toString(),ax.toString(),ag.toString(),U.toString(),F.toString()]).join(ah.toString()),aR=caml_js_from_array([0,{type:ay.toString(),path:aY,fill:a9},a1,aP,bd]),aU=caml_js_from_array([0,{id:E.toString(),angle:100,stops:a2},{id:p.toString(),angle:21,stops:a0},{id:aN.toString(),angle:55,stops:aZ}]),a3=o.getBody(),aQ=T.toString(),bc={dynamic:b,pinned:b,handles:T.toString()},a4=S({width:300,height:300,resizable:{dynamic:b,pinned:b,handles:T.toString()},renderTo:a3,gradients:aU,items:aR});o.create(S(af.toString()),a4);var bb=55,a5=21,aS=100,ba=300;return 0}),aM,aM);z(0);return}());
