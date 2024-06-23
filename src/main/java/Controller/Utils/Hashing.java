package Controller.Utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Hashing {
	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	public String hashingPassword(String password) {
		
		String bCryptedPassword = bCryptPasswordEncoder.encode(password);
		return bCryptedPassword;
	}

	public boolean matchedPassword(String password,String storePassword) {
	boolean matched = bCryptPasswordEncoder.matches(password, storePassword);
	return matched;
}
}
