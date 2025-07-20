package com.cognizant.spring_core_countries.model;

public class Country {
	private String code;
    private String name;

    // Getters & Setters
    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    // toString() for logging
    @Override
    public String toString() {
        return "Country{code='" + code + "', name='" + name + "'}";
    }
}	
