/**
 * This code was generated by Builder.io.
 */
import React from "react";
import styled from "styled-components";

function MenuItem({ name, price }) {
  return (
    <MenuItemContainer>
      <ItemImage />
      <ItemName>{name}</ItemName>
      <PriceContainer>
        <ItemPrice>{price}</ItemPrice>
        <AddButton aria-label="Add item">+</AddButton>
      </PriceContainer>
    </MenuItemContainer>
  );
}

const MenuItemContainer = styled.article`
  display: flex;
  flex-direction: column;
`;

const ItemImage = styled.div`
  background-color: #d9d9d9;
  width: 127px;
  height: 127px;
`;

const ItemName = styled.h3`
  color: #000;
  font-size: 20px;
  font-weight: 400;
  align-self: start;
  margin-top: 9px;
`;

const PriceContainer = styled.div`
  display: flex;
  gap: 20px;
  justify-content: space-between;
`;

const ItemPrice = styled.span`
  color: #d50000;
  font-size: 12px;
  font-weight: 400;
  margin: auto 0;
`;

const AddButton = styled.button`
  color: #fff;
  font-size: 32px;
  font-weight: 700;
  background: none;
  border: none;
  cursor: pointer;
`;

export default MenuItem;
