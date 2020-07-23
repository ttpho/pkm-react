export async function getPokemonsAsync() {
  const url =
    "https://raw.githubusercontent.com/ttpho/pkm-react/master/pokemon_json.json/pkms.json";
  let response = await fetch(url);
  let json = await response.json();
  return json;
}

export function wait(time) {
  var start = new Date().getTime();
  while (new Date().getTime() < start + time);
}

export default getPokemonsAsync;
