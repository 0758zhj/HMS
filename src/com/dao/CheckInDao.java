package com.dao;

import java.util.List;

import com.model.CheckIn;

public interface CheckInDao {
  public int insert(CheckIn m);
  public int update(CheckIn m);
  public int delete(int m);
  public List select();
  public CheckIn select1();
}
