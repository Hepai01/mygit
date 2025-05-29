package org.example.validation;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import org.example.anno.State;
                                                        //指定注解，校验数据类型
public class StateValidation implements ConstraintValidator<State,String> {
    /**
     *
     * @param s 将来要校验的数据
     * @param constraintValidatorContext context
     */
    @Override
    public boolean isValid(String s, ConstraintValidatorContext constraintValidatorContext) {
        if(s == null){
            return false;
        }
        return s.equals("已发布") || s.equals("草稿");
    }
}
