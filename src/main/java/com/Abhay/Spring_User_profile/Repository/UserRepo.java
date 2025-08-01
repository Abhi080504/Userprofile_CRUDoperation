package com.Abhay.Spring_User_profile.Repository;

import com.Abhay.Spring_User_profile.Model.UserDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepo extends JpaRepository<UserDetails,Integer>
{
    List<UserDetails> findByUsernameAndPassword(String username, String password);

    Optional<UserDetails> findById(Integer integer);
    List<UserDetails> deleteById(int userid);

}
