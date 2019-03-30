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
	private Pattern pattern;
	
	public RegisterValidator() {
		pattern = Pattern.compile(emailRegExp);
	}
	
	@Override
	public boolean supports(Class<?> claz) {
		return Register.class.isAssignableFrom(claz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		Register reg = (Register) target;
		
		if(reg.getMmail() == null || reg.getMmail().trim().isEmpty()) {
			errors.rejectValue("mmail", "required", "�ʼ� ���� �Դϴ�.");
		} else {
			Matcher matcher = pattern.matcher(reg.getMmail());
			if(!matcher.matches()) {
				errors.rejectValue("mmail", "bad", "�ùٸ��� �ʴ� �����Դϴ�.");
			}
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mname", "required", "�ʼ� ���� �Դϴ�.");
		ValidationUtils.rejectIfEmpty(errors, "mpw", "required", "�ʼ� ���� �Դϴ�.");
		ValidationUtils.rejectIfEmpty(errors, "checkPw", "required", "�ʼ� ���� �Դϴ�.");
		if(!reg.getMpw().isEmpty()) {
			if(!reg.PwEqualCheckPw()) {
				errors.rejectValue("checkPw", "nomatch", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			}
		}
	}
}
