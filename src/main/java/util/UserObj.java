package util;

public class UserObj {
	private String id, password, name;
	
	public UserObj(String id, String password, String name) {
		this.id = id;
		this.password = password;
		this.name = name;
	}

	public String getId() { return this.id; }
	public String getPassword() { return this.password; }
	public String getName() { return this.name; }
	
}
