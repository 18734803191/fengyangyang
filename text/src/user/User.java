package user;

import java.sql.Date;

public class User {
private int id;
private String username;
private String password;
private Date birthday;
private String type;
private String address;
public User(){
	
}

public User(String username, String password, Date birthday,String address,String type) {
	super();
	this.username = username;
	this.password = password;
	this.birthday = birthday;
	this.type = type;
	this.address = address;
}

public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}


}
