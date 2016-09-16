package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dao.MicroBrewDao;

@Controller
public class MicroBrewController {
	@Autowired
	private MicroBrewDao dao;

}
