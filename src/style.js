import styled from "styled-components";

export const StyledImage = styled.img``;

export const StyledPokemonGrid = styled.div`
  padding: 15px;
  display: inline-block;
  width: 100%;
`;

export const StyledPokemonItem = styled.div`
  float: left;
  min-height: 137px;
  width: 100px;

  ${StyledImage} {
    width: 80px;
    height: 80px;
  }
`;

export const StyledNamePokemonItem = styled.p`
  text-align: center;
`;

export const StyledPagePokemon = styled.div`
  flex: 1;
  padding: 24;
`;

export const StyledLoader = styled.div`
  position: absolute;
  top: 30%;

  height: 80px;
  width: 80px;

  left: 0;
  right: 0;
  margin: 0 auto;
`;
