package com.cognizant.spring_core_countries;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cognizant.spring_core_countries.model.Country;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@SpringBootApplication
public class SpringCoreCountriesApplication {
	private static final Logger LOGGER = LoggerFactory.getLogger(SpringCoreCountriesApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(SpringCoreCountriesApplication.class, args);
        displayCountries();  // Call to display the countries
    }

    public static void displayCountries() {
        LOGGER.info("START");

        // Load beans from country.xml
        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");

        @SuppressWarnings("unchecked")
        List<Country> countries = (List<Country>) context.getBean("countryList");

        // Log each country
        for (Country country : countries) {
            LOGGER.info(country.toString());  // Changed to INFO so it shows in console
        }

        LOGGER.info("END");
    }
}
