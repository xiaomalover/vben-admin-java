import{D as o,aT as e,c3 as t,a as s,r as a,j as n,u as i,A as r,B as l,a0 as u,F as d,a1 as c,a5 as f,K as p,L as v,w as h,N as b,ac as m}from"./vendor.54f9b785.js";import{N as F,c as _,F as w,d as C}from"./index.97957499.js";import{a as L}from"./useContentViewHeight.d5953322.js";import"./useWindowSizeFn.51649442.js";var g=o({name:"LayoutFooter",components:{Footer:e.Footer,GithubFilled:t},setup(){const{t:o}=C(),{getShowFooter:e}=F(),{currentRoute:t}=s(),{prefixCls:r}=_("layout-footer"),l=a(null),{setFooterHeight:u}=L();return{getShowLayoutFooter:n((()=>{var o,s;if(i(e)){const e=null==(o=i(l))?void 0:o.$el;u((null==e?void 0:e.offsetHeight)||0)}else u(0);return i(e)&&!(null==(s=i(t).meta)?void 0:s.hiddenFooter)})),prefixCls:r,t:o,DOC_URL:"https://vvbin.cn/doc-next/",GITHUB_URL:"https://github.com/anncwb/vue-vben-admin",SITE_URL:"https://vvbin.cn/next/",openWindow:w,footerRef:l}}});r("data-v-0bf7ba29");const x=p("div",null,"Copyright ©2020 Vben Admin",-1);l(),g.render=function(o,e,t,s,a,n){const i=u("GithubFilled"),r=u("Footer");return o.getShowLayoutFooter?(d(),c(r,{key:0,class:b(o.prefixCls),ref:"footerRef"},{default:f((()=>[p("div",{class:b(`${o.prefixCls}__links`)},[p("a",{onClick:e[0]||(e[0]=e=>o.openWindow(o.SITE_URL))},v(o.t("layout.footer.onlinePreview")),1),h(i,{onClick:e[1]||(e[1]=e=>o.openWindow(o.GITHUB_URL)),class:b(`${o.prefixCls}__github`)},null,8,["class"]),p("a",{onClick:e[2]||(e[2]=e=>o.openWindow(o.DOC_URL))},v(o.t("layout.footer.onlineDocument")),1)],2),x])),_:1},8,["class"])):m("",!0)},g.__scopeId="data-v-0bf7ba29";export{g as default};
