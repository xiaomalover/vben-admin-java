"undefined"!=typeof require&&require;import{D as e,c0 as t,P as a,a0 as n,bc as o,F as i,a1 as r,a5 as s,w as d,H as c,ad as l}from"./vendor.54f9b785.js";/* empty css              */import{_ as u,u as m}from"./useTable.56664a2f.js";import{_ as p}from"./useForm.1f83b549.js";import{e as f,f as h}from"./system.0b2cd881.js";import{a as b}from"./index.07fed524.js";import j from"./DeptTree.e02e492b.js";import{u as x}from"./index.ce2ad58c.js";import{_ as g,c as v,s as y}from"./AccountModal.2f8360f2.js";import{j as S}from"./index.fcdcd43d.js";/* empty css              *//* empty css              *//* empty css              *//* empty css              */import"./useWindowSizeFn.51649442.js";import"./onMountedOrActivated.fcde6c3c.js";/* empty css              */import"./useSortable.b48b43c7.js";/* empty css              *//* empty css              *//* empty css              */import"./useContentViewHeight.52e6f9d3.js";import"./Tree.vue_vue&type=style&index=0&lang.27a4f28c.js";var w=e({name:"AccountManagement",components:{BasicTable:u,PageWrapper:b,DeptTree:j,AccountModal:g,TableAction:p,Avatar:t},setup(){const e=S(),[t,{openModal:n}]=x(),o=a({}),[i,{reload:r,updateTableDataRecord:s}]=m({title:"账号列表",api:f,rowKey:"id",columns:v,formConfig:{labelWidth:120,schemas:y,autoSubmitOnEnter:!0},useSearchForm:!0,showTableSetting:!0,bordered:!0,handleSearchInfoFn:e=>e,actionColumn:{width:120,title:"操作",dataIndex:"action",slots:{customRender:"action"}}});return{registerTable:i,registerModal:t,handleCreate:function(){n(!0,{isUpdate:!1})},handleEdit:function(e){n(!0,{record:e,isUpdate:!0})},handleDelete:function(e){return t=this,a=null,n=function*(){(yield h(e.id))&&(yield r())},new Promise(((e,o)=>{var i=e=>{try{s(n.next(e))}catch(t){o(t)}},r=e=>{try{s(n.throw(e))}catch(t){o(t)}},s=t=>t.done?e(t.value):Promise.resolve(t.value).then(i,r);s((n=n.apply(t,a)).next())}));var t,a,n},handleSuccess:function({isUpdate:e,values:t}){e?s(t.id,t):r()},handleSelect:function(e=""){o.deptId=e,r()},handleView:function(t){e("/system/account/account_detail/"+t.id)},searchInfo:o}}});const T=l("新增账号");w.render=function(e,t,a,l,u,m){const p=n("DeptTree"),f=n("a-button"),h=n("TableAction"),b=n("Avatar"),j=n("BasicTable"),x=n("AccountModal"),g=n("PageWrapper"),v=o("auth");return i(),r(g,{dense:"",contentFullHeight:"",contentClass:"flex"},{default:s((()=>[d(p,{class:"w-1/4 xl:w-1/5",onSelect:e.handleSelect},null,8,["onSelect"]),d(j,{onRegister:e.registerTable,class:"w-3/4 xl:w-4/5",searchInfo:e.searchInfo},{toolbar:s((()=>[c(d(f,{type:"primary",onClick:e.handleCreate},{default:s((()=>[T])),_:1},8,["onClick"]),[[v,"admin:btn:add"]])])),action:s((({record:t})=>[d(h,{actions:[{icon:"clarity:note-edit-line",tooltip:"编辑用户资料",onClick:e.handleEdit.bind(null,t),auth:["admin:btn:edit"]},{icon:"ant-design:delete-outlined",color:"error",tooltip:"删除此账号",auth:["admin:btn:delete"],popConfirm:{title:"是否确认删除",confirm:e.handleDelete.bind(null,t)}}]},null,8,["actions"])])),avatar:s((({record:e})=>[d(b,{size:60,src:e.avatar},null,8,["src"])])),_:1},8,["onRegister","searchInfo"]),d(x,{onRegister:e.registerModal,onSuccess:e.handleSuccess},null,8,["onRegister","onSuccess"])])),_:1})};export{w as default};