package kh.bookday.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/delivery/")
public class DeliveryController {
	
	@RequestMapping("toBookbag")
	public String toBookbag() {
		return "/delivery/bookbag";
	}

}