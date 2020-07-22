import styled from 'styled-components';

export const StyledImage = styled.img``;


export const StyledPokemonGrid = styled.div`
    padding: 15px;
    display: inline-block;
    width: 100%;
`;

export const StyledPokemonItem = styled.div`
    float: left;
    min-height: 137px;
    width: 80px;

    ${StyledImage}{
        width: 100%;
        height: 80px;
    }
`;

export const StyledNamePokemonItem = styled.p``;
