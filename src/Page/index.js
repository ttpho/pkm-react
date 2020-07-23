import React, { useState, useEffect } from "react";
import PokemonGrid from "../PokemonGrid";
import { getPokemonsAsync, wait } from "./api.js";
import { StyledPagePokemon, StyledLoader } from "../style";
import Loader from "react-loader-spinner";

function Page() {
  const [results, setResults] = useState([]);
  const [isLoading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    getPokemonsAsync()
      .then((results) => {
        setResults(results);
      })
      .catch((error) => {
        console.error(error);
      })
      .finally(() => {
        wait(1_000);
        setLoading(false);
      });
  }, []);

  return (
    <StyledPagePokemon>
      {isLoading ? (
        <StyledLoader>
          <Loader type="Audio" color="#f1c40f" height={80} width={80} />
        </StyledLoader>
      ) : (
        <PokemonGrid results={results} />
      )}
    </StyledPagePokemon>
  );
}

export default Page;
