import React from "react";
import ReactDOM from "react-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "@fortawesome/fontawesome-free/css/all.css";
import "./css/style.css";
import Home from "./components/Home";

const App = () => {
  return (
    <div className="Home">
    <Home />
    </div>
);
 
}

ReactDOM.render(<App />, document.querySelector("#root"));
