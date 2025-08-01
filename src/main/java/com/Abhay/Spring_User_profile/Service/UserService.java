package com.Abhay.Spring_User_profile.Service;

import com.Abhay.Spring_User_profile.Model.UserDetails;
import com.Abhay.Spring_User_profile.Repository.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepo repo;

    public void save(UserDetails ud) {
        repo.save(ud);

    }

    public List<UserDetails> findByUsernameAndPassword(UserDetails ud) {
        return repo.findByUsernameAndPassword(ud.getUsername(),ud.getPassword());
    }

    public Optional<UserDetails> findById(int userid) 
    {
        return repo.findById(userid);
    }

    public List<UserDetails> deleteById(int userid)
    {
        return repo.deleteById(userid);
    }
}
