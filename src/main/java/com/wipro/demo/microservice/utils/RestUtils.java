package com.wipro.demo.microservice.utils;

import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

/**
 * Created by Fabrizio Torelli on 03/03/2017.
 */
public class RestUtils {

    public static void main(String[] args) {
        if (args.length==0) {
            System.out.println("Syntax: rest <url> [<method>]");
        }
        String url = args[0];
        try {
            RestTemplate restTemplate = new RestTemplate();
            System.out.println(restTemplate.getForObject(url, String.class));
        } catch (RestClientException e) {
            ;
        }

    }
}
