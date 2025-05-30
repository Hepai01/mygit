package org.example;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.junit.jupiter.api.Test;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class JwtTest {
    @Test
    public void testJwt(){
        Map<String,Object> claims = new HashMap<>();
        claims.put("id",1);
        claims.put("username","小明");
        //生成jtw的代码
        String token = JWT.create()
                .withClaim("user",claims)//添加载荷
                .withExpiresAt(new Date(System.currentTimeMillis()+1000*60*60))//指定过期时间
                .sign(Algorithm.HMAC256("boot_vue"));//指定算法加密，得到密钥
        System.out.println(token);
    }
    @Test
    public void testParse(){
        //测试JWT
        String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9" +
                ".eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6IuWwj-aYjiJ9LCJleHAiOjE3MDk4OTk5OTB9" +
                ".wWznkIImXs_oeDVLJOPlCdPSwtawk-iBT4oDsOtKTzs";
        JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256("boot_vue")).build();
        DecodedJWT decodedJWT = jwtVerifier.verify(token);//验证token,生成解析后的JWT
        Map<String, Claim> claims = decodedJWT.getClaims();
        System.out.println(claims.get("user"));
    }
}
