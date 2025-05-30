package org.example.anno;
import org.example.validation.StateValidation;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
@java.lang.annotation.Documented//标识元注解
@jakarta.validation.Constraint(validatedBy = {StateValidation.class})//指定提供校验规则的类
@java.lang.annotation.Target({ FIELD})//作用域元注解
@java.lang.annotation.Retention(RUNTIME)//保留元注解

public @interface State {
    //提供校验失败后的提示信息
    java.lang.String message() default "state 只能是 \"已发布\"或者\"草稿\" ";
    //指定分组
    java.lang.Class<?>[] groups() default {};
    //负载 获取到State注解的附加信息
    java.lang.Class<? extends jakarta.validation.Payload>[] payload() default {};
}

