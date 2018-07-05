package com.an.utils;

import java.security.InvalidParameterException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;

@Component("dateUtil")
public class DateUtil {

	/**
	 * 日期增加
	 *
	 * @param date
	 * @param calendarType
	 * @param calendarValue
	 * @return
	 */
	public Date add(Date date, int calendarType, int calendarValue) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(calendarType, calendarValue);
		return calendar.getTime();
	}

	/**
	 * 日期增加n年
	 *
	 * @param date
	 *            日期
	 * @param year
	 *            年数
	 * @return
	 */
	public Date addYear(Date date, int year) {
		return add(date, Calendar.YEAR, year);
	}

	/**
	 * 日期增加n月
	 *
	 * @param date
	 *            日期
	 * @param month
	 *            月数
	 * @return
	 */
	public Date addMonth(Date date, int month) {
		return add(date, Calendar.MONTH, month);
	}

	/**
	 * 日期增加n天
	 *
	 * @param date
	 *            日期
	 * @param day
	 *            天数
	 * @return
	 */
	public Date addDay(Date date, int day) {
		return add(date, Calendar.DAY_OF_YEAR, day);
	}

	/**
	 * 日期减少n年
	 *
	 * @param date
	 *            日期
	 * @param year
	 *            年数
	 * @return
	 */
	public Date minusYear(Date date, int year) {
		return add(date, Calendar.YEAR, -year);
	}

	/**
	 * 日期减少n月
	 *
	 * @param date
	 *            日期
	 * @param month
	 *            月数
	 * @return
	 */
	public Date minusMonth(Date date, int month) {
		return add(date, Calendar.MONTH, -month);
	}

	/**
	 * 日期减少n天
	 *
	 * @param date
	 *            日期
	 * @param day
	 *            天数
	 * @return
	 */
	public Date minusDay(Date date, int day) {
		return add(date, Calendar.DAY_OF_YEAR, -day);
	}

	/**
	 * 计算两个时间之间相差的分钟数
	 *
	 * @param startDate
	 * @param endDate
	 * @return
	 * @author yintao
	 * @createDate 2018年1月29日
	 */
	public long getMinutesDiffFloor(Date startDate, Date endDate) {
		if (startDate == null || endDate == null) {
			throw new InvalidParameterException("startDate and endDate cannot be null!");
		}
		if (startDate.after(endDate)) {
			throw new InvalidParameterException("startDate cannot be after endDate!");
		}
		long differenceTime = (endDate.getTime() - startDate.getTime()) / (1000 * 60);
		return differenceTime;
	}
	
	/**
	 * 日期格式化
	 *
	 * @param date
	 *            日期
	 * @param formate
	 *            格式，以本类定义的格式为准，可自行添加。
	 * @return
	 *
	 */
	public String dateToString(Date date, String formate) {
		if (date == null) {
			return "";
		}

		return new SimpleDateFormat(formate).format(date);
	}

	/**
	 * 字符串转日期
	 *
	 * @param dateString
	 * @param format
	 *            日期格式
	 * @return
	 *
	 */
	public Date strToDate(String dateString, String format) {
		if (dateString == null) {
			throw new InvalidParameterException("dateString cannot be null!");
		}
		try {
			return new SimpleDateFormat(format).parse(dateString);
		} catch (ParseException e) {
			throw new RuntimeException("parse error! [dateString:" + dateString + ";format:" + format + "]");
		}
	}

	/**
	 * 判断是否过期
	 *
	 * @param validTime
	 *            生产日期
	 * @param time
	 *            有效期 单位秒
	 * @return
	 *
	 */
	public boolean isInValidTime(Date validTime, int time) {
		long currTime = System.currentTimeMillis();
		long valid = validTime.getTime();

		return ((currTime - valid) < time * 1000);
	}

	/**
	 * 正则校验是否符合年月日格式 yyyy-mm-dd
	 * 
	 * @param date
	 * @return
	 */
	public boolean isDate(String date) {
		String dataString = "([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))";
		Pattern pattern = Pattern.compile(dataString);
		Matcher matcher = pattern.matcher(date);
		return matcher.matches();
	}
}
