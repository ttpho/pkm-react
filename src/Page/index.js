import React, { useState, useEffect } from 'react';
import PokemonGrid from '../PokemonGrid';

function Page() {
    const [results, setResults] = useState([])
    const [isLoading, setLoading] = useState(false)

    useEffect(() => {
        setLoading(true)
        const url = "https://raw.githubusercontent.com/ttpho/Pokemon-Pocket/master/datas/pokemons.json"
        fetch(url)
            .then((response) => response.json())
            .then((json) => {
                let newResults = json.results
                    .reduce((unique, o) => {
                        if (!unique.some(obj => obj.name === o.name)) {
                            unique.push(o);
                        }
                        return unique;
                    }, [])
                setResults(newResults)
            })
            .catch((error) => console.error(error))
            .finally(() => {
                setLoading(false)
            });
    }, [])

    return (
        <div style={{ flex: 1, padding: 24 }}>
            {isLoading
                ? <h1>Loading...</h1>
                : <PokemonGrid results={results} />
            }
        </div>
    );

}

export default Page;
