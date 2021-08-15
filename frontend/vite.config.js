import { defineConfig } from "vite";

export default defineConfig({
	server: {
		port: 5003,
	},
	build: {
		cssCodeSplit: false,
		sourcemap: true,
	},
});
