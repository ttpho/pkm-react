import React from 'react';
import pokemon_data from './pokemons.json';
import { StyledPokemonGrid } from './style';
import PokemonItem from '../PokemonItem';

function PokemonGrid() {
    return (
        <StyledPokemonGrid>
            {
                pokemon_data.results
                    // remove duplicated item
                    .reduce((unique, o) => {
                        if (!unique.some(obj => obj.name === o.name)) {
                            unique.push(o);
                        }
                        return unique;
                    }, [])
                    // create item 
                    .map((item) => {
                        return <PokemonItem pokemon={item} />
                    })
            }
        </StyledPokemonGrid>
    );
}

export default PokemonGrid;
