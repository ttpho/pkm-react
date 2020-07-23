import React, { useState, useEffect } from 'react';
import PokemonGrid from '../PokemonGrid';
import { getPokemonsAsync } from './api.js';

function Page() {
    const [results, setResults] = useState([])
    const [isLoading, setLoading] = useState(false)

    useEffect(() => {
        setLoading(true)
        getPokemonsAsync()
            .then((results) => {
                setResults(results)
            })
            .catch((error) => {
                console.error(error)
            })
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
