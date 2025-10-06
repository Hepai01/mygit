<script setup>
import { Plus, Upload } from '@element-plus/icons-vue'
import {ref} from 'vue'
import avatar from '@/assets/default.png'
const uploadRef = ref()


//读取用户信息
import useUserInfoStore from '@/stores/userInfo'
const userInfoStore = useUserInfoStore()
console.log('头像地址='+userInfoStore.userInfo.userPic)
//用户头像地址
const imgUrl = ref(userInfoStore.userInfo.userPic)
//读取token信息
import { useTokenStore } from '@/stores/token'
const tokenStore = useTokenStore();
//图片上传成功后回调
const uploadSuccess = (result) => {
    imgUrl.value = result.data
    console.log('上传成功')
}
//更新头像
import {userAvatarUpdateService} from '@/api/user'
import { ElMessage } from 'element-plus'
const updateAvatar = async() => {
    let result = await userAvatarUpdateService(imgUrl.value);
    ElMessage.success(result.message ? result.message:'修改成功')
    //更新pinia
    userInfoStore.userInfo.userPic = imgUrl.value
    console.log('修改成功')
}
</script>

<template>
    <el-card class="page-container">
        <template #header>
            <div class="header">
                <span>更换头像</span>
            </div>
        </template>
        <el-row>
            <el-col :span="12">
                <el-upload 
                    ref="uploadRef"
                    class="avatar-uploader" 
                    :show-file-list="false"
                    action="/api/upload"
                    name="file"
                    :headers="{'Authorization': tokenStore.token}"
                    :on-success="uploadSuccess"
                    >
                    <img v-if="imgUrl" :src="'../src/assets/'+imgUrl" class="avatar" />
                    <img v-else src="@/assets/avatar.jpg" width="278" />
                </el-upload>
                <br />
                <el-button type="primary" :icon="Plus" size="large"  @click="uploadRef.$el.querySelector('input').click()">
                    选择图片
                </el-button>
                <el-button type="success" :icon="Upload" size="large" @click="updateAvatar">
                    上传头像
                </el-button>
            </el-col>
        </el-row>
    </el-card>
</template>

<style lang="scss" scoped>
.avatar-uploader {
    :deep() {
        .avatar {
            width: 278px;
            height: 278px;
            display: block;
        }

        .el-upload {
            border: 1px dashed var(--el-border-color);
            border-radius: 6px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: var(--el-transition-duration-fast);
        }

        .el-upload:hover {
            border-color: var(--el-color-primary);
        }

        .el-icon.avatar-uploader-icon {
            font-size: 28px;
            color: #8c939d;
            width: 278px;
            height: 278px;
            text-align: center;
        }
    }
}
</style>