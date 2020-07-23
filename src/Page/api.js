export async function getPokemonsAsync() {
    const url = "https://raw.githubusercontent.com/ttpho/Pokemon-Pocket/master/datas/pokemons.json"
    let response = await fetch(url);
    let json = await response.json();
    return json.results.reduce((unique, o) => {
        if (!unique.some(obj => obj.name === o.name)) {
            unique.push(o);
        }
        return unique;
    }, []);
};

export default getPokemonsAsync;