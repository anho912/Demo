package com.an.dao;

import com.an.entity.CartInfo;

public interface CartInfoMapper {
    int deleteByPrimaryKey(Integer cInfoId);

    int insert(CartInfo record);

    int insertSelective(CartInfo record);

    CartInfo selectByPrimaryKey(Integer cInfoId);

    int updateByPrimaryKeySelective(CartInfo record);

    int updateByPrimaryKey(CartInfo record);
}