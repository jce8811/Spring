package com.company.spring.member;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterValidator implements Validator{
	
	private static final String emailRegExp = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
		    "[A-Za-z0-0-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	private static final String pwRegExp = 
			"^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$";
	private Pattern pattern;
	private Pattern pattern1;
	
	
	
	public RegisterValidator() {
		pattern = Pattern.compile(emailRegExp);
		pattern1 = Pattern.compile(pwRegExp);
	}
	
	@Override
	public boolean supports(Class<?> claz) {
		return MemberVO.class.isAssignableFrom(claz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Register reg = (Register) target;
		
		if(reg.getMmail() == null || reg.getMmail().trim().isEmpty()) {
			errors.rejectValue("mmail", "required", "필수 정보 입니다.");
		} else {
			Matcher matcher = pattern.matcher(reg.getMmail());
			if(!matcher.matches()) {
				errors.rejectValue("mmail", "bad", "올바르지 않는 형식입니다.");
			}
		}
		
		if(reg.getMpw() == null || reg.getMpw().trim().isEmpty()) {
			errors.rejectValue("mpw", "required", "필수 정보 입니다.");
		} else {
			Matcher matcher = pattern1.matcher(reg.getMpw());
			if(!matcher.matches()) {
				errors.rejectValue("mpw", "bad", "영문, 숫자 혼합하여 6~20자리 이내로 입력해주세요");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mname", "required", "필수 정보 입니다.");
		ValidationUtils.rejectIfEmpty(errors, "checkPw", "required", "필수 정보 입니다.");
		if(!reg.getMpw().isEmpty()) {
			if(!reg.PwEqualCheckPw()) {
				errors.rejectValue("checkPw", "nomatch", "비밀번호가 일치하지 않습니다.");
			}
		}
	}
}
