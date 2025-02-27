package com.ebilling.bean;

public class CalcBill {
private int cid;
	private int userid;
private int unitConsumed;
private String zoneName;
private String month;
private String name;
private String year;
private String status;
private int dues;
private int payamt;

public int getPayamt() {
	return payamt;
}
public void setPayamt(int payamt) {
	this.payamt = payamt;
}
public int getDues() {
	return dues;
}
public void setDues(int dues) {
	this.dues = dues;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public int getUnitConsumed() {
	return unitConsumed;
}
public void setUnitConsumed(int unitConsumed) {
	this.unitConsumed = unitConsumed;
}
public String getZoneName() {
	return zoneName;
}
public void setZoneName(String zoneName) {
	this.zoneName = zoneName;
}
public String getMonth() {
	return month;
}
public void setMonth(String month) {
	this.month = month;
}


}
