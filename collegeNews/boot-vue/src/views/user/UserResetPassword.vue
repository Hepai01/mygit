<script setup>
import { ref } from 'vue'
const registerData = ref({
    old_pwd: '',
    new_pwd: '',
    re_pwd: ''
})
//定义表单验证规则
const rules = ref({
    old_pwd: [
        { required: true, message: '请输入原密码', trigger: 'blur' },
        { min: 5, max: 16, message: '密码长度需在5到15个字符之间', trigger: 'blur' }
    ],
    new_pwd: [
        { required: true, message: '请输入新密码', trigger: 'blur' },
        { min: 5, max: 16, message: '密码长度需在5到15个字符之间', trigger: 'blur' }
    ],
    re_pwd: [
        { required: true, message: '请再次输入密码', trigger: 'blur' },
        {
            validator: (rule, value, callback) => {
                if (value !== registerData.value.new_pwd) {
                    callback(new Error('两次输入的密码不一致'))
                } else {
                    callback()
                }
            },
            trigger: 'blur'
        }
    ]
})
//修改密码
import { ElMessage } from 'element-plus';
import { userPasswordUpdateService} from '@/api/user'
import { useTokenStore } from '@/stores/token.js';
import { useRouter } from 'vue-router';
const tokenStore = useTokenStore();
const router = useRouter();
const updatePassword = async() =>{
    console.log(registerData.value);
    let result = await userPasswordUpdateService(registerData.value);
    ElMessage.success(result.message ? result.message:'修改成功')
    tokenStore.removeToken();
    router.push('/login');
}
</script>
<template>
    <el-card class="page-container">
        <template #header>
            <div class="header">
                <span>基本资料</span>
            </div>
        </template>
        <el-row>
            <el-col :span="12">
                <el-form :model="registerData" :rules="rules" label-width="150px" size="large">
                    <el-form-item label="请输入原密码" prop="old_pwd">
                        <el-input v-model="registerData.old_pwd" ></el-input>
                    </el-form-item>
                    <el-form-item label="请输入新密码" prop="new_pwd" >
                        <el-input v-model="registerData.new_pwd" type="password"></el-input>
                    </el-form-item>
                    <el-form-item label="请再次输入新密码" prop="re_pwd">
                        <el-input v-model="registerData.re_pwd" type="password"></el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-button type="primary" @click="updatePassword">提交修改</el-button>
                    </el-form-item>
                </el-form>
            </el-col>
        </el-row>
    </el-card>
</template>