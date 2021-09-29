var e=Object.defineProperty,t=Object.defineProperties,r=Object.getOwnPropertyDescriptors,n=Object.getOwnPropertySymbols,a=Object.prototype.hasOwnProperty,l=Object.prototype.propertyIsEnumerable,o=(t,r,n)=>r in t?e(t,r,{enumerable:!0,configurable:!0,writable:!0,value:n}):t[r]=n,i=(e,t)=>{for(var r in t||(t={}))a.call(t,r)&&o(e,r,t[r]);if(n)for(var r of n(t))l.call(t,r)&&o(e,r,t[r]);return e},u=(e,n)=>t(e,r(n));"undefined"!=typeof require&&require;import{D as s,c4 as c,r as d,a as m,al as p,a0 as v,F as h,G as f,w as b,a5 as y,a1 as g,ac as C,L as O,ad as j,N as k}from"./vendor.54f9b785.js";/* empty css              */import{_ as w,p as x,c as I,N as P,j as B,d as M,ak as R,R as S,J as $,q,aM as A}from"./index.97957499.js";var D=s({name:"LayoutBreadcrumb",components:{Icon:w,[c.name]:c},props:{theme:x.oneOf(["dark","light"])},setup(){const e=d([]),{currentRoute:t}=m(),{prefixCls:r}=I("layout-breadcrumb"),{getShowBreadCrumbIcon:n}=P(),a=B(),{t:l}=M();function o(e,t){const r=[];return e.forEach((e=>{var n,a;t.includes(e.path)&&r.push(u(i({},e),{name:(null==(n=e.meta)?void 0:n.title)||e.name})),(null==(a=e.children)?void 0:a.length)&&r.push(...o(e.children,t))})),r}return p((()=>{return r=this,n=null,a=function*(){var r,n,a;if(t.value.name===S)return;const l=yield $(),s=t.value.matched,c=null==s?void 0:s[s.length-1];let d=t.value.path;c&&(null==(r=null==c?void 0:c.meta)?void 0:r.currentActiveMenu)&&(d=c.meta.currentActiveMenu);const m=q(l,d),p=o(l.filter((e=>e.path===m[0])),m);if(!p||0===p.length)return;const v=A(p,(e=>{const{meta:t,name:r}=e;if(!t)return!!r;const{title:n,hideBreadcrumb:a,hideMenu:l}=t;return!(!n||a||l)})).filter((e=>{var t,r;return!(null==(t=e.meta)?void 0:t.hideBreadcrumb)||!(null==(r=e.meta)?void 0:r.hideMenu)}));(null==(n=t.value.meta)?void 0:n.currentActiveMenu)&&v.push(u(i({},t.value),{name:(null==(a=t.value.meta)?void 0:a.title)||t.value.name})),e.value=v},new Promise(((e,t)=>{var l=e=>{try{i(a.next(e))}catch(r){t(r)}},o=e=>{try{i(a.throw(e))}catch(r){t(r)}},i=t=>t.done?e(t.value):Promise.resolve(t.value).then(l,o);i((a=a.apply(r,n)).next())}));var r,n,a})),{routes:e,t:l,prefixCls:r,getIcon:function(e){var t;return e.icon||(null==(t=e.meta)?void 0:t.icon)},getShowBreadCrumbIcon:n,handleClick:function(e,t,r){null==r||r.preventDefault();const{children:n,redirect:l,meta:o}=e;if(!(null==n?void 0:n.length)||l){if(!(null==o?void 0:o.carryParam))if(l&&R(l))a(l);else{let e="";if(1===t.length)e=t[0];else{e=`${t.slice(1).pop()||""}`}e=/^\//.test(e)?e:`/${e}`,a(e)}}else null==r||r.stopPropagation()},hasRedirect:function(e,t){return e.indexOf(t)!==e.length-1}}}});const _={key:1};D.render=function(e,t,r,n,a,l){const o=v("Icon"),i=v("router-link"),u=v("a-breadcrumb");return h(),f("div",{class:k([e.prefixCls,`${e.prefixCls}--${e.theme}`])},[b(u,{routes:e.routes},{itemRender:y((({route:t,routes:r,paths:n})=>[e.getShowBreadCrumbIcon&&e.getIcon(t)?(h(),g(o,{key:0,icon:e.getIcon(t)},null,8,["icon"])):C("",!0),e.hasRedirect(r,t)?(h(),g(i,{key:2,to:"",onClick:r=>e.handleClick(t,n,r)},{default:y((()=>[j(O(e.t(t.name||t.meta.title)),1)])),_:2},1032,["onClick"])):(h(),f("span",_,O(e.t(t.name||t.meta.title)),1))])),_:1},8,["routes"])],2)};export{D as default};
