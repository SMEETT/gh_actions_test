const express = require("express");
const cors = require("cors");
const { expressCspHeader, NONE, SELF, INLINE, EVAL } = require("express-csp-header");

const app = express();

if (process.env.NODE_ENV !== "production") {
	require("dotenv").config();
}

console.log(process.env.TEST_FRONTEND_URL);

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// CSP Header
app.use(
	expressCspHeader({
		directives: {
			"default-src": [SELF, process.env.TEST_FRONTEND_URL],
			"script-src": [SELF, INLINE, EVAL],
			"style-src": [SELF, INLINE, "https://fonts.googleapis.com", "https://fonts.gstatic.com"],
			"img-src": [SELF],
			"worker-src": [NONE],
			"block-all-mixed-content": true,
			"font-src": ["https://fonts.googleapis.com", "https://fonts.gstatic.com"],
			"frame-ancestors": [NONE],
			"connect-src": [SELF, process.env.TEST_FRONTEND_URL],
		},
	})
);

app.use(cors({ origin: [process.env.TEST_FRONTEND_URL] }));

app.get("/", function (req, res) {
	res.json({ username: "Flavio" });
});

app.listen(3003, () => {
	console.log("listening on port 3003");
});
