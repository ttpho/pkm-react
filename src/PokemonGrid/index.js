import React from 'react';
import { StyledPokemonGrid } from './style';
import PokemonItem from '../PokemonItem';


function PokemonGrid(props) {
    return <StyledPokemonGrid>
        {
            props
                .results
                .map((item) => { return <PokemonItem pokemon={item} /> })
        }
    </StyledPokemonGrid>
}

export default PokemonGrid;
