import request from '@/utils/request.js'
import { useTokenStore } from '@/stores/token.js'
// 获取文章列表
export const articleCategoryListService = () => {
  //const tokenStore = useTokenStore();
  //在pinia中获取token
  //return request.get('/category',{headers:{'Authorization':tokenStore.token}})
  return request.get('/category')
}
//添加文章分类
export const articleCategoryAddService = (categoryData) => {
  return request.post('/category', categoryData)
}
//文章分类修改
export const articleCategoryUpdateService = (categoryData) => {
  return request.put('/category', categoryData)
}
//文章分类删除
export const articleCategoryDeleteService = (id) => {
  return request.delete('/category?id='+id)
}
//文章列表查询
export const articleListService = (params) => {
  return request.get('/article', { params })
}
//添加文章
export const articleAddService = (articleData)=>{
  return request.post('/article',articleData)
}
//文章内容修改
export const articleUpdateService = (articleData)=>{
  return request.put('/article', articleData)
}
//文章内容删除
export const articleDeleteService = (id) => {
  return request.delete('/article?id='+id)
}