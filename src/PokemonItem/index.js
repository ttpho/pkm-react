import React from 'react';
import Image from '../Image';
import { StyledPokemonItem, StyledNamePokemonItem } from './style';

class PokemonItem extends React.Component {
  onPokemonItemClicked = () => {
    let pokemon = this.props.pokemon
    window.open("https://www.google.com/search?q=" + pokemon.name, "_blank")
  }

  render() {
    let pokemon = this.props.pokemon

    var imageUrl = "https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/nationalNumber.png";
    var imageUrlNew = imageUrl.replace("nationalNumber", pokemon.national_number);

    let thumb = pokemon.sprites.animated || pokemon.sprites.normal | imageUrlNew

    return (
      <StyledPokemonItem onClick={this.onPokemonItemClicked}>
        <Image src={thumb} fallBackSrc={imageUrlNew} />
        <StyledNamePokemonItem>{pokemon.name}</StyledNamePokemonItem>
      </StyledPokemonItem>
    )
  }
}

export default PokemonItem;
