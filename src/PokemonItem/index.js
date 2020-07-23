import React from 'react';
import Image from '../Image';
import { StyledPokemonItem, StyledNamePokemonItem } from '../style';

function PokemonItem(props) {

  const onPokemonItemClicked = () => {
    let pokemon = props.pokemon
    window.open("https://www.google.com/search?q=" + pokemon.name, "_blank")
  }

  const pokemon = props.pokemon
  const imageUrl = "https://raw.githubusercontent.com/ttpho/pkm-react/master/pokemon_json.json/images/nationalNumber.png";
  const imageUrlNew = imageUrl.replace("nationalNumber", pokemon.national_number);
  const thumb = imageUrl //pokemon.sprites.animated || pokemon.sprites.normal | imageUrlNew

  return (
    <StyledPokemonItem onClick={onPokemonItemClicked}>
      <Image src={thumb} fallBackSrc={imageUrlNew} />
      <StyledNamePokemonItem>{pokemon.name}</StyledNamePokemonItem>
    </StyledPokemonItem>
  )
}

export default PokemonItem;
