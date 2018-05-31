package com.dao;

import java.util.List;

import com.model.Order;

public interface OrderDao {
  public int insert(Order m);
  public int update(Order m);
  public int delete(Order m);
  public List select();
  public Order select1();
}
