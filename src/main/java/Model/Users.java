package Model;

import java.io.File;
import java.io.Serializable;
import java.time.LocalDate;

import javax.servlet.http.Part;

import Controller.Utils.StringUtils;



public class Users implements Serializable{
	private String userName;
	private String firstName;
	private String lastName;
	private LocalDate birthday;
	private String address;
	private String gender;
	private String email;
	private String phone;
	private String userType;
	private String password;
	private String profilePic;
	
	public Users(String userName, String firstName, String lastName, LocalDate birthday, String address, String gender, String email, String phone, String userType, String password, Part profilePic) {
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.userType = userType;
		this.password = password;
		this.address = address;
		this.profilePic = getImageUrl(profilePic);
	}
	
	
	public Users(String userName, String firstName, String lastName, LocalDate birthday, String address, String email, String phone) {
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthday = birthday;
		this.address = address;
		this.email = email;
		this.phone = phone;
	}
	
	public Users() {
		
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public LocalDate getBirthday() {
		return birthday;
	}
	public void setBirthday(LocalDate birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	/**
	 * @return the profilePic
	 */
	public String getProfilePic() {
		return profilePic;
	}


	/**
	 * @param profilePic the profilePic to set
	 */
	public void setProfilePic(Part profilePic) {
		this.profilePic = getImageUrl(profilePic);
	}
	
	private String getImageUrl(Part part) {
		String savePath = StringUtils.IMAGE_DIR_SAVE_PATH;
		File fileSaveDir = new File(savePath);
		String imageUrlFromPart = null;
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
			imageUrlFromPart = "download.jpg";
		}
		return imageUrlFromPart;
}


	public String getUserType() {
		return userType;
	}


	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	
}
