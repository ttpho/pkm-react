import React from 'react';
import { StyledPokemonGrid } from './style';
import PokemonItem from '../PokemonItem';


class PokemonGrid extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            results: [],
            isLoading: true
        };
    }

    componentDidMount() {
        let url = "https://raw.githubusercontent.com/ttpho/Pokemon-Pocket/master/datas/pokemons.json"
        fetch(url)
            .then((response) => response.json())
            .then((json) => {
                this.setState({ results: json.results });
            })
            .catch((error) => console.error(error))
            .finally(() => {
                this.setState({ isLoading: false });
            });
    }

    render() {
        const { results, isLoading } = this.state;

        return (
            <div style={{ flex: 1, padding: 24 }}>
                {isLoading ? <h1>Loading...</h1> : (
                    <StyledPokemonGrid>
                        {
                            // remove duplicated item
                            results

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


                )}
            </div>
        );
    }

}


export default PokemonGrid;
