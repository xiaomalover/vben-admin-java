"undefined"!=typeof require&&require;import{D as e,c0 as t,P as n,a0 as a,bc as o,F as i,a1 as r,a5 as s,w as d,H as c,ad as l}from"./vendor.54f9b785.js";/* empty css              */import{_ as u,u as m}from"./useTable.e6b840ff.js";import{_ as p}from"./useForm.91b099eb.js";import{e as f,f as h}from"./system.194fce67.js";import{a as b}from"./index.8c033639.js";import j from"./DeptTree.e05362dd.js";import{u as x}from"./index.9981dd62.js";import{_ as g,c as v,s as y}from"./AccountModal.058c039b.js";import{j as S}from"./index.29cb9d1e.js";/* empty css              *//* empty css              *//* empty css              *//* empty css              */import"./useWindowSizeFn.51649442.js";import"./onMountedOrActivated.fcde6c3c.js";/* empty css              */import"./useSortable.15816348.js";/* empty css              *//* empty css              *//* empty css              */import"./useContentViewHeight.e2ebf036.js";import"./Tree.vue_vue&type=style&index=0&lang.200156f7.js";var w=e({name:"AccountManagement",components:{BasicTable:u,PageWrapper:b,DeptTree:j,AccountModal:g,TableAction:p,Avatar:t},setup(){const e=S(),[t,{openModal:a}]=x(),o=n({}),[i,{reload:r,updateTableDataRecord:s}]=m({title:"账号列表",api:f,rowKey:"id",columns:v,formConfig:{labelWidth:120,schemas:y,autoSubmitOnEnter:!0},useSearchForm:!0,showTableSetting:!0,bordered:!0,handleSearchInfoFn:e=>e,actionColumn:{width:120,title:"操作",dataIndex:"action",slots:{customRender:"action"}}});return{registerTable:i,registerModal:t,handleCreate:function(){a(!0,{isUpdate:!1})},handleEdit:function(e){a(!0,{record:e,isUpdate:!0})},handleDelete:function(e){return t=this,n=null,a=function*(){(yield h(e.id))&&(yield r())},new Promise(((e,o)=>{var i=e=>{try{s(a.next(e))}catch(t){o(t)}},r=e=>{try{s(a.throw(e))}catch(t){o(t)}},s=t=>t.done?e(t.value):Promise.resolve(t.value).then(i,r);s((a=a.apply(t,n)).next())}));var t,n,a},handleSuccess:function({isUpdate:e,values:t}){e?s(t.id,t):r()},handleSelect:function(e=""){o.deptId=e,r()},handleView:function(t){e("/system/account/account_detail/"+t.id)},searchInfo:o}}});const T=l("新增账号");w.render=function(e,t,n,l,u,m){const p=a("DeptTree"),f=a("a-button"),h=a("TableAction"),b=a("Avatar"),j=a("BasicTable"),x=a("AccountModal"),g=a("PageWrapper"),v=o("auth");return i(),r(g,{dense:"",contentFullHeight:"",contentClass:"flex"},{default:s((()=>[d(p,{class:"w-1/4 xl:w-1/5",onSelect:e.handleSelect},null,8,["onSelect"]),d(j,{onRegister:e.registerTable,class:"w-3/4 xl:w-4/5",searchInfo:e.searchInfo},{toolbar:s((()=>[c(d(f,{type:"primary",onClick:e.handleCreate},{default:s((()=>[T])),_:1},8,["onClick"]),[[v,"admin:btn:add"]])])),action:s((({record:t})=>[d(h,{actions:[{icon:"clarity:note-edit-line",tooltip:"编辑用户资料",onClick:e.handleEdit.bind(null,t),auth:["admin:btn:edit"]},{icon:"ant-design:delete-outlined",color:"error",tooltip:"删除此账号",auth:["admin:btn:delete"],popConfirm:{title:"是否确认删除",confirm:e.handleDelete.bind(null,t)}}]},null,8,["actions"])])),avatar:s((({record:e})=>[d(b,{size:60,src:e.avatar},null,8,["src"])])),_:1},8,["onRegister","searchInfo"]),d(x,{onRegister:e.registerModal,onSuccess:e.handleSuccess},null,8,["onRegister","onSuccess"])])),_:1})};export{w as default};