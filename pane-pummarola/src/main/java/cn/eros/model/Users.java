package cn.eros.model;

public class Users {
	private int id;
	private String name;
	private String email;
	private String password;
	private String indirizzo;
	private String carta; 
	
	
	public Users() {
	}


	public Users(int id, String name, String email, String password, String indirizzo, String carta) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.indirizzo = indirizzo;
		this.carta = carta;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	

	public String getIndirizzo() {
		return indirizzo;
	}


	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getCarta() {
		return carta;
	}


	public void setCarta(String carta) {
		this.carta = carta;
	}


	@Override
	public String toString() {
		return "Users [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", indirizzo="
				+ indirizzo + ", carta=" + carta + "]";
	}
	
}

  