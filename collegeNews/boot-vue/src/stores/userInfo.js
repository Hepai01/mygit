import { defineStore } from 'pinia';
import { ref } from 'vue';

const useUserInfoStore = defineStore('userInfo', ()=>{
    //定义状态相关内容
    const userInfo = ref({})

    const setInfo = (newInfo)=>{
        userInfo.value = newInfo
        console.log('newInfo'+userInfo.value)
    }
    const judgeRoot = () => {
        if( userInfo.value.username == 'w'){
            console.log("管理员")
            return true
        }else{
            console.log("普通用户")
            return false
        }
    }
    const removeInfo = ()=>{
        userInfo.value = {}
    }
    
    return {
        userInfo,
        setInfo,
        removeInfo,
        judgeRoot
    }

},{  persist: true  }) //打开持久化
export default useUserInfoStore;