package com.company.spring.member;

@SuppressWarnings("serial")
public class ExistingEmailException extends RuntimeException{
	public ExistingEmailException(String message) {
		super(message);
	}
}
