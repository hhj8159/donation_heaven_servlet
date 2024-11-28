package servlet.member;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;

public class BcryptTest {
	public static void main(String[] args) {
		String password = "1234";
		String password2 = "12345";
		
		
		String crypt = BCrypt.withDefaults().hashToString(8, password.toCharArray());
		System.out.println(crypt);
		BCrypt.Result result = BCrypt.verifyer().verify("1234".toCharArray(),crypt);
		System.out.println(result.verified);
	}
}
