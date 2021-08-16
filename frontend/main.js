import "./style.css";

document.querySelector("#app").innerHTML = `
  <h1>Hello Vite!</h1>
  <h1>Hello World!</h1>
  <h1>some deployyy</h1>
  <a href="https://vitejs.dev/guide/features.html" target="_blank">Documentation</a>
`;
fetch("https://testback.borisfries.dev")
	.then((response) => response.json())
	.then((data) => console.log(data));
