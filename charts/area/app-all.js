/*
Copyright(c) 2012 Company Name
*/
function caml_raise_with_arg(b,a){throw [0,b,a]}function caml_raise_with_string(a,b){caml_raise_with_arg(a,new MlWrappedString(b))}function caml_invalid_argument(a){caml_raise_with_string(caml_global_data[4],a)}function caml_array_bound_error(){caml_invalid_argument("index out of bounds")}function caml_str_repeat(c,a){if(!c){return""}if(c&1){return caml_str_repeat(c-1,a)+a}var b=caml_str_repeat(c>>1,a);return b+b}function MlString(a){if(a!=null){this.bytes=this.fullBytes=a;this.last=this.len=a.length}}MlString.prototype={string:null,bytes:null,fullBytes:null,array:null,len:null,last:0,toJsString:function(){return this.string=decodeURIComponent(escape(this.getFullBytes()))},toBytes:function(){if(this.string!=null){var c=unescape(encodeURIComponent(this.string))}else{var c="",e=this.array,d=e.length;for(var f=0;f<d;f++){c+=String.fromCharCode(e[f])}}this.bytes=this.fullBytes=c;this.last=this.len=c.length;return c},getBytes:function(){var a=this.bytes;if(a==null){a=this.toBytes()}return a},getFullBytes:function(){var a=this.fullBytes;if(a!==null){return a}a=this.bytes;if(a==null){a=this.toBytes()}if(this.last<this.len){this.bytes=(a+=caml_str_repeat(this.len-this.last,"\0"));this.last=this.len}this.fullBytes=a;return a},toArray:function(){var c=this.bytes;if(c==null){c=this.toBytes()}var e=[],d=this.last;for(var f=0;f<d;f++){e[f]=c.charCodeAt(f)}for(d=this.len;f<d;f++){e[f]=0}this.string=this.bytes=this.fullBytes=null;this.last=this.len;this.array=e;return e},getArray:function(){var b=this.array;if(!b){b=this.toArray()}return b},getLen:function(){var a=this.len;if(a!==null){return a}this.toBytes();return this.len},toString:function(){var a=this.string;return a?a:this.toJsString()},valueOf:function(){var a=this.string;return a?a:this.toJsString()},blitToArray:function(j,c,h,f){var e=this.array;if(e){for(var g=0;g<f;g++){c[h+g]=e[j+g]}}else{var a=this.bytes;if(a==null){a=this.toBytes()}var d=this.last-j;if(f<=d){for(var g=0;g<f;g++){c[h+g]=a.charCodeAt(j+g)}}else{for(var g=0;g<d;g++){c[h+g]=a.charCodeAt(j+g)}for(;g<f;g++){c[h+g]=0}}}},get:function(e){var d=this.array;if(d){return d[e]}var c=this.bytes;if(c==null){c=this.toBytes()}return(e<this.last)?c.charCodeAt(e):0},safeGet:function(a){if(!this.len){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}return this.get(a)},set:function(d,e){var b=this.array;if(!b){if(this.last==d){this.bytes+=String.fromCharCode(e&255);this.last++;return 0}b=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}b[d]=e&255;return 0},safeSet:function(a,b){if(this.len==null){this.toBytes()}if((a<0)||(a>=this.len)){caml_array_bound_error()}this.set(a,b)},fill:function(g,b,h){if(g>=this.last&&this.last&&h==0){return}var e=this.array;if(!e){e=this.toArray()}else{if(this.bytes!=null){this.bytes=this.fullBytes=this.string=null}}var d=g+b;for(var f=g;f<d;f++){e[f]=h}},compare:function(c){if(this.string!=null&&c.string!=null){if(this.string<c.string){return -1}if(this.string>c.string){return 1}return 0}var b=this.getFullBytes();var a=c.getFullBytes();if(b<a){return -1}if(b>a){return 1}return 0},equal:function(a){if(this.string!=null&&a.string!=null){return this.string==a.string}return this.getFullBytes()==a.getFullBytes()},lessThan:function(a){if(this.string!=null&&a.string!=null){return this.string<a.string}return this.getFullBytes()<a.getFullBytes()},lessEqual:function(a){if(this.string!=null&&a.string!=null){return this.string<=a.string}return this.getFullBytes()<=a.getFullBytes()}};function MlWrappedString(a){this.string=a}MlWrappedString.prototype=new MlString();function MlMakeString(a){this.bytes="";this.len=a}MlMakeString.prototype=new MlString();function caml_int64_compare(a,d){var b=a[3]<<16;var c=d[3]<<16;if(b>c){return 1}if(b<c){return -1}if(a[2]>d[2]){return 1}if(a[2]<d[2]){return -1}if(a[1]>d[1]){return 1}if(a[1]<d[1]){return -1}return 0}function caml_int_compare(d,c){if(d<c){return(-1)}if(d==c){return 0}return 1}function caml_compare_val(g,e,k){var d=[];for(;;){if(!(k&&g===e)){if(g instanceof MlString){if(e instanceof MlString){if(g!=e){var c=g.compare(e);if(c!=0){return c}}}else{return 1}}else{if(g instanceof Array&&g[0]===(g[0]|0)){var h=g[0];if(h===250){g=g[1];continue}else{if(e instanceof Array&&e[0]===(e[0]|0)){var f=e[0];if(f===250){e=e[1];continue}else{if(h!=f){return(h<f)?-1:1}else{switch(h){case 248:var c=caml_int_compare(g[2],e[2]);if(c!=0){return c}break;case 255:var c=caml_int64_compare(g,e);if(c!=0){return c}break;default:if(g.length!=e.length){return(g.length<e.length)?-1:1}if(g.length>1){d.push(g,e,1)}}}}}else{return 1}}}else{if(e instanceof MlString||(e instanceof Array&&e[0]===(e[0]|0))){return -1}else{if(g<e){return -1}if(g>e){return 1}if(k&&g!=e){if(g==g){return 1}if(e==e){return -1}}}}}}if(d.length==0){return 0}var j=d.pop();e=d.pop();g=d.pop();if(j+1<g.length){d.push(g,e,j+1)}g=g[j];e=e[j]}}function caml_equal(a,b){return +(caml_compare_val(a,b,false)==0)}function caml_js_from_array(b){return b.slice(1)}function caml_call_gen(b,a){if(b.fun){return caml_call_gen(b.fun,a)}var e=b.length;var c=e-a.length;if(c==0){return b.apply(null,a)}else{if(c<0){return caml_call_gen(b.apply(null,a.slice(0,e)),a.slice(e))}else{return function(d){return caml_call_gen(b,a.concat([d]))}}}}function caml_js_wrap_callback(b){var a=Array.prototype.slice;return function(){var c=(arguments.length>0)?a.call(arguments):[undefined];return caml_call_gen(b,c)}}function caml_ml_out_channels_list(){return 0}var caml_global_data=[0];function caml_register_global(b,a){caml_global_data[b+1]=a}var caml_named_values={};function caml_register_named_value(a,b){caml_named_values[a]=b;return 0}(function(){caml_register_global(6,[0,new MlString("Not_found")]);caml_register_global(5,[0,new MlString("Division_by_zero")]);caml_register_global(3,[0,new MlString("Invalid_argument")]);caml_register_global(2,[0,new MlString("Failure")]);var a3=new MlString("Pervasives.do_at_exit"),s=new MlString("data9"),I=new MlString("data8"),Y=new MlString("data7"),ao=new MlString("data6"),aH=new MlString("data5"),aZ=new MlString("data4"),n=new MlString("data3"),G=new MlString("data2"),W=new MlString("data1"),am=new MlString("name"),aF=new MlString("Ext.data.JsonStore"),aV=new MlString("store1"),i=new MlString("data9"),D=new MlString("data8"),T=new MlString("data7"),t=new MlString("data6"),J=new MlString("data5"),Z=new MlString("data4"),ap=new MlString("data3"),aI=new MlString("data2"),a2=new MlString("data1"),r=new MlString("name"),H=new MlString("Ext.data.JsonStore"),X=new MlString("store3"),an=new MlString("data9"),aG=new MlString("data8"),aY=new MlString("data7"),m=new MlString("data6"),F=new MlString("data5"),V=new MlString("data4"),al=new MlString("data3"),aE=new MlString("data2"),aT=new MlString("data1"),h=new MlString("name"),C=new MlString("Ext.data.JsonStore"),S=new MlString("store4"),aj=new MlString("Ext.data.*"),aA=new MlString("yes"),aQ=new MlString("image/png"),d=new MlString("Would you like to download the chart as an image?"),z=new MlString("Confirm Download"),aw=new MlString("store1"),p=new MlString("chartCmp"),aW=new MlString("ease"),k=new MlString("#bbb"),E=new MlString("#ddd"),U=new MlString("stroke-width"),ak=new MlString("data7"),aD=new MlString("data6"),aS=new MlString("data5"),g=new MlString("data4"),B=new MlString("data3"),R=new MlString("data2"),ah=new MlString("data1"),az=new MlString("name"),aP=new MlString("left"),c=new MlString("area"),y=new MlString("Month of the Year"),O=new MlString("name"),ae=new MlString("bottom"),av=new MlString("Category"),aN=new MlString("Number of Hits"),a6=new MlString("data7"),v=new MlString("data6"),L=new MlString("data5"),ab=new MlString("data4"),at=new MlString("data3"),aK=new MlString("data2"),a4=new MlString("data1"),aB=new MlString("left"),aR=new MlString("Numeric"),e=new MlString("bottom"),A=new MlString("store1"),Q=new MlString("background:#fff"),ag=new MlString("chart"),ay=new MlString("chartCmp"),aO=new MlString("Ext.chart.Chart"),b=new MlString("Animate"),x=new MlString("Reload Data"),N=new MlString("Save Chart"),ad=new MlString("fit"),au=new MlString("Area Chart"),aL=new MlString("Ext.Window"),a5=new MlString("Ext.chart.*"),u=new MlString("Ext.window.MessageBox"),K=new MlString("Ext.layout.container.Fit"),aa=new MlString("Ext.fx.target.Sprite"),ar=new MlString("Ext.Window");function a0(a7){return function(a9){var ba=a9;for(;;){if(ba){var a8=ba[2];try{}catch(bb){}var ba=a8;continue}return 0}}(caml_ml_out_channels_list(0))}function q(a7){return a0(0)}caml_register_named_value(a3,q);var aq=[0,0],f=undefined,aC=true,aX=false,j=Array;function M(a7){aq[1]=[0,a7,aq[1]];return 0}var w=Math;function l(a7,a8){return a7[a8]}M(function(a7){return a7 instanceof j?0:[0,new MlWrappedString(a7.toString())]});function ac(a7){return a7}var aU=window;ac(window.HTMLElement)===f;var a=function(a7){return Ext}(0);function ai(a7){return Ext.MessageBox}var o=undefined,af=function(a7){return Ext.Date}(0);function ax(a7){return aU[a7.toString()]}function P(a8,a7){return aU[a8.toString()]=a7}a.require(caml_js_from_array([0,aj.toString()]),f,f,f);function aM(a7){return w.floor(a7)}function a1(a8,a7){return w.max(a8,a7)}function aJ(bl,a7,bp){var bk=bl?bl[1]:12,bb=a7?a7[1]:20;function bd(bq){return aM(a1(w.random()*100,bq))}var bc=new j(),bg=0;if(!(bk<bg)){var bj=bg;for(;;){var a9=bd(bb),bh=bd(bb),bn=bd(bb),ba=bd(bb),bi=bd(bb),bo=bd(bb),be=bd(bb),bm=bd(bb),a8=bd(bb);bc.push({name:l(af.monthNames,bj%12|0),data1:a8,data2:bm,data3:be,data4:bo,data5:bi,data6:ba,data7:bn,data8:bh,data9:a9});var bf=bj+1|0;if(bk!==bj){var bj=bf;continue}break}}return bc}a.onReady(caml_js_wrap_callback(function(ba){var bc=aJ(0,0,0),bd=ac({fields:caml_js_from_array([0,am.toString(),W.toString(),G.toString(),n.toString(),aZ.toString(),aH.toString(),ao.toString(),Y.toString(),I.toString(),s.toString()]),data:bc});P(aV,a.create(ac(aF.toString()),bd));var a7=aJ(0,0,0),a8=ac({fields:caml_js_from_array([0,r.toString(),a2.toString(),aI.toString(),ap.toString(),Z.toString(),J.toString(),t.toString(),T.toString(),D.toString(),i.toString()]),data:a7});P(X,a.create(ac(H.toString()),a8));var a9=aJ(0,0,0),bb=ac({fields:caml_js_from_array([0,h.toString(),aT.toString(),aE.toString(),al.toString(),V.toString(),F.toString(),m.toString(),aY.toString(),aG.toString(),an.toString()]),data:a9});return P(S,a.create(ac(C.toString()),bb))}),o,o);a.require(a5.toString(),f,f,f);a.require(caml_js_from_array([0,ar.toString(),aa.toString(),K.toString(),u.toString()]),f,f,f);a.onReady(caml_js_wrap_callback(function(br){var bE={opacity:1,fill:E.toString(),stroke:k.toString()},bs=k.toString(),bF=E.toString();bE[U.toString()]=1;var bz=caml_js_from_array([0,ah.toString(),R.toString(),B.toString(),g.toString(),aS.toString(),aD.toString(),ak.toString()]),bK=az.toString(),bh=aP.toString(),bw=caml_js_from_array([0,{type:c.toString(),highlight:aX,axis:aP.toString(),xField:az.toString(),yField:caml_js_from_array([0,ah.toString(),R.toString(),B.toString(),g.toString(),aS.toString(),aD.toString(),ak.toString()]),style:{opacity:0.93}}]),bI=y.toString(),bg=caml_js_from_array([0,O.toString()]),bv=ae.toString(),bH=aN.toString(),be=caml_js_from_array([0,a4.toString(),aK.toString(),at.toString(),ab.toString(),L.toString(),v.toString(),a6.toString()]),bu=aB.toString(),bG=caml_js_from_array([0,{type:aR.toString(),position:aB.toString(),fields:caml_js_from_array([0,a4.toString(),aK.toString(),at.toString(),ab.toString(),L.toString(),v.toString(),a6.toString()]),title:aN.toString(),grid:{odd:bE},minimum:0,adjustMinimumByMajorUnit:0},{type:av.toString(),position:ae.toString(),fields:caml_js_from_array([0,O.toString()]),title:y.toString(),grid:aC,label:{rotate:{degrees:315}}}]),bb={position:e.toString()},bj=ax(A),bC=Q.toString(),a7=ag.toString(),bm=ac({id:ay.toString(),xtype:ag.toString(),style:Q.toString(),animate:aC,store:bj,legend:bb,axes:bG,series:bw}),bA=a.create(ac(aO.toString()),bm),bc={opacity:0.93},bp={rotate:{degrees:315}},bd=0,bt=0,bk={odd:bE},bf=caml_js_wrap_callback(function(bN,bL){var bO=a.getCmp(p.toString());if(bL){var bP={easing:aW.toString(),duration:500},bM=500}else{var bP=aX}return bO.animate=bP}),bJ=b.toString(),bn={enableToggle:aC,pressed:aC,text:b.toString(),toggleHandler:bf},bx=caml_js_wrap_callback(function(bL){var bM=ax(aw);return bM.loadData(aJ(0,0,0))}),bq={text:x.toString(),handler:bx},by=caml_js_wrap_callback(function(bL){var bN=ai(0),bM=ac(caml_js_wrap_callback(function(bO){return caml_equal(bO,aA.toString())?bA.save({type:aQ.toString()}):0}));return bN.confirm(z.toString(),d.toString(),bM,f)}),a8=caml_js_from_array([0,{text:N.toString(),handler:by},bq,bn]),bi=ad.toString(),bB=a.getBody(),bl=au.toString(),a9=ac({width:800,height:600,minHeight:400,minWidth:550,hidden:aX,shadow:aX,maximizable:aC,title:au.toString(),renderTo:bB,layout:bi,tbar:a8,items:bA});a.create(ac(aL.toString()),a9);var ba=550,bo=400,bD=600;return 0}),o,o);q(0);return}());