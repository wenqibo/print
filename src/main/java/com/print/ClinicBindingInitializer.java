package com.print;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

public class ClinicBindingInitializer implements WebBindingInitializer {

	public void initBinder(WebDataBinder binder, WebRequest request) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, false));
		DecimalFormat df = new DecimalFormat("0.00");
//		boolean allowEmpty : false 会引发一个fieldError，并会去资源文件读key为typeMismatch.java.lang.Double的值
//		boolean allowEmpty : true 则不会
		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, df, true));
	}

}
