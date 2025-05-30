package org.example.controller;

import jakarta.validation.constraints.Pattern;
import org.example.pojo.Result;
import org.example.pojo.User;
import org.example.service.UserService;
import org.example.utils.JwtUtil;
import org.example.utils.Md5Util;
import org.example.utils.ThreadLocalUtil;
import org.hibernate.validator.constraints.URL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user")
@Validated
public class UserController {
    @Autowired
    private UserService userService;
    @PostMapping("/register")
    public Result register(@Pattern(regexp = "^\\S{1,16}$") String username,
                           @Pattern(regexp = "^\\S{4,16}$") String password){
        //查询用户
        User u = userService.findByName(username);
        if(u==null){
            //不存在则注册成功
            userService.register(username,password);
            return Result.success();
        }else {
            //用户名重复则失败
            return Result.error("该用户已存在");
        }
    }
    @PostMapping("/login")
    public Result<String> login(@Pattern(regexp = "^\\S{1,16}$") String username,
                                @Pattern(regexp = "^\\S{4,16}$") String password){
        //根据名称查询用户
        User loginUser = userService.findByName(username);
        //判断用户是否存在
        if(loginUser==null){
            return Result.error("用户名错误");
        }
        //判断密码是否正确，password已经加密
        if(Md5Util.getMD5String(password).equals(loginUser.getPassword())){
            //登录成功
            Map<String, Object> claims = new HashMap<>();
            claims.put("id",loginUser.getId());
            claims.put("username",loginUser.getUsername());
            String token = JwtUtil.getToken(claims);
            return Result.success(token);
        }
        return Result.error("密码错误");
    }
    @GetMapping("/userInfo")
    public Result<User>  userInfo(){
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");
        User user = userService.findByName(username);
        return Result.success(user);
    }
    @PutMapping("/update")
    public Result update(@RequestBody @Validated User user){
        userService.update(user);
        return Result.success();
    }
    @PatchMapping("/updateAvatar")
    public Result updateAvatar(@RequestParam @URL String avatarUrl){
        userService.updateAvatar(avatarUrl);
        return Result.success();
    }
    @PatchMapping("/updatePwd")
    public Result updatePwd(@RequestBody Map<String, String> params){
        //校验参数
        String oldPwd = params.get("old_pwd");
        String newPwd = params.get("new_pwd");
        String rePwd = params.get("re_pwd");
        if(!(StringUtils.hasLength(oldPwd) || StringUtils.hasLength(newPwd) || StringUtils.hasLength(rePwd))){
            return Result.error("缺少必要的参数");
        }
          //验证原密码，调用userService根据用户名拿到原密码与old_pwd对比
        Map<String, Object> map = ThreadLocalUtil.get();
        String username = (String) map.get("username");
        User loginUser = userService.findByName(username);
        if(!loginUser.getPassword().equals(Md5Util.getMD5String(oldPwd))){
            return Result.error("原密码不正确");
        }
          //newPwd和rePwd是否一样
        if(!rePwd.equals(newPwd)){
            return Result.error("两次输入的新密码不一致");
        }
        if(!newPwd.matches(("^\\S{5,16}")))
            return Result.error("新密码格式不正确");
        //调用service完成密码更新
        userService.updatePwd(newPwd);
        return Result.success();
    }
}
