var e=Object.defineProperty,r=Object.getOwnPropertySymbols,t=Object.prototype.hasOwnProperty,o=Object.prototype.propertyIsEnumerable,n=(r,t,o)=>t in r?e(r,t,{enumerable:!0,configurable:!0,writable:!0,value:o}):r[t]=o;"undefined"!=typeof require&&require;import{C as a}from"./index.97957499.js";import{$ as i,u as l}from"./vendor.54f9b785.js";function u(e,u){return{initSortable:function(){i((()=>{return i=this,c=null,p=function*(){e&&(yield a((()=>import("./sortable.esm.b519ac50.js")),[])).default.create(l(e),((e,a)=>{for(var i in a||(a={}))t.call(a,i)&&n(e,i,a[i]);if(r)for(var i of r(a))o.call(a,i)&&n(e,i,a[i]);return e})({animation:500,delay:400,delayOnTouchOnly:!0},u))},new Promise(((e,r)=>{var t=e=>{try{n(p.next(e))}catch(t){r(t)}},o=e=>{try{n(p.throw(e))}catch(t){r(t)}},n=r=>r.done?e(r.value):Promise.resolve(r.value).then(t,o);n((p=p.apply(i,c)).next())}));var i,c,p}))}}}export{u};
