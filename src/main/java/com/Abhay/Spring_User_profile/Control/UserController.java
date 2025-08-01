package com.Abhay.Spring_User_profile.Control;

import com.Abhay.Spring_User_profile.Model.UserDetails;
import com.Abhay.Spring_User_profile.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller

public class UserController
{
    @Autowired
    private UserService us;
    @GetMapping("/")
    public String Home(){
        System.out.println("Home page");
        return "Home.jsp";
    }

    @GetMapping("/register")
    public String userReg(){
        return "register.jsp";
    }

    @PostMapping("/register")
    public String userDetails(UserDetails ud, Model model)
    {
        if(!ud.getPassword().equals(ud.getConfirmPassword())){
            model.addAttribute("error","No match");
            return "register.jsp";
        }
        else
            us.save(ud);
            return "login.jsp";
    }

    @GetMapping("/login")
    public String UserLogin(){
        return "login.jsp";
    }

    @PostMapping("/login")
    public String userLoggedin(UserDetails ud,Model model){
        List<UserDetails> users=us.findByUsernameAndPassword(ud);
        if(!users.isEmpty()){
            UserDetails loggedin =users.get(0);
            model.addAttribute("userDetails", loggedin);
            return "Home.jsp";
        }
        else {
            model.addAttribute("error", "Invalid user");
            return "login.jsp";
        }
    }

    @GetMapping("/update")
    public String showUpdateForm(@RequestParam("userid")int userid,Model model){
        Optional<UserDetails> user= us.findById(userid);
        if(user.isPresent()){
            model.addAttribute("user",user.get());//In Java, Optional<T> is a wrapper that may or may not contain a value. You use .get() to extract that value when you're sure it is present.

            return "update.jsp";
        }
        else
            return "redirect:/";
    }

    @PostMapping("/update")
    public String updateUserDetails(UserDetails ud , Model model){
        us.save(ud);
        return "Home.jsp";
    }

    @PostMapping("/delete")
    public String deleteUser(@RequestParam("userid")int userid,Model model){
        us.deleteById(userid);
        return "redirect:/";
    }
}


