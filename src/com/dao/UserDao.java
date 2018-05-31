package com.dao;

import java.util.List;

import com.model.User;

public interface UserDao {
  public int insert(User m);
  public int update(User m);
  public int delete(User m);
  public List select();
  public User select1();
}
