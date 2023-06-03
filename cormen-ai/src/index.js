import React from "react";
import ReactDOM from "react-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "@fortawesome/fontawesome-free/css/all.css";
import "./css/style.css";

const App = () => {
  return (
    <div className="App">
      <header class="p-3">
        <div class="container-fluid">
          <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a
              href="/"
              class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none"
            >
              <img
                class="bi me-5"
                width="60"
                height="50"
                role="img"
                aria-label="Bootstrap"
                src="https://blz04pap001files.storage.live.com/y4mZ8cjjVnkym2fbMSFxM_HT1A8PVSxz4jdCCznSqQ8-BODCcvAq-OcUICMQtoeFP-DuEiXb0D9E5fKsucwaPFg7Djc-rP1yIzi-tG1teZCNtMJOlGAWlnRJekTrEcduFnlsR9TrqEAJIJyIDbjiMl_iZYcbWT4ZdljV88Zs4wS4Woj31xVPiQh_yEEq5iJ0tP9?width=289&height=221&cropmode=none"
                alt="CormenAI logo"
              />
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
              <li>
                <a class="nav-link px-2 text-white">Início</a>
              </li>
            </ul>

            <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
              <input
                type="search"
                class="form-control form-control-dark"
                placeholder="Search..."
                aria-label="Search"
              />
            </form>

            <div class="text-end">
              <button type="button" class="btn btn-outline-light me-2">
                Login
              </button>
              <button type="button" class="btn btn-purple">
                Sign-up
              </button>
            </div>
          </div>
        </div>
      </header>
      <main>
        <div class="container-fluid">
          <div class="p-4 text-white rounded bg-dark">
            <div class="col-md-6 px-0">
              <h1>Cormen AI Solutions</h1>
              <p class="lead my-3">
                Tecnologia do futuro para problemas do presente.
              </p>
            </div>
          </div>
        </div>
      </main>
      <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-bot">
        <div class="col-md-4 d-flex align-items-center">
          <a
            href="/"
            class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1"
          >
            <svg class="bi" width="30" height="24">
              <use xlinkHref="#"></use>
            </svg>
          </a>
          <span class="mb-3 mb-md-0 text-white">
            © 2023 Cormen AI Solutions, Inc
          </span>
        </div>
      </footer>
    </div>
  );
};

ReactDOM.render(<App />, document.querySelector("#root"));
